; Auto-generated. Do not edit!


(cl:in-package myprocess-msg)


;//! \htmlinclude process_points.msg.html

(cl:defclass <process_points> (roslisp-msg-protocol:ros-message)
  ((src_points
    :reader src_points
    :initarg :src_points
    :type sensor_msgs-msg:PointCloud2
    :initform (cl:make-instance 'sensor_msgs-msg:PointCloud2))
   (tgt_points
    :reader tgt_points
    :initarg :tgt_points
    :type sensor_msgs-msg:PointCloud2
    :initform (cl:make-instance 'sensor_msgs-msg:PointCloud2))
   (res_points
    :reader res_points
    :initarg :res_points
    :type sensor_msgs-msg:PointCloud2
    :initform (cl:make-instance 'sensor_msgs-msg:PointCloud2)))
)

(cl:defclass process_points (<process_points>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <process_points>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'process_points)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name myprocess-msg:<process_points> is deprecated: use myprocess-msg:process_points instead.")))

(cl:ensure-generic-function 'src_points-val :lambda-list '(m))
(cl:defmethod src_points-val ((m <process_points>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader myprocess-msg:src_points-val is deprecated.  Use myprocess-msg:src_points instead.")
  (src_points m))

(cl:ensure-generic-function 'tgt_points-val :lambda-list '(m))
(cl:defmethod tgt_points-val ((m <process_points>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader myprocess-msg:tgt_points-val is deprecated.  Use myprocess-msg:tgt_points instead.")
  (tgt_points m))

(cl:ensure-generic-function 'res_points-val :lambda-list '(m))
(cl:defmethod res_points-val ((m <process_points>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader myprocess-msg:res_points-val is deprecated.  Use myprocess-msg:res_points instead.")
  (res_points m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <process_points>) ostream)
  "Serializes a message object of type '<process_points>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'src_points) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'tgt_points) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'res_points) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <process_points>) istream)
  "Deserializes a message object of type '<process_points>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'src_points) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'tgt_points) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'res_points) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<process_points>)))
  "Returns string type for a message object of type '<process_points>"
  "myprocess/process_points")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'process_points)))
  "Returns string type for a message object of type 'process_points"
  "myprocess/process_points")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<process_points>)))
  "Returns md5sum for a message object of type '<process_points>"
  "803bf268be6fc471c9857ee901f96556")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'process_points)))
  "Returns md5sum for a message object of type 'process_points"
  "803bf268be6fc471c9857ee901f96556")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<process_points>)))
  "Returns full string definition for message of type '<process_points>"
  (cl:format cl:nil "sensor_msgs/PointCloud2 src_points~%sensor_msgs/PointCloud2 tgt_points~%sensor_msgs/PointCloud2 res_points~%================================================================================~%MSG: sensor_msgs/PointCloud2~%# This message holds a collection of N-dimensional points, which may~%# contain additional information such as normals, intensity, etc. The~%# point data is stored as a binary blob, its layout described by the~%# contents of the \"fields\" array.~%~%# The point cloud data may be organized 2d (image-like) or 1d~%# (unordered). Point clouds organized as 2d images may be produced by~%# camera depth sensors such as stereo or time-of-flight.~%~%# Time of sensor data acquisition, and the coordinate frame ID (for 3d~%# points).~%Header header~%~%# 2D structure of the point cloud. If the cloud is unordered, height is~%# 1 and width is the length of the point cloud.~%uint32 height~%uint32 width~%~%# Describes the channels and their layout in the binary data blob.~%PointField[] fields~%~%bool    is_bigendian # Is this data bigendian?~%uint32  point_step   # Length of a point in bytes~%uint32  row_step     # Length of a row in bytes~%uint8[] data         # Actual point data, size is (row_step*height)~%~%bool is_dense        # True if there are no invalid points~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: sensor_msgs/PointField~%# This message holds the description of one point entry in the~%# PointCloud2 message format.~%uint8 INT8    = 1~%uint8 UINT8   = 2~%uint8 INT16   = 3~%uint8 UINT16  = 4~%uint8 INT32   = 5~%uint8 UINT32  = 6~%uint8 FLOAT32 = 7~%uint8 FLOAT64 = 8~%~%string name      # Name of field~%uint32 offset    # Offset from start of point struct~%uint8  datatype  # Datatype enumeration, see above~%uint32 count     # How many elements in the field~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'process_points)))
  "Returns full string definition for message of type 'process_points"
  (cl:format cl:nil "sensor_msgs/PointCloud2 src_points~%sensor_msgs/PointCloud2 tgt_points~%sensor_msgs/PointCloud2 res_points~%================================================================================~%MSG: sensor_msgs/PointCloud2~%# This message holds a collection of N-dimensional points, which may~%# contain additional information such as normals, intensity, etc. The~%# point data is stored as a binary blob, its layout described by the~%# contents of the \"fields\" array.~%~%# The point cloud data may be organized 2d (image-like) or 1d~%# (unordered). Point clouds organized as 2d images may be produced by~%# camera depth sensors such as stereo or time-of-flight.~%~%# Time of sensor data acquisition, and the coordinate frame ID (for 3d~%# points).~%Header header~%~%# 2D structure of the point cloud. If the cloud is unordered, height is~%# 1 and width is the length of the point cloud.~%uint32 height~%uint32 width~%~%# Describes the channels and their layout in the binary data blob.~%PointField[] fields~%~%bool    is_bigendian # Is this data bigendian?~%uint32  point_step   # Length of a point in bytes~%uint32  row_step     # Length of a row in bytes~%uint8[] data         # Actual point data, size is (row_step*height)~%~%bool is_dense        # True if there are no invalid points~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: sensor_msgs/PointField~%# This message holds the description of one point entry in the~%# PointCloud2 message format.~%uint8 INT8    = 1~%uint8 UINT8   = 2~%uint8 INT16   = 3~%uint8 UINT16  = 4~%uint8 INT32   = 5~%uint8 UINT32  = 6~%uint8 FLOAT32 = 7~%uint8 FLOAT64 = 8~%~%string name      # Name of field~%uint32 offset    # Offset from start of point struct~%uint8  datatype  # Datatype enumeration, see above~%uint32 count     # How many elements in the field~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <process_points>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'src_points))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'tgt_points))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'res_points))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <process_points>))
  "Converts a ROS message object to a list"
  (cl:list 'process_points
    (cl:cons ':src_points (src_points msg))
    (cl:cons ':tgt_points (tgt_points msg))
    (cl:cons ':res_points (res_points msg))
))
