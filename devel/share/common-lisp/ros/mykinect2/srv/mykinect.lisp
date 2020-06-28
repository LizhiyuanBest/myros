; Auto-generated. Do not edit!


(cl:in-package mykinect2-srv)


;//! \htmlinclude mykinect-request.msg.html

(cl:defclass <mykinect-request> (roslisp-msg-protocol:ros-message)
  ((name
    :reader name
    :initarg :name
    :type std_msgs-msg:String
    :initform (cl:make-instance 'std_msgs-msg:String)))
)

(cl:defclass mykinect-request (<mykinect-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <mykinect-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'mykinect-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name mykinect2-srv:<mykinect-request> is deprecated: use mykinect2-srv:mykinect-request instead.")))

(cl:ensure-generic-function 'name-val :lambda-list '(m))
(cl:defmethod name-val ((m <mykinect-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mykinect2-srv:name-val is deprecated.  Use mykinect2-srv:name instead.")
  (name m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <mykinect-request>) ostream)
  "Serializes a message object of type '<mykinect-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'name) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <mykinect-request>) istream)
  "Deserializes a message object of type '<mykinect-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'name) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<mykinect-request>)))
  "Returns string type for a service object of type '<mykinect-request>"
  "mykinect2/mykinectRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'mykinect-request)))
  "Returns string type for a service object of type 'mykinect-request"
  "mykinect2/mykinectRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<mykinect-request>)))
  "Returns md5sum for a message object of type '<mykinect-request>"
  "319cb1a6c7295383f681d62479bb9e3a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'mykinect-request)))
  "Returns md5sum for a message object of type 'mykinect-request"
  "319cb1a6c7295383f681d62479bb9e3a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<mykinect-request>)))
  "Returns full string definition for message of type '<mykinect-request>"
  (cl:format cl:nil "std_msgs/String name~%~%~%================================================================================~%MSG: std_msgs/String~%string data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'mykinect-request)))
  "Returns full string definition for message of type 'mykinect-request"
  (cl:format cl:nil "std_msgs/String name~%~%~%================================================================================~%MSG: std_msgs/String~%string data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <mykinect-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'name))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <mykinect-request>))
  "Converts a ROS message object to a list"
  (cl:list 'mykinect-request
    (cl:cons ':name (name msg))
))
;//! \htmlinclude mykinect-response.msg.html

(cl:defclass <mykinect-response> (roslisp-msg-protocol:ros-message)
  ((result
    :reader result
    :initarg :result
    :type sensor_msgs-msg:PointCloud2
    :initform (cl:make-instance 'sensor_msgs-msg:PointCloud2)))
)

(cl:defclass mykinect-response (<mykinect-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <mykinect-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'mykinect-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name mykinect2-srv:<mykinect-response> is deprecated: use mykinect2-srv:mykinect-response instead.")))

(cl:ensure-generic-function 'result-val :lambda-list '(m))
(cl:defmethod result-val ((m <mykinect-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mykinect2-srv:result-val is deprecated.  Use mykinect2-srv:result instead.")
  (result m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <mykinect-response>) ostream)
  "Serializes a message object of type '<mykinect-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'result) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <mykinect-response>) istream)
  "Deserializes a message object of type '<mykinect-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'result) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<mykinect-response>)))
  "Returns string type for a service object of type '<mykinect-response>"
  "mykinect2/mykinectResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'mykinect-response)))
  "Returns string type for a service object of type 'mykinect-response"
  "mykinect2/mykinectResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<mykinect-response>)))
  "Returns md5sum for a message object of type '<mykinect-response>"
  "319cb1a6c7295383f681d62479bb9e3a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'mykinect-response)))
  "Returns md5sum for a message object of type 'mykinect-response"
  "319cb1a6c7295383f681d62479bb9e3a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<mykinect-response>)))
  "Returns full string definition for message of type '<mykinect-response>"
  (cl:format cl:nil "sensor_msgs/PointCloud2 result~%~%~%================================================================================~%MSG: sensor_msgs/PointCloud2~%# This message holds a collection of N-dimensional points, which may~%# contain additional information such as normals, intensity, etc. The~%# point data is stored as a binary blob, its layout described by the~%# contents of the \"fields\" array.~%~%# The point cloud data may be organized 2d (image-like) or 1d~%# (unordered). Point clouds organized as 2d images may be produced by~%# camera depth sensors such as stereo or time-of-flight.~%~%# Time of sensor data acquisition, and the coordinate frame ID (for 3d~%# points).~%Header header~%~%# 2D structure of the point cloud. If the cloud is unordered, height is~%# 1 and width is the length of the point cloud.~%uint32 height~%uint32 width~%~%# Describes the channels and their layout in the binary data blob.~%PointField[] fields~%~%bool    is_bigendian # Is this data bigendian?~%uint32  point_step   # Length of a point in bytes~%uint32  row_step     # Length of a row in bytes~%uint8[] data         # Actual point data, size is (row_step*height)~%~%bool is_dense        # True if there are no invalid points~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: sensor_msgs/PointField~%# This message holds the description of one point entry in the~%# PointCloud2 message format.~%uint8 INT8    = 1~%uint8 UINT8   = 2~%uint8 INT16   = 3~%uint8 UINT16  = 4~%uint8 INT32   = 5~%uint8 UINT32  = 6~%uint8 FLOAT32 = 7~%uint8 FLOAT64 = 8~%~%string name      # Name of field~%uint32 offset    # Offset from start of point struct~%uint8  datatype  # Datatype enumeration, see above~%uint32 count     # How many elements in the field~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'mykinect-response)))
  "Returns full string definition for message of type 'mykinect-response"
  (cl:format cl:nil "sensor_msgs/PointCloud2 result~%~%~%================================================================================~%MSG: sensor_msgs/PointCloud2~%# This message holds a collection of N-dimensional points, which may~%# contain additional information such as normals, intensity, etc. The~%# point data is stored as a binary blob, its layout described by the~%# contents of the \"fields\" array.~%~%# The point cloud data may be organized 2d (image-like) or 1d~%# (unordered). Point clouds organized as 2d images may be produced by~%# camera depth sensors such as stereo or time-of-flight.~%~%# Time of sensor data acquisition, and the coordinate frame ID (for 3d~%# points).~%Header header~%~%# 2D structure of the point cloud. If the cloud is unordered, height is~%# 1 and width is the length of the point cloud.~%uint32 height~%uint32 width~%~%# Describes the channels and their layout in the binary data blob.~%PointField[] fields~%~%bool    is_bigendian # Is this data bigendian?~%uint32  point_step   # Length of a point in bytes~%uint32  row_step     # Length of a row in bytes~%uint8[] data         # Actual point data, size is (row_step*height)~%~%bool is_dense        # True if there are no invalid points~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: sensor_msgs/PointField~%# This message holds the description of one point entry in the~%# PointCloud2 message format.~%uint8 INT8    = 1~%uint8 UINT8   = 2~%uint8 INT16   = 3~%uint8 UINT16  = 4~%uint8 INT32   = 5~%uint8 UINT32  = 6~%uint8 FLOAT32 = 7~%uint8 FLOAT64 = 8~%~%string name      # Name of field~%uint32 offset    # Offset from start of point struct~%uint8  datatype  # Datatype enumeration, see above~%uint32 count     # How many elements in the field~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <mykinect-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'result))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <mykinect-response>))
  "Converts a ROS message object to a list"
  (cl:list 'mykinect-response
    (cl:cons ':result (result msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'mykinect)))
  'mykinect-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'mykinect)))
  'mykinect-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'mykinect)))
  "Returns string type for a service object of type '<mykinect>"
  "mykinect2/mykinect")