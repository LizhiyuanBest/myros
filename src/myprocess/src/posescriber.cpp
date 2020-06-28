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
#include "myprocess/myprocess_pose.h"
#include "myprocess/myprocess_position.h"

class myMatch {
    public:
        int model;
        Eigen::Matrix4f pose;
};

std::vector<Eigen::Vector4f> center;//创建存储点云质心的对象
std::vector<myMatch> match;//创建存储点云质心的对象



class SubscribeAndPublish  
{  
public:  
    SubscribeAndPublish()  
    {  
        count = 0;
        //Topic you want to publish  
        pub = n.advertise<std_msgs::String>("/chatter_pub", 10);  

        //Topic you want to subscribe  
        pose_sub = n.subscribe("/process/pose",1,&SubscribeAndPublish::poseCallback,this);
        position_sub = n.subscribe("/process/position",1,&SubscribeAndPublish::positionCallback,this);

        //发现/kinect2/cloud 服务后，创建一个服务客户端，连接名为/kinect2/cloud 的server
        ros::service::waitForService("/process/pose_service");
        pose_client = n.serviceClient<myprocess::myprocess_pose>("/process/pose_service");
        ros::service::waitForService("/process/position_service");
        position_client = n.serviceClient<myprocess::myprocess_position>("/process/position_service");
    }  

    void positionCallback(const std_msgs::Float64MultiArray::ConstPtr& msg);
    void poseCallback(const std_msgs::Float64MultiArray::ConstPtr& msg);

    ros::ServiceClient pose_client;
    ros::ServiceClient position_client;
private:  
    ros::NodeHandle n;   
    ros::Publisher pub;  
	ros::Subscriber pose_sub;
	ros::Subscriber position_sub;

    int count; 

};//End of class SubscribeAndPublish  

//接收到订阅的消息后，会进入消息回调函数
void SubscribeAndPublish::positionCallback(const std_msgs::Float64MultiArray::ConstPtr& msg)
{
	//将接收到的消息打印出来
    ROS_INFO("got position");
    std_msgs::Float64MultiArray position_msg = *msg;
    std::cout<<position_msg.data.size()<<std::endl;
    std_msgs::Float64MultiArray temp_msg;

    for(int i=0;i<position_msg.data.size();i=i+5){
        
        Eigen::Vector4f temp_vector;
        temp_vector(0)=position_msg.data[i+1];
        temp_vector(1)=position_msg.data[i+2];
        temp_vector(2)=position_msg.data[i+3];
        temp_vector(3)=position_msg.data[i+0];
        std::cout<<"position"<<temp_vector<<std::endl;
        center.push_back(temp_vector);
    }

    // std::stringstream ss;
    // ss << "Pub: hello world " << count;
    // output.data = ss.str();
    // pub.publish(output);
    // ROS_INFO("%s", output.data.c_str()); 
    // ++count; 
}

//接收到订阅的消息后，会进入消息回调函数
void SubscribeAndPublish::poseCallback(const std_msgs::Float64MultiArray::ConstPtr& msg)
{
	//将接收到的消息打印出来
    ROS_INFO("got pose");
    std_msgs::Float64MultiArray position_msg = *msg;
    std::cout<<position_msg.data.size()<<std::endl;
    std_msgs::Float64MultiArray temp_msg;
    

    for(int i=0;i<position_msg.data.size();){
        myMatch temp_match;
        temp_match.model = (int) position_msg.data[i+1];
        i += 4;
        for(int j=0;j<4;j++){
           for(int k=0;k<4;k++,i++){
               temp_match.pose(j,k) = position_msg.data[i];
           }
        }
        match.push_back(temp_match);
       
        std::cout<<"position"<<temp_match.model<<std::endl<<temp_match.pose<<std::endl;
        
    }
    ros::Rate loop_rate(0.5);//block chatterCallback2() 0.5Hz
    loop_rate.sleep();
}

int main(int argc, char **argv)  
{  
  //Initiate ROS  
  ros::init(argc,argv,"posescriber");

  //Create an object of class SubscribeAndPublish that will take care of everything  
  SubscribeAndPublish test;  
  //ros::spin();

      //调用服务，读取位姿，转换为 geometry_msgs
    //初始化 myprocess::myprocess 的请求数据
	myprocess::myprocess_position position_srv;

    position_srv.request.name.data = "cloud";
    
    test.position_client.call(position_srv);//调用服务
    
    while(ros::ok()){
        sleep(2);
        std::cout<<"sleep"<<std::endl;
        test.position_client.call(position_srv);//调用服务
        //将接收到的消息打印出来
        ROS_INFO("got service position");
        std_msgs::Float64MultiArray position_msg = position_srv.response.result;
        std::cout<<position_msg.data.size()<<std::endl;
        std::cout<<position_srv.response.result.data.size()<<std::endl;
        std_msgs::Float64MultiArray temp_msg;

        for(int i=0;i<position_msg.data.size();i=i+5){
            
            Eigen::Vector4f temp_vector;
            temp_vector(0)=position_msg.data[i+1];
            temp_vector(1)=position_msg.data[i+2];
            temp_vector(2)=position_msg.data[i+3];
            temp_vector(3)=position_msg.data[i+0];
            std::cout<<"position"<<temp_vector<<std::endl;
            center.push_back(temp_vector);
        }
        ros::spinOnce();//这句就是同时发布节点和订阅节点的关键了
    }
    

//   ros::MultiThreadedSpinner s(2);  //多线程
//   ros::spin(s);  



  return 0;  
}  


