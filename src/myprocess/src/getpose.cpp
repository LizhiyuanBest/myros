/*
 * get the pose of object by using pcl
 *
 */
#define BOOST_TYPEOF_EMULATION
#include <vtkAutoInit.h>
VTK_MODULE_INIT(vtkRenderingOpenGL);
VTK_MODULE_INIT(vtkInteractionStyle);

// ROS headers
#include <ros/ros.h>
#include <sensor_msgs/Image.h>
#include <std_msgs/Float32MultiArray.h>
#include <cv_bridge/cv_bridge.h>
#include <sensor_msgs/image_encodings.h>
#include <sensor_msgs/PointCloud2.h>
#include <eigen_conversions/eigen_msg.h>
// C++ headers
#include <iostream>
#include <string>
#include <signal.h> 
#include <cstdlib>
#include <chrono> 
#include <thread>

// opencv headers 
#include <opencv2/opencv.hpp>
// PCL headers
#include <pcl_ros/transforms.h>
#include <pcl/pcl_base.h>
#include <pcl_conversions/pcl_conversions.h>
#include <pcl/visualization/cloud_viewer.h>
#include <pcl/visualization/pcl_visualizer.h>
#include <pcl/console/print.h>
#include <pcl/console/parse.h>
#include <pcl/console/time.h>
#include <pcl/io/ply_io.h>
#include <pcl/io/pcd_io.h>
#include <pcl/point_cloud.h>
#include <pcl/point_types.h>
#include <Eigen/Core>
#include <Eigen/Eigen>
#include <Eigen/Dense>
#include <Eigen/Geometry>
#include <Eigen/Eigenvalues>

#include <pcl/ModelCoefficients.h>

#include <pcl/sample_consensus/method_types.h>//RANSAC头文件
#include <pcl/sample_consensus/model_types.h>
#include <pcl/segmentation/sac_segmentation.h>

#include <pcl/filters/extract_indices.h>
#include <pcl/segmentation/extract_clusters.h>//欧几里得聚类算法头文件
#include <pcl/segmentation/region_growing.h>//区域生长法
#include <pcl/segmentation/region_growing_rgb.h>//区域生长法 RGB
#include <pcl/features/normal_3d.h>
#include <pcl/filters/filter.h>

#include <pcl/common/common.h>
#include <pcl/filters/passthrough.h> 
#include <pcl/filters/voxel_grid.h>
#include <pcl/filters/statistical_outlier_removal.h>//StatisticalOutlierRemoval滤波
#include <pcl/filters/radius_outlier_removal.h> //半径滤波

#include <pcl/registration/ia_ransac.h>
#include <pcl/point_types.h>
#include <pcl/features/fpfh.h>
#include <pcl/search/kdtree.h>
#include <pcl/filters/crop_box.h>
#include <pcl/registration/icp.h>
#include <time.h>
#include "mykinect2/mykinect.h"
#include "myprocess/process_points.h"
#include "myprocess/myprocess_pose.h"
#include "myprocess/myprocess_position.h"

typedef pcl::PointXYZRGBA PointT;
enum ProcessStatus{
	START, FINISH, NEXT
};
ProcessStatus process_status = NEXT;


pcl::PointCloud<PointT>::Ptr cloud_tgt_to_show(new pcl::PointCloud<PointT>);//显示用的目标点云

//由旋转平移矩阵计算旋转角度
void matrix2angle(Eigen::Matrix4f &result_trans, Eigen::Vector3f &result_angle) {
    double ax, ay, az;
    if (result_trans(2, 0) == 1 || result_trans(2, 0) == -1)
    {
        az = 0;
        double dlta;
        dlta = atan2(result_trans(0, 1), result_trans(0, 2));
        if (result_trans(2, 0) == -1)
        {
            ay = M_PI / 2;
            ax = az + dlta;
        }
        else
        {
            ay = -M_PI / 2;
            ax = -az + dlta;
        }
    }
    else
    {
        ay = -asin(result_trans(2, 0));
        ax = atan2(result_trans(2, 1) / cos(ay), result_trans(2, 2) / cos(ay));
        az = atan2(result_trans(1, 0) / cos(ay), result_trans(0, 0) / cos(ay));
    }
    result_angle << ax, ay, az;
}

class ClientAndPublish  
{  
public:  
    ClientAndPublish()  
    {  
        count = 0;
        //Topic you want to publish    
        pose_pub = n.advertise<std_msgs::Float64MultiArray>("/process/pose",1);
        position_pub = n.advertise<std_msgs::Float64MultiArray>("/process/position",1);
        points_pub = n.advertise<myprocess::process_points>("/process/points",10);
        // src_cloud_pub = n.advertise<sensor_msgs::PointCloud2>("/process/src_points", 1);
        // tgt_cloud_pub = n.advertise<sensor_msgs::PointCloud2>("/process/tgt_points", 1);
        // res_cloud_pub = n.advertise<sensor_msgs::PointCloud2>("/process/res_points", 1);
        //Topic you want to subscribe  
        // pose_sub = n.subscribe("/process/pose",1,&ClientAndPublish::poseCallback,this);
        // position_sub = n.subscribe("/process/position",1,&ClientAndPublish::positionCallback,this);
        //发现/kinect2/cloud 服务后，创建一个服务客户端，连接名为/kinect2/cloud 的server
        ros::service::waitForService("/kinect2/cloud");
        cloud_client = n.serviceClient<mykinect2::mykinect>("/kinect2/cloud");

        //创建一个名为/kinect2/cloud的server, 注册回调函数 cloudCallback
        // pose_service = n.advertiseService("/process/pose_service", &ClientAndPublish::poseServiveCallback, this);
        // position_service = n.advertiseService("/process/position_service", &ClientAndPublish::positionServiveCallback, this);
        // ROS_INFO("pose server ");
    }  

    void myprocess(pcl::PointCloud<PointT>::Ptr cloud_src);
    bool poseServiveCallback(myprocess::myprocess_pose::Request &req, myprocess::myprocess_pose::Response &res);
    bool positionServiveCallback(myprocess::myprocess_position::Request &req, myprocess::myprocess_position::Response &res);
    // void positionCallback(const std_msgs::Float64MultiArray::ConstPtr& msg);
    // void poseCallback(const std_msgs::Float64MultiArray::ConstPtr& msg);

    ros::ServiceClient cloud_client;
private:  
    ros::NodeHandle n;   
    ros::Publisher pose_pub;  
    ros::Publisher position_pub; 
    ros::Publisher points_pub;
    ros::ServiceServer pose_service;
    ros::ServiceServer position_service;
 
    std_msgs::Float64MultiArray pose_msg;
    std_msgs::Float64MultiArray position_msg;
    std_msgs::Float64MultiArray pose_msg_srv;
    std_msgs::Float64MultiArray position_msg_srv;
    int count; 

};//End of class SubscribeAndPublish  




int main(int argc, char **argv)  
{  
    //Initiate ROS  
    ros::init(argc,argv,"get_pose");

    //Create an object of class SubscribeAndPublish that will take care of everything  
    ClientAndPublish getpose;  
    //ros::spin();
    // ros::MultiThreadedSpinner s(2);  //多线程
    // ros::spin(s);  

    //初始化 mykinect2::mykinect 的请求数据
	mykinect2::mykinect srv;
	srv.request.name.data = "cloud";

	//请求服务调用
	getpose.cloud_client.call(srv);
    
    static pcl::visualization::CloudViewer viewer ("Viewer");  //创建一个显示点云的窗口

    pcl::PointCloud<PointT>::Ptr cloud(new pcl::PointCloud<PointT>());
	//设置循环刷新的频率
	//ros::Rate loop_rate(0.1);
	int count = 0;
    while(ros::ok()){

        //初始化sensor_msgs::Image 消息类型
        std::cout<<"process_status:"<< process_status<<endl;
        //请求服务调用
        getpose.cloud_client.call(srv);
        //将接收到的消息打印出来
        ROS_INFO("got cloud");
        const sensor_msgs::PointCloud2 msg = srv.response.result;
        pcl::fromROSMsg (msg, *cloud);
        viewer.showCloud(cloud); 
        pcl::io::savePCDFileASCII("/home/li/ROS/myros/cloud/original.pcd", *cloud);

        if (process_status == NEXT){
                process_status = START;
                getpose.myprocess(cloud);
        }
        else if(process_status == FINISH){

            process_status = NEXT;
        }
        //ros::spinOnce();//这句就是同时发布节点和订阅节点的关键了
		//按照循环频率延时
		//loop_rate.sleep();
    }


  return 0;  
}  


// service 回调函数，输入参数req，输出参数res
bool ClientAndPublish::poseServiveCallback(myprocess::myprocess_pose::Request &req, myprocess::myprocess_pose::Response &res)
{
	//设置反馈数据
	res.result = pose_msg_srv;
    std::cout<<"position_msg_srv"<<position_msg_srv.data.size()<<endl;
    std::cout<<"pose_msg_srv"<<pose_msg_srv.data.size()<<endl;
	return true;
}

// service 回调函数，输入参数req，输出参数res
bool ClientAndPublish::positionServiveCallback(myprocess::myprocess_position::Request &req, myprocess::myprocess_position::Response &res)
{
	//设置反馈数据
	res.result = position_msg_srv;
    std::cout<<"position_msg_srv"<<position_msg_srv.data.size()<<endl;
    std::cout<<"pose_msg_srv"<<pose_msg_srv.data.size()<<endl;
	return true;
}

//点云可视化
void visualize_pcd(pcl::PointCloud<PointT>::Ptr pcd_src, pcl::PointCloud<PointT>::Ptr pcd_tgt, pcl::PointCloud<PointT>::Ptr pcd_final)
{
     std::stringstream ss;
     static int times = 0;
    std::cout<<"view :"<<times<<endl;
	// ss << "registration Viewer" << times;
	// Create a PCLVisualizer object
    // pcl::visualization::PCLVisualizer viewer(ss.str());
	static pcl::visualization::PCLVisualizer viewer("registration Viewer");
	viewer.setBackgroundColor(255,255,255);
	pcl::visualization::PointCloudColorHandlerCustom<PointT> src_h(pcd_src, 0, 255, 0);
	//pcl::visualization::PointCloudColorHandlerCustom<PointT> tgt_h(pcd_tgt, 255, 0, 0);
	pcl::visualization::PointCloudColorHandlerCustom<PointT> final_h(pcd_final, 0, 0, 255);

    if(times>0){
        viewer.removeAllPointClouds();
    }

	viewer.addPointCloud(pcd_src, src_h, "source cloud "+std::to_string(times));
	// viewer.addPointCloud(pcd_tgt, tgt_h, "tgt cloud"+std::to_string(times));
    viewer.addPointCloud(pcd_tgt, "tgt cloud"+std::to_string(times));
	viewer.addPointCloud(pcd_final, final_h, "final cloud"+std::to_string(times));
    // while (!viewer.wasStopped())
    // {
    //     viewer.spinOnce(100);
    //     boost::this_thread::sleep(boost::posix_time::microseconds(100000));
    // }
    times++;
    if(times>100){
        times=1;
    }
    std::cout<<"really show :"<<times<<endl;
        
}


//图像处理函数
void ClientAndPublish::myprocess(pcl::PointCloud<PointT>::Ptr cloud_src)
{
	//pcl::PointCloud<PointT>::Ptr cloud_src(new pcl::PointCloud<PointT>);
	//pcl::io::loadPCDFile("./004.pcd", *cloud_src);

	pcl::PassThrough<PointT> pass;//直通滤波
	pass.setInputCloud(cloud_src);
	pass.setFilterFieldName("x");
	pass.setFilterLimits(-0.22, 0.2);
	pass.setFilterLimitsNegative(false);
	pass.filter(*cloud_src);

	pass.setInputCloud(cloud_src);
	pass.setFilterFieldName("y");
	pass.setFilterLimits(-0.15, 0.15);
	pass.setFilterLimitsNegative(false);
	pass.filter(*cloud_src);


	//创建一个模型参数对象，用于记录结果
	pcl::ModelCoefficients::Ptr coefficients(new pcl::ModelCoefficients);
	//inliers表示误差能容忍的点 记录的是点云的序号
	pcl::PointIndices::Ptr inliers(new pcl::PointIndices);
	// 创建一个分割器
	pcl::SACSegmentation<PointT> seg;
	// Optional
	seg.setOptimizeCoefficients(true);
	// Mandatory-设置目标几何形状
	seg.setModelType(pcl::SACMODEL_PLANE);//plane
	//分割方法：随机采样法
	seg.setMethodType(pcl::SAC_RANSAC);
	//设置误差容忍范围
	seg.setDistanceThreshold(0.006);
	seg.setMaxIterations(100);//迭代次数
	//输入点云
	seg.setInputCloud(cloud_src);
	//分割点云
	seg.segment(*inliers, *coefficients);
	std::cerr << coefficients->values[0]<<" "<<coefficients->values[1]<<" "<< coefficients->values[2] << " " << coefficients->values[3] << std::endl;


	pcl::PointCloud<PointT>::Ptr cloud(new pcl::PointCloud<PointT>);
	for (std::vector<int>::const_iterator pit = inliers->indices.begin(); pit != inliers->indices.end(); ++pit)
		//设置保存点云的属性问题
		cloud->points.push_back(cloud_src->points[*pit]); //将点从原点云存储到新的点云
	cloud->width = cloud->points.size();
	cloud->height = 1;
	cloud->is_dense = true;


	PointT minPt, maxPt;
	pcl::getMinMax3D(*cloud, minPt, maxPt);//取得极值

	//pcl::PassThrough<PointT> pass;//直通滤波
	pass.setInputCloud(cloud_src);
	pass.setFilterFieldName("z");
	pass.setFilterLimits(minPt.z, maxPt.z);
	pass.setFilterLimitsNegative(true);
	pass.filter(*cloud);

	pcl::StatisticalOutlierRemoval<PointT> sor;//StatisticalOutlierRemoval滤波
	sor.setInputCloud(cloud);
	sor.setMeanK(10);//临近点的数量
	sor.setStddevMulThresh(0.01);//阈值
	sor.filter(*cloud);

	pcl::RadiusOutlierRemoval<PointT> outrem;//半径滤波
	outrem.setInputCloud(cloud);
	outrem.setRadiusSearch(0.01);//设置在0.01半径的范围内找邻近点
	outrem.setMinNeighborsInRadius(30);//设置查询点的邻近点集数小于30的删除
	outrem.filter(*cloud);

    
    copyPointCloud(*cloud, *cloud_tgt_to_show);
    pcl::io::savePCDFileASCII("/home/li/ROS/myros/cloud/filter.pcd", *cloud);
	//可视化
	//pcl::visualization::PCLVisualizer viewer("Point_Cloud_Segmentation");
	//viewer.setBackgroundColor(255, 255, 255);
	//viewer.addPointCloud(cloud);//显示点云，其中fildColor为颜色显示
	// viewer.initCameraParameters();
	// while (!viewer.wasStopped())
	// {
	// 	viewer.spinOnce(100);
	// 	boost::this_thread::sleep(boost::posix_time::microseconds(100000));
	// }


	// 创建用于提取搜索方法的kdtree树对象
	pcl::search::KdTree<PointT>::Ptr tree(new pcl::search::KdTree<PointT>);
	//基于颜色的区域生长法
	std::vector<pcl::PointIndices> cluster_indices;//一个点云 队列，用于存放聚类结果
	pcl::RegionGrowingRGB<PointT> reg;//颜色分割器
	reg.setInputCloud(cloud);
	reg.setSearchMethod(tree);
	reg.setDistanceThreshold(0.01);//距离阈值
	reg.setPointColorThreshold(40);	//点与点之间颜色容差
	reg.setRegionColorThreshold(60);
	reg.setMinClusterSize(200);
	reg.extract(cluster_indices);
	std::cout <<"cluster_indices "<< cluster_indices.size() << std::endl;

	const std::string src_file[3] = {"/home/li/ROS/myros/cloud/cluster_red.pcd","/home/li/ROS/myros/cloud/cluster_white3.pcd", "/home/li/ROS/myros/cloud/cluster_white1.pcd"};
	pcl::PCDWriter writer;
	//迭代访问点云索引cluster_indices,直到分割处所有聚类
	int j = 0; //第几个聚类结果
    float model = 0; //第几个模型
	std::vector<Eigen::Vector4f> center;//创建存储点云质心的对象
	for (std::vector<pcl::PointIndices>::const_iterator it = cluster_indices.begin(); it != cluster_indices.end(); ++it)
	{ //迭代容器中的点云的索引，并且分开保存索引的点云
		pcl::PointCloud<PointT>::Ptr cloud_cluster(new pcl::PointCloud<PointT>);
		for (std::vector<int>::const_iterator pit = it->indices.begin(); pit != it->indices.end(); ++pit)
			//设置保存点云的属性问题
			cloud_cluster->points.push_back(cloud->points[*pit]); //*
		cloud_cluster->width = cloud_cluster->points.size();
		cloud_cluster->height = 1;
		cloud_cluster->is_dense = true;
		std::cout << "PointCloud representing the Cluster: " << cloud_cluster->points.size() << " data points." << std::endl;
		//将分割出来的点云保存下来
		std::stringstream ss;
		ss << "/home/li/ROS/myros/cloud/005_cluster_" << j << ".pcd";
        //pcl::io::savePCDFileASCII("/home/li/ROS/myros/cloud/original.pcd", *cloud);
		writer.write<PointT>(ss.str(), *cloud_cluster, false); //*
		//创建存储点云质心的对象
		Eigen::Vector4f centroid;
		pcl::compute3DCentroid(*cloud_cluster, centroid);
		center.push_back(centroid);
		std::cout << "点云质心是（"<< centroid[0] << ","<< centroid[1] << ","<< centroid[2] << ")." << std::endl;

		pcl::PointCloud<PointT>::Ptr cloud_tgt = cloud_cluster;//目标点云
        // pcl::PointCloud<PointT>::Ptr cloud_tgt_to_show(new pcl::PointCloud<PointT>);//显示用的目标点云
		// copyPointCloud(*cloud_tgt, *cloud_tgt_to_show);
	   
	    std::vector<int> indices_tgt;
        pcl::removeNaNFromPointCloud(*cloud_tgt, *cloud_tgt, indices_tgt);
        std::cout << "remove *cloud_tgt nan" <<indices_tgt.size()<< endl;
		
		//选择需要加载的配准点云
		pcl::PointCloud<PointT>::Ptr cloud_src(new pcl::PointCloud<PointT>);//原点云，待配准
		int index = cloud_tgt->size()/2;
        int r = (int)cloud_tgt->points[index].r;
        int g = (int)cloud_tgt->points[index].g;
        int b = (int)cloud_tgt->points[index].b;
		//std::cout<<(float)cloud_tgt->points[index].r<<" "<<(float)cloud_tgt->points[index].g<<" "<<(float)cloud_tgt->points[index].b<<" "<<endl;
        std::cout<<r<<" "<<g<<" "<<b<<" "<<endl;
		if(r>1.2*g && r>1.2*b)
		{//red
            std::cout<<"red "<<endl;
			pcl::io::loadPCDFile(src_file[0], *cloud_src);	//加载点云文件
            model = 1;
		}
		else if (r>1.2*b && g>1.2*b &&(r-g)<30.0 )
        {//yellow
            std::cout<<"yellow "<<endl;
			pcl::io::loadPCDFile(src_file[0], *cloud_src);	//加载点云文件
            model = 1;
		}
		else if ((r-g)<30.0 && (r-g)<20.0)
		{//white
            std::cout<<"white1 "<<endl;
			pcl::io::loadPCDFile(src_file[1], *cloud_src);	//加载点云文件
            model = 2;
			if(cloud_tgt->size()<cloud_src->size()*0.7)
			{//小的
                std::cout<<"white2 "<<endl;
				pcl::io::loadPCDFile(src_file[2], *cloud_src);	//加载点云文件
                model = 3;
			}
		}
        else
        {
            std::cout<<"none "<<endl;
            continue;
        }
        

        clock_t start = clock();
        // //去除NAN点
        // std::vector<int> indices_src; //保存去除的点的索引
        // pcl::removeNaNFromPointCloud(*cloud_src, *cloud_src, indices_src);
        // std::cout << "remove *cloud_src nan" <<indices_src.size()<< endl;

        //计算表面法线
        pcl::NormalEstimation<PointT, pcl::Normal> ne_src;
        ne_src.setInputCloud(cloud_src);
        pcl::search::KdTree< PointT>::Ptr tree_src(new pcl::search::KdTree< PointT>());
        ne_src.setSearchMethod(tree_src);
        pcl::PointCloud<pcl::Normal>::Ptr cloud_src_normals(new pcl::PointCloud< pcl::Normal>);
        //ne_src.setKSearch(20);
		ne_src.setRadiusSearch(0.005);
        ne_src.compute(*cloud_src_normals);

        pcl::NormalEstimation<PointT, pcl::Normal> ne_tgt;
        ne_tgt.setInputCloud(cloud_tgt);
        pcl::search::KdTree< PointT>::Ptr tree_tgt(new pcl::search::KdTree< PointT>());
        ne_tgt.setSearchMethod(tree_tgt);
        pcl::PointCloud<pcl::Normal>::Ptr cloud_tgt_normals(new pcl::PointCloud< pcl::Normal>);
        //ne_tgt.setKSearch(20);
        ne_tgt.setRadiusSearch(0.005);
        ne_tgt.compute(*cloud_tgt_normals);

        //计算FPFH
        pcl::FPFHEstimation<PointT, pcl::Normal, pcl::FPFHSignature33> fpfh_src;
        fpfh_src.setInputCloud(cloud_src);
        fpfh_src.setInputNormals(cloud_src_normals);
        pcl::search::KdTree<PointT>::Ptr tree_src_fpfh(new pcl::search::KdTree<PointT>);
        fpfh_src.setSearchMethod(tree_src_fpfh);
        pcl::PointCloud<pcl::FPFHSignature33>::Ptr fpfhs_src(new pcl::PointCloud<pcl::FPFHSignature33>());
        fpfh_src.setRadiusSearch(0.01);
        fpfh_src.compute(*fpfhs_src);
        std::cout << "compute *cloud_src fpfh" << endl;

        pcl::FPFHEstimation<PointT, pcl::Normal, pcl::FPFHSignature33> fpfh_tgt;
        fpfh_tgt.setInputCloud(cloud_tgt);
        fpfh_tgt.setInputNormals(cloud_tgt_normals);
        pcl::search::KdTree<PointT>::Ptr tree_tgt_fpfh(new pcl::search::KdTree<PointT>);
        fpfh_tgt.setSearchMethod(tree_tgt_fpfh);
        pcl::PointCloud<pcl::FPFHSignature33>::Ptr fpfhs_tgt(new pcl::PointCloud<pcl::FPFHSignature33>());
        fpfh_tgt.setRadiusSearch(0.01);
        fpfh_tgt.compute(*fpfhs_tgt);
        std::cout << "compute *cloud_tgt fpfh" << endl;

        //SAC配准
        pcl::SampleConsensusInitialAlignment<PointT, PointT, pcl::FPFHSignature33> scia;
        scia.setInputSource(cloud_src);
        scia.setInputTarget(cloud_tgt);
        scia.setSourceFeatures(fpfhs_src);
        scia.setTargetFeatures(fpfhs_tgt);
        scia.setMinSampleDistance(0.005);
        scia.setNumberOfSamples(20);
        scia.setCorrespondenceRandomness(50);
        scia.setMaximumIterations(500);
		//scia.setErrorFunction();
        pcl::PointCloud<PointT>::Ptr sac_result(new pcl::PointCloud<PointT>);
        scia.align(*sac_result);
 //       std::cout << "sac has converged:" << scia.hasConverged() << "  score: " << scia.getFitnessScore() << endl;
        Eigen::Matrix4f sac_trans;
        sac_trans = scia.getFinalTransformation();
 //       std::cout << sac_trans << endl;
        clock_t sac_time = clock();

        //icp配准
        pcl::PointCloud<PointT>::Ptr icp_result(new pcl::PointCloud<PointT>);
        pcl::IterativeClosestPoint<PointT, PointT> icp;
        icp.setInputSource(cloud_src);
        icp.setInputTarget(cloud_tgt);
        //Set the max correspondence distance to 4cm (e.g., correspondences with higher distances will be ignored)
        icp.setMaxCorrespondenceDistance(0.005);
        // 最大迭代次数
        icp.setMaximumIterations(100);
        // 两次变化矩阵之间的差值
        icp.setTransformationEpsilon(1e-10);
        // 均方误差
        icp.setEuclideanFitnessEpsilon(0.2);
        icp.align(*icp_result, sac_trans);

        clock_t end = clock();
        // cout << "total time: " << (double)(end - start) / (double)CLOCKS_PER_SEC << " s" << endl;
        // //我把计算法线和点特征直方图的时间也算在SAC里面了
        // cout << "sac time: " << (double)(sac_time - start) / (double)CLOCKS_PER_SEC << " s" << endl;
        // cout << "icp time: " << (double)(end - sac_time) / (double)CLOCKS_PER_SEC << " s" << endl;

//        std::cout << "ICP has converged:" << icp.hasConverged() << " score: " << icp.getFitnessScore() << std::endl;
        Eigen::Matrix4f icp_trans;
        icp_trans = icp.getFinalTransformation();
        //cout<<"ransformationProbability"<<icp.getTransformationProbability()<<endl;
 //       std::cout << icp_trans << endl;
        //使用创建的变换对未过滤的输入点云进行变换
        pcl::transformPointCloud(*cloud_src, *icp_result, icp_trans);
        ////保存转换的输入点云
        

        //配置ros消息
        std_msgs::Float64MultiArray temp_msg;
        tf::matrixEigenToMsg(icp_trans,temp_msg);
        std::cout<<temp_msg.data.size()<<endl;       
        pose_msg.data.push_back(model);
        pose_msg.data.push_back(centroid[0]);
        pose_msg.data.push_back(centroid[1]);
        pose_msg.data.push_back(centroid[2]);
        //pose_msg = temp_msg;
        for(int i=0;i<temp_msg.data.size();i++){
            pose_msg.data.push_back(temp_msg.data[i]);
        }
        std::cout<<pose_msg.data.size()<<endl;
        // for(int i=0;i<pose_msg.data.size();i++){
        //     std::cout<<pose_msg.data[i]<<endl;
        // }
        
        std_msgs::Float64MultiArray position_temp_msg;
        tf::matrixEigenToMsg(centroid,position_temp_msg);
        std::cout<<position_temp_msg.data.size()<<endl;       
        //position_msg.data.push_back((float)j);
        position_msg.data.push_back(model);
        //position_msg = position_temp_msg;
        for(int i=0;i<position_temp_msg.data.size();i++){
            position_msg.data.push_back(position_temp_msg.data[i]);
        }
        // std::cout<<position_msg.data.size()<<endl;
        // for(int i=0;i<position_msg.data.size();i++){
        //     std::cout<<position_msg.data[i]<<endl;
        // }

        //计算误差
        Eigen::Vector3f ANGLE_origin;
        ANGLE_origin << 0, 0, M_PI / 5;
        double error_x, error_y, error_z;
        Eigen::Vector3f ANGLE_result;
        matrix2angle(icp_trans, ANGLE_result);
        error_x = fabs(ANGLE_result(0)) - fabs(ANGLE_origin(0));
        error_y = fabs(ANGLE_result(1)) - fabs(ANGLE_origin(1));
        error_z = fabs(ANGLE_result(2)) - fabs(ANGLE_origin(2));
//        cout << "original angle in x y z:\n" << ANGLE_origin << endl;
//        cout << "error in aixs_x: " << error_x << "  error in aixs_y: " << error_y << "  error in aixs_z: " << error_z << endl;

        //可视化
        // visualize_pcd(cloud_src, cloud_tgt_to_show, icp_result);
        // copyPointCloud(*cloud_src, *cloud_src_to_show);
        // copyPointCloud(*icp_result, *cloud_res_to_show);
        // *cloud_res_to_pub = *cloud_src_to_show + *cloud_res_to_show ;

        // *cloud_res_to_pub += *cloud_tgt_to_show;
        
        myprocess::process_points points;
        sensor_msgs::PointCloud2 point_cloud_2;
        pcl::toROSMsg(*cloud_src, point_cloud_2);
        point_cloud_2.header.frame_id = "world";
		point_cloud_2.header.stamp = ros::Time::now();
		points.src_points = point_cloud_2;

        pcl::toROSMsg(*cloud_tgt_to_show, point_cloud_2);
        point_cloud_2.header.frame_id = "world";
		point_cloud_2.header.stamp = ros::Time::now();
		points.tgt_points = point_cloud_2;

        pcl::toROSMsg(*icp_result, point_cloud_2);
        point_cloud_2.header.frame_id = "world";
		point_cloud_2.header.stamp = ros::Time::now();
		points.res_points = point_cloud_2;

        points_pub.publish(points);
        

        //ros::Duration(1).sleep(); 

		j++;
	}
    //处理完成
    pose_pub.publish(pose_msg);
    position_pub.publish(position_msg);
    pose_msg_srv = pose_msg;
    position_msg_srv = position_msg;

    int first_service = 0;
    if(first_service == 0){
        pose_service = n.advertiseService("/process/pose_service", &ClientAndPublish::poseServiveCallback, this);
        position_service = n.advertiseService("/process/position_service", &ClientAndPublish::positionServiveCallback, this);
        ROS_INFO("pose server ");
        first_service++;
    }
    std::cout<<"position_msg_srv"<<position_msg_srv.data.size()<<endl;
    std::cout<<"pose_msg_srv"<<pose_msg_srv.data.size()<<endl;

    pose_msg.data.clear();
    position_msg.data.clear();

    std::cout<<"position_msg_srv"<<position_msg_srv.data.size()<<endl;
    std::cout<<"pose_msg_srv"<<pose_msg_srv.data.size()<<endl;

    process_status = FINISH;
    return;
}



