// Generated by gencpp from file mykinect2/mykinectRequest.msg
// DO NOT EDIT!


#ifndef MYKINECT2_MESSAGE_MYKINECTREQUEST_H
#define MYKINECT2_MESSAGE_MYKINECTREQUEST_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <std_msgs/String.h>

namespace mykinect2
{
template <class ContainerAllocator>
struct mykinectRequest_
{
  typedef mykinectRequest_<ContainerAllocator> Type;

  mykinectRequest_()
    : name()  {
    }
  mykinectRequest_(const ContainerAllocator& _alloc)
    : name(_alloc)  {
  (void)_alloc;
    }



   typedef  ::std_msgs::String_<ContainerAllocator>  _name_type;
  _name_type name;





  typedef boost::shared_ptr< ::mykinect2::mykinectRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::mykinect2::mykinectRequest_<ContainerAllocator> const> ConstPtr;

}; // struct mykinectRequest_

typedef ::mykinect2::mykinectRequest_<std::allocator<void> > mykinectRequest;

typedef boost::shared_ptr< ::mykinect2::mykinectRequest > mykinectRequestPtr;
typedef boost::shared_ptr< ::mykinect2::mykinectRequest const> mykinectRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::mykinect2::mykinectRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::mykinect2::mykinectRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace mykinect2

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': False}
// {'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg'], 'sensor_msgs': ['/opt/ros/kinetic/share/sensor_msgs/cmake/../msg'], 'geometry_msgs': ['/opt/ros/kinetic/share/geometry_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::mykinect2::mykinectRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::mykinect2::mykinectRequest_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::mykinect2::mykinectRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::mykinect2::mykinectRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::mykinect2::mykinectRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::mykinect2::mykinectRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::mykinect2::mykinectRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "0fce35bd9f5b27a63eb9b0e831759a0b";
  }

  static const char* value(const ::mykinect2::mykinectRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x0fce35bd9f5b27a6ULL;
  static const uint64_t static_value2 = 0x3eb9b0e831759a0bULL;
};

template<class ContainerAllocator>
struct DataType< ::mykinect2::mykinectRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "mykinect2/mykinectRequest";
  }

  static const char* value(const ::mykinect2::mykinectRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::mykinect2::mykinectRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "std_msgs/String name\n\
\n\
\n\
================================================================================\n\
MSG: std_msgs/String\n\
string data\n\
";
  }

  static const char* value(const ::mykinect2::mykinectRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::mykinect2::mykinectRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.name);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct mykinectRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::mykinect2::mykinectRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::mykinect2::mykinectRequest_<ContainerAllocator>& v)
  {
    s << indent << "name: ";
    s << std::endl;
    Printer< ::std_msgs::String_<ContainerAllocator> >::stream(s, indent + "  ", v.name);
  }
};

} // namespace message_operations
} // namespace ros

#endif // MYKINECT2_MESSAGE_MYKINECTREQUEST_H