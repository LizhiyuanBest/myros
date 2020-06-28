/*
 * get the pose from ros node
 *
 */

// ROS headers
#include <ros/ros.h>
#include <sensor_msgs/Image.h>
#include <std_msgs/Float32MultiArray.h>
#include <cv_bridge/cv_bridge.h>
#include <sensor_msgs/image_encodings.h>
#include <sensor_msgs/PointCloud2.h>
#include <eigen_conversions/eigen_msg.h>
#include <boost/thread.hpp>
// C++ headers
#include <iostream>
#include <string>
#include <signal.h> 
#include <cstdlib>
#include <chrono> 
#include <Eigen/Eigen>

#include <std_msgs/String.h> 
#include "myprocess/process_points.h"

#include <pcl/io/ply_io.h>
#include <pcl/io/pcd_io.h>
#include <pcl/point_cloud.h>
#include <pcl/point_types.h>
#include <pcl_ros/transforms.h>
#include <pcl/pcl_base.h>
#include <pcl_conversions/pcl_conversions.h>
#include <pcl/visualization/cloud_viewer.h>
#include <pcl/visualization/pcl_visualizer.h>
#include <pcl/console/print.h>


class myMatch {
    public:
        int model;
        Eigen::Matrix4f pose;
};

std::vector<Eigen::Vector4f> center;//创建存储点云质心的对象
std::vector<myMatch> match;//创建存储点云质心的对象

typedef pcl::PointXYZRGBA PointT;

class OnlySubscribe  
{  
public:  
    OnlySubscribe()  
    {  
        count = 0;
        //Topic you want to subscribe  
        points_sub = n.subscribe("/process/points",10,&OnlySubscribe::pointsCallback,this);
    }  

    void pointsCallback(const myprocess::process_points::ConstPtr& msg);


private:  
    ros::NodeHandle n; 
    ros::Subscriber points_sub;
    int count; 

};//End of class OnlySubscribe  

    pcl::PointCloud<PointT>::Ptr pcd_src(new pcl::PointCloud<PointT>());
    pcl::PointCloud<PointT>::Ptr pcd_tgt(new pcl::PointCloud<PointT>());
    pcl::PointCloud<PointT>::Ptr pcd_res(new pcl::PointCloud<PointT>());

void
viewerOneOff (pcl::visualization::PCLVisualizer& viewer)
{
 
    static int times = 0;

    std::cout<<"view :"<<times<<endl;
	viewer.setBackgroundColor(0,0,0);
	pcl::visualization::PointCloudColorHandlerCustom<PointT> src_h(pcd_src, 0, 255, 0);
	//pcl::visualization::PointCloudColorHandlerCustom<PointT> tgt_h(pcd_tgt, 255, 0, 0);
	pcl::visualization::PointCloudColorHandlerCustom<PointT> res_h(pcd_res, 0, 0, 255);

    if(times>0){
        viewer.removeAllPointClouds();
    }

	viewer.addPointCloud(pcd_src, src_h, "source cloud "+std::to_string(times));
	// viewer.addPointCloud(pcd_tgt, tgt_h, "tgt cloud"+std::to_string(times));
    viewer.addPointCloud(pcd_tgt, "tgt cloud"+std::to_string(times));
	viewer.addPointCloud(pcd_res, res_h, "res cloud"+std::to_string(times));

    times++;
    if(times>100){
        times=1;
    }
    std::cout<<"really show :"<<times<<endl;

    std::cout <<"i only run once"<< std::endl;
}

//接收到订阅的消息后，会进入消息回调函数
void OnlySubscribe::pointsCallback(const myprocess::process_points::ConstPtr& msg)
{
    // Create a PCLVisualizer object
    static pcl::visualization::CloudViewer viewer1 ("Viewer");  //创建一个显示点云的窗口 
    //static pcl::visualization::PCLVisualizer viewer("registration Viewer");
    static int times = 0;
    // pcl::PointCloud<PointT>::Ptr pcd_src(new pcl::PointCloud<PointT>());
    // pcl::PointCloud<PointT>::Ptr pcd_tgt(new pcl::PointCloud<PointT>());
    // pcl::PointCloud<PointT>::Ptr pcd_res(new pcl::PointCloud<PointT>());
    pcl::PointCloud<PointT>::Ptr cloud_to_show(new pcl::PointCloud<PointT>);

    sensor_msgs::PointCloud2 point_cloud_2;
    point_cloud_2 = msg->src_points;
    pcl::fromROSMsg (point_cloud_2, *pcd_src);
    point_cloud_2 = msg->tgt_points;
    pcl::fromROSMsg (point_cloud_2, *pcd_tgt);
    point_cloud_2 = msg->res_points;
    pcl::fromROSMsg (point_cloud_2, *pcd_res);
    
    *cloud_to_show = *pcd_src + *pcd_res;
    *cloud_to_show += *pcd_tgt;

    viewer1.runOnVisualizationThreadOnce(viewerOneOff);
    //viewer1.showCloud(cloud_to_show);

    // viewer1.showCloud(pcd_tgt);
    // viewer1.showCloud(pcd_res);
    std::cout<<pcd_src->size()<<" "<<pcd_tgt->size()<<" "<<pcd_res->size()<<" "<<std::endl;

    // std::cout<<"view :"<<times<<endl;
	// viewer.setBackgroundColor(255,255,255);
	// pcl::visualization::PointCloudColorHandlerCustom<PointT> src_h(pcd_src, 0, 255, 0);
	// //pcl::visualization::PointCloudColorHandlerCustom<PointT> tgt_h(pcd_tgt, 255, 0, 0);
	// pcl::visualization::PointCloudColorHandlerCustom<PointT> res_h(pcd_res, 0, 0, 255);

    // if(times>0){
    //     viewer.removeAllPointClouds();
    // }

	// viewer.addPointCloud(pcd_src, src_h, "source cloud "+std::to_string(times));
	// // viewer.addPointCloud(pcd_tgt, tgt_h, "tgt cloud"+std::to_string(times));
    // viewer.addPointCloud(pcd_tgt, "tgt cloud"+std::to_string(times));
	// viewer.addPointCloud(pcd_res, res_h, "res cloud"+std::to_string(times));

    // times++;
    // if(times>100){
    //     times=1;
    // }
    // std::cout<<"really show :"<<times<<endl;
        
}



int main(int argc, char **argv)  
{  
  //Initiate ROS  
  ros::init(argc,argv,"posescriber");

  //Create an object of class SubscribeAndPublish that will take care of everything  
  OnlySubscribe points_scriber;  

  ros::spin();  


  return 0;  
}  

