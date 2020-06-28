; Auto-generated. Do not edit!


(cl:in-package myprocess-srv)


;//! \htmlinclude myprocess_pose-request.msg.html

(cl:defclass <myprocess_pose-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass myprocess_pose-request (<myprocess_pose-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <myprocess_pose-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'myprocess_pose-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name myprocess-srv:<myprocess_pose-request> is deprecated: use myprocess-srv:myprocess_pose-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <myprocess_pose-request>) ostream)
  "Serializes a message object of type '<myprocess_pose-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <myprocess_pose-request>) istream)
  "Deserializes a message object of type '<myprocess_pose-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<myprocess_pose-request>)))
  "Returns string type for a service object of type '<myprocess_pose-request>"
  "myprocess/myprocess_poseRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'myprocess_pose-request)))
  "Returns string type for a service object of type 'myprocess_pose-request"
  "myprocess/myprocess_poseRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<myprocess_pose-request>)))
  "Returns md5sum for a message object of type '<myprocess_pose-request>"
  "a8a649bfeb277adfa469bbcaeb9c828b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'myprocess_pose-request)))
  "Returns md5sum for a message object of type 'myprocess_pose-request"
  "a8a649bfeb277adfa469bbcaeb9c828b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<myprocess_pose-request>)))
  "Returns full string definition for message of type '<myprocess_pose-request>"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'myprocess_pose-request)))
  "Returns full string definition for message of type 'myprocess_pose-request"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <myprocess_pose-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <myprocess_pose-request>))
  "Converts a ROS message object to a list"
  (cl:list 'myprocess_pose-request
))
;//! \htmlinclude myprocess_pose-response.msg.html

(cl:defclass <myprocess_pose-response> (roslisp-msg-protocol:ros-message)
  ((result
    :reader result
    :initarg :result
    :type std_msgs-msg:Float64MultiArray
    :initform (cl:make-instance 'std_msgs-msg:Float64MultiArray)))
)

(cl:defclass myprocess_pose-response (<myprocess_pose-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <myprocess_pose-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'myprocess_pose-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name myprocess-srv:<myprocess_pose-response> is deprecated: use myprocess-srv:myprocess_pose-response instead.")))

(cl:ensure-generic-function 'result-val :lambda-list '(m))
(cl:defmethod result-val ((m <myprocess_pose-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader myprocess-srv:result-val is deprecated.  Use myprocess-srv:result instead.")
  (result m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <myprocess_pose-response>) ostream)
  "Serializes a message object of type '<myprocess_pose-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'result) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <myprocess_pose-response>) istream)
  "Deserializes a message object of type '<myprocess_pose-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'result) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<myprocess_pose-response>)))
  "Returns string type for a service object of type '<myprocess_pose-response>"
  "myprocess/myprocess_poseResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'myprocess_pose-response)))
  "Returns string type for a service object of type 'myprocess_pose-response"
  "myprocess/myprocess_poseResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<myprocess_pose-response>)))
  "Returns md5sum for a message object of type '<myprocess_pose-response>"
  "a8a649bfeb277adfa469bbcaeb9c828b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'myprocess_pose-response)))
  "Returns md5sum for a message object of type 'myprocess_pose-response"
  "a8a649bfeb277adfa469bbcaeb9c828b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<myprocess_pose-response>)))
  "Returns full string definition for message of type '<myprocess_pose-response>"
  (cl:format cl:nil "std_msgs/Float64MultiArray result~%~%~%================================================================================~%MSG: std_msgs/Float64MultiArray~%# Please look at the MultiArrayLayout message definition for~%# documentation on all multiarrays.~%~%MultiArrayLayout  layout        # specification of data layout~%float64[]         data          # array of data~%~%~%================================================================================~%MSG: std_msgs/MultiArrayLayout~%# The multiarray declares a generic multi-dimensional array of a~%# particular data type.  Dimensions are ordered from outer most~%# to inner most.~%~%MultiArrayDimension[] dim # Array of dimension properties~%uint32 data_offset        # padding elements at front of data~%~%# Accessors should ALWAYS be written in terms of dimension stride~%# and specified outer-most dimension first.~%# ~%# multiarray(i,j,k) = data[data_offset + dim_stride[1]*i + dim_stride[2]*j + k]~%#~%# A standard, 3-channel 640x480 image with interleaved color channels~%# would be specified as:~%#~%# dim[0].label  = \"height\"~%# dim[0].size   = 480~%# dim[0].stride = 3*640*480 = 921600  (note dim[0] stride is just size of image)~%# dim[1].label  = \"width\"~%# dim[1].size   = 640~%# dim[1].stride = 3*640 = 1920~%# dim[2].label  = \"channel\"~%# dim[2].size   = 3~%# dim[2].stride = 3~%#~%# multiarray(i,j,k) refers to the ith row, jth column, and kth channel.~%~%================================================================================~%MSG: std_msgs/MultiArrayDimension~%string label   # label of given dimension~%uint32 size    # size of given dimension (in type units)~%uint32 stride  # stride of given dimension~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'myprocess_pose-response)))
  "Returns full string definition for message of type 'myprocess_pose-response"
  (cl:format cl:nil "std_msgs/Float64MultiArray result~%~%~%================================================================================~%MSG: std_msgs/Float64MultiArray~%# Please look at the MultiArrayLayout message definition for~%# documentation on all multiarrays.~%~%MultiArrayLayout  layout        # specification of data layout~%float64[]         data          # array of data~%~%~%================================================================================~%MSG: std_msgs/MultiArrayLayout~%# The multiarray declares a generic multi-dimensional array of a~%# particular data type.  Dimensions are ordered from outer most~%# to inner most.~%~%MultiArrayDimension[] dim # Array of dimension properties~%uint32 data_offset        # padding elements at front of data~%~%# Accessors should ALWAYS be written in terms of dimension stride~%# and specified outer-most dimension first.~%# ~%# multiarray(i,j,k) = data[data_offset + dim_stride[1]*i + dim_stride[2]*j + k]~%#~%# A standard, 3-channel 640x480 image with interleaved color channels~%# would be specified as:~%#~%# dim[0].label  = \"height\"~%# dim[0].size   = 480~%# dim[0].stride = 3*640*480 = 921600  (note dim[0] stride is just size of image)~%# dim[1].label  = \"width\"~%# dim[1].size   = 640~%# dim[1].stride = 3*640 = 1920~%# dim[2].label  = \"channel\"~%# dim[2].size   = 3~%# dim[2].stride = 3~%#~%# multiarray(i,j,k) refers to the ith row, jth column, and kth channel.~%~%================================================================================~%MSG: std_msgs/MultiArrayDimension~%string label   # label of given dimension~%uint32 size    # size of given dimension (in type units)~%uint32 stride  # stride of given dimension~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <myprocess_pose-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'result))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <myprocess_pose-response>))
  "Converts a ROS message object to a list"
  (cl:list 'myprocess_pose-response
    (cl:cons ':result (result msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'myprocess_pose)))
  'myprocess_pose-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'myprocess_pose)))
  'myprocess_pose-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'myprocess_pose)))
  "Returns string type for a service object of type '<myprocess_pose>"
  "myprocess/myprocess_pose")