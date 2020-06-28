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


//接收到订阅的消息后，会进入消息回调函数
void kinect2ColorCallback(const sensor_msgs::Image::ConstPtr& msg)
{
	//将接收到的消息打印出来
   ROS_INFO("got color");
  cv_bridge::CvImagePtr cv_ptr;  //申明一个CvImagePtr
  try
  {
    cv_ptr = cv_bridge::toCvCopy(msg, sensor_msgs::image_encodings::RGBA8);
  }
  catch (cv_bridge::Exception& e)
  {
    ROS_ERROR("cv_bridge exception: %s", e.what());
    return;
  }
  //转化为opencv的格式之后就可以对图像进行操作了

  // Update GUI Window
  cv::imshow("color", cv_ptr->image);
  cv::waitKey(3);
  static int i = 0;
  i++;
  if(i%30 == 0)
  {
	  cv::imwrite("/home/li/ROS/myros/color.bmp", cv_ptr->image);
	  ROS_INFO("output color.bmp");
  }
}

//接收到订阅的消息后，会进入消息回调函数
void kinect2DepthCallback(const sensor_msgs::Image::ConstPtr& msg)
{
	//将接收到的消息打印出来
   ROS_INFO("got color");
  cv_bridge::CvImagePtr cv_ptr;  //申明一个CvImagePtr
  try
  {
    cv_ptr = cv_bridge::toCvCopy(msg, sensor_msgs::image_encodings::TYPE_32FC1);
  }
  catch (cv_bridge::Exception& e)
  {
    ROS_ERROR("cv_bridge exception: %s", e.what());
    return;
  }
  //转化为opencv的格式之后就可以对图像进行操作了

  // Update GUI Window
  cv::imshow("depth", cv_ptr->image);
  cv::waitKey(3);
  static int i = 0;
  i++;
  if(i%30 == 0)
  {
	 cv::imwrite("/home/li/ROS/myros/depth.bmp", cv_ptr->image / 4500.0f);
	 ROS_INFO("output depth.bmp");
  }
}
// //键盘事件处理
// void KeyboardEventOccurred(const pcl::visualization::KeyboardEvent &event)
// {
//   std::string pressed = event.getKeySym();

//   if(event.keyDown ())
//   {
//     if(pressed == "s")
//     {
      
//     //   pcl::PLYWriter writer;
//     //   std::chrono::high_resolution_clock::time_point p = std::chrono::high_resolution_clock::now();
//     //   std::string now = std::to_string((long)std::chrono::duration_cast<std::chrono::milliseconds>(p.time_since_epoch()).count());
//     //   writer.write ("cloud_" + now, *(s->cloud_), s->binary_, s->use_camera_);
// 	// 	cv::imwrite("color.bmp", color);
// 	// 	cv::imwrite("depth.bmp", depth);
//     //   std::cout << "saved " << "cloud_" + now + ".ply" << std::endl;
//     }
//   }
// }

//接收到订阅的消息后，会进入消息回调函数
void kinect2CloudCallback(const sensor_msgs::PointCloud2::ConstPtr& msg)
{

  	//将接收到的消息打印出来
	ROS_INFO("got cloud");
 	pcl::PointCloud<pcl::PointXYZRGB>::Ptr cloud(new pcl::PointCloud<pcl::PointXYZRGB>());
  
  pcl::fromROSMsg (*msg, *cloud);

  static pcl::visualization::CloudViewer viewer ("Viewer");  //创建一个显示点云的窗口

  viewer.showCloud(cloud); 
  static int i = 0;
  i++;
  if(i%30 == 0)
  {

	  pcl::io::savePLYFileASCII("/home/li/ROS/myros/pointcloud.ply", *cloud);
	  ROS_INFO("output pointcloud.ply");
  }
  //viewer.registerKeyboardCallback(KeyboardEventOccurred);
}

int main(int argc, char * argv[]){

	// 初始化ROS节点
	ros::init(argc,argv,"kinect2_subscriber");
	//创建节点句柄
	ros::NodeHandle n;

	// 创建一个Subscriber，订阅名为/kinect2/hd/image_color，注册回调函数kinect2ColorCallback
	ros::Subscriber kinect2_color_sub = n.subscribe("/kinect2/hd/image_color",10,kinect2ColorCallback);
	ros::Subscriber kinect2_depth_sub = n.subscribe("/kinect2/sd/image_depth",10,kinect2DepthCallback);
	ros::Subscriber kinect2_cloud_sub = n.subscribe("/kinect2/hd/points",10,kinect2CloudCallback);

	//循环等待回调函数
	ros::spin();

	return 0;

}

