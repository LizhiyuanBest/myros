#include <chrono>
#include <ros/ros.h>
#include "mykinect2/kinect.h"
#include <sensor_msgs/Image.h>
#include <cv_bridge/cv_bridge.h>
#include <sensor_msgs/image_encodings.h>
#include <pcl_ros/transforms.h>
#include <pcl/pcl_base.h>
#include <pcl/visualization/cloud_viewer.h>
#include <pcl_conversions/pcl_conversions.h>
#include <sensor_msgs/PointCloud2.h>
//#include <sensor_msgs/CameraInfo.h>


int main(int argc, char * argv[]){
  //create and initiate kinect
  Kinect kinect(OPENGL);
  //创建变量
  pcl::PointCloud<pcl::PointXYZRGB>::Ptr cloud(new pcl::PointCloud<pcl::PointXYZRGB>(512, 424));
  //pcl::visualization::CloudViewer viewer ("Viewer");  //创建一个显示点云的窗口    
  cv::Mat color(1080, 1920, CV_8UC4);
  cv::Mat depth(424, 512, CV_32FC1);

  std_msgs::Header header_depth, header_color, header_cloud;
  //sensor_msgs::Image depth_image;
  sensor_msgs::Image::Ptr depth_image;
  sensor_msgs::Image::Ptr color_image;
  sensor_msgs::PointCloud2 point_cloud_2;
  header_color.frame_id = "kinect2_rgb_optical_frame";
  header_depth.frame_id = "kinect2_ir_optical_frame";
  header_cloud.frame_id = "kinect2_rgb_optical_frame";
	//ROS node init
	ros::init(argc, argv, "kinect2_publisher");
	//创建节点句柄
	ros::NodeHandle n;
	//创建一个publisher，发布名为/kinect2/hd/image_color的topic，
	//消息类型为sensor_msgs::Image，队列长度为1
	ros::Publisher color_pub = n.advertise<sensor_msgs::Image>("/kinect2/hd/image_color",1);
  ros::Publisher depth_pub = n.advertise<sensor_msgs::Image>("/kinect2/sd/image_depth", 1);
  ros::Publisher point_cloud_pub = n.advertise<sensor_msgs::PointCloud2>("/kinect2/hd/points", 1);
	//设置循环刷新的频率
	ros::Rate loop_rate(10);
	int count = 0;

  while(ros::ok()){

    kinect.get(color, depth);
    kinect.getCloud(cloud);

		//初始化sensor_msgs::Image 消息类型
		sensor_msgs::Image img_msg;
    sensor_msgs::Image depth_msg;
 
    header_color.stamp = ros::Time::now();
    color_image = cv_bridge::CvImage(header_color, sensor_msgs::image_encodings::RGBA8, color).toImageMsg();
    color_pub.publish(color_image);


    header_depth.stamp = ros::Time::now();
    depth_image = cv_bridge::CvImage(header_depth, sensor_msgs::image_encodings::TYPE_32FC1, depth).toImageMsg();
    depth_pub.publish(depth_image);


    point_cloud_2.header.frame_id = "world";
		point_cloud_2.header.stamp = ros::Time::now();
    pcl::toROSMsg(*cloud, point_cloud_2);
		point_cloud_pub.publish(point_cloud_2);

    // count++;
    // if(count%10 == 0){
    //   cv::imshow("color", color);
    //   cv::imshow("depth", depth / 4500.0f);
    //   cv::waitKey(1);
    // }
    
    // cv::imshow("depth", depth / 4500.0f);
    // //cv::imwrite("color.bmp", color);
    // //cv::imwrite("depth.bmp", depth);
    // //显示点云
    // viewer.showCloud(cloud);
    // int key = cv::waitKey(1);
    // stop = stop || (key > 0 && ((key & 0xFF) == 27)); 
    // //pcl::io::savePLYFileASCII("pointcloud.ply", *cloud);
    //发布消息

		//ROS_INFO("Publish color");
		//按照循环频率延时
		loop_rate.sleep();
  }


  kinect.shutDown();
	
  return 0;
}

