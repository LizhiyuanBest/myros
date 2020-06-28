; Auto-generated. Do not edit!


(cl:in-package myprocess-srv)


;//! \htmlinclude myprocess_position-request.msg.html

(cl:defclass <myprocess_position-request> (roslisp-msg-protocol:ros-message)
  ((name
    :reader name
    :initarg :name
    :type std_msgs-msg:String
    :initform (cl:make-instance 'std_msgs-msg:String)))
)

(cl:defclass myprocess_position-request (<myprocess_position-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <myprocess_position-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'myprocess_position-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name myprocess-srv:<myprocess_position-request> is deprecated: use myprocess-srv:myprocess_position-request instead.")))

(cl:ensure-generic-function 'name-val :lambda-list '(m))
(cl:defmethod name-val ((m <myprocess_position-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader myprocess-srv:name-val is deprecated.  Use myprocess-srv:name instead.")
  (name m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <myprocess_position-request>) ostream)
  "Serializes a message object of type '<myprocess_position-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'name) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <myprocess_position-request>) istream)
  "Deserializes a message object of type '<myprocess_position-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'name) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<myprocess_position-request>)))
  "Returns string type for a service object of type '<myprocess_position-request>"
  "myprocess/myprocess_positionRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'myprocess_position-request)))
  "Returns string type for a service object of type 'myprocess_position-request"
  "myprocess/myprocess_positionRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<myprocess_position-request>)))
  "Returns md5sum for a message object of type '<myprocess_position-request>"
  "2020962a1bb2cd737e928d23469d8479")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'myprocess_position-request)))
  "Returns md5sum for a message object of type 'myprocess_position-request"
  "2020962a1bb2cd737e928d23469d8479")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<myprocess_position-request>)))
  "Returns full string definition for message of type '<myprocess_position-request>"
  (cl:format cl:nil "std_msgs/String name~%~%~%================================================================================~%MSG: std_msgs/String~%string data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'myprocess_position-request)))
  "Returns full string definition for message of type 'myprocess_position-request"
  (cl:format cl:nil "std_msgs/String name~%~%~%================================================================================~%MSG: std_msgs/String~%string data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <myprocess_position-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'name))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <myprocess_position-request>))
  "Converts a ROS message object to a list"
  (cl:list 'myprocess_position-request
    (cl:cons ':name (name msg))
))
;//! \htmlinclude myprocess_position-response.msg.html

(cl:defclass <myprocess_position-response> (roslisp-msg-protocol:ros-message)
  ((result
    :reader result
    :initarg :result
    :type std_msgs-msg:Float64MultiArray
    :initform (cl:make-instance 'std_msgs-msg:Float64MultiArray)))
)

(cl:defclass myprocess_position-response (<myprocess_position-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <myprocess_position-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'myprocess_position-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name myprocess-srv:<myprocess_position-response> is deprecated: use myprocess-srv:myprocess_position-response instead.")))

(cl:ensure-generic-function 'result-val :lambda-list '(m))
(cl:defmethod result-val ((m <myprocess_position-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader myprocess-srv:result-val is deprecated.  Use myprocess-srv:result instead.")
  (result m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <myprocess_position-response>) ostream)
  "Serializes a message object of type '<myprocess_position-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'result) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <myprocess_position-response>) istream)
  "Deserializes a message object of type '<myprocess_position-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'result) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<myprocess_position-response>)))
  "Returns string type for a service object of type '<myprocess_position-response>"
  "myprocess/myprocess_positionResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'myprocess_position-response)))
  "Returns string type for a service object of type 'myprocess_position-response"
  "myprocess/myprocess_positionResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<myprocess_position-response>)))
  "Returns md5sum for a message object of type '<myprocess_position-response>"
  "2020962a1bb2cd737e928d23469d8479")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'myprocess_position-response)))
  "Returns md5sum for a message object of type 'myprocess_position-response"
  "2020962a1bb2cd737e928d23469d8479")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<myprocess_position-response>)))
  "Returns full string definition for message of type '<myprocess_position-response>"
  (cl:format cl:nil "std_msgs/Float64MultiArray result~%~%~%================================================================================~%MSG: std_msgs/Float64MultiArray~%# Please look at the MultiArrayLayout message definition for~%# documentation on all multiarrays.~%~%MultiArrayLayout  layout        # specification of data layout~%float64[]         data          # array of data~%~%~%================================================================================~%MSG: std_msgs/MultiArrayLayout~%# The multiarray declares a generic multi-dimensional array of a~%# particular data type.  Dimensions are ordered from outer most~%# to inner most.~%~%MultiArrayDimension[] dim # Array of dimension properties~%uint32 data_offset        # padding elements at front of data~%~%# Accessors should ALWAYS be written in terms of dimension stride~%# and specified outer-most dimension first.~%# ~%# multiarray(i,j,k) = data[data_offset + dim_stride[1]*i + dim_stride[2]*j + k]~%#~%# A standard, 3-channel 640x480 image with interleaved color channels~%# would be specified as:~%#~%# dim[0].label  = \"height\"~%# dim[0].size   = 480~%# dim[0].stride = 3*640*480 = 921600  (note dim[0] stride is just size of image)~%# dim[1].label  = \"width\"~%# dim[1].size   = 640~%# dim[1].stride = 3*640 = 1920~%# dim[2].label  = \"channel\"~%# dim[2].size   = 3~%# dim[2].stride = 3~%#~%# multiarray(i,j,k) refers to the ith row, jth column, and kth channel.~%~%================================================================================~%MSG: std_msgs/MultiArrayDimension~%string label   # label of given dimension~%uint32 size    # size of given dimension (in type units)~%uint32 stride  # stride of given dimension~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'myprocess_position-response)))
  "Returns full string definition for message of type 'myprocess_position-response"
  (cl:format cl:nil "std_msgs/Float64MultiArray result~%~%~%================================================================================~%MSG: std_msgs/Float64MultiArray~%# Please look at the MultiArrayLayout message definition for~%# documentation on all multiarrays.~%~%MultiArrayLayout  layout        # specification of data layout~%float64[]         data          # array of data~%~%~%================================================================================~%MSG: std_msgs/MultiArrayLayout~%# The multiarray declares a generic multi-dimensional array of a~%# particular data type.  Dimensions are ordered from outer most~%# to inner most.~%~%MultiArrayDimension[] dim # Array of dimension properties~%uint32 data_offset        # padding elements at front of data~%~%# Accessors should ALWAYS be written in terms of dimension stride~%# and specified outer-most dimension first.~%# ~%# multiarray(i,j,k) = data[data_offset + dim_stride[1]*i + dim_stride[2]*j + k]~%#~%# A standard, 3-channel 640x480 image with interleaved color channels~%# would be specified as:~%#~%# dim[0].label  = \"height\"~%# dim[0].size   = 480~%# dim[0].stride = 3*640*480 = 921600  (note dim[0] stride is just size of image)~%# dim[1].label  = \"width\"~%# dim[1].size   = 640~%# dim[1].stride = 3*640 = 1920~%# dim[2].label  = \"channel\"~%# dim[2].size   = 3~%# dim[2].stride = 3~%#~%# multiarray(i,j,k) refers to the ith row, jth column, and kth channel.~%~%================================================================================~%MSG: std_msgs/MultiArrayDimension~%string label   # label of given dimension~%uint32 size    # size of given dimension (in type units)~%uint32 stride  # stride of given dimension~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <myprocess_position-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'result))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <myprocess_position-response>))
  "Converts a ROS message object to a list"
  (cl:list 'myprocess_position-response
    (cl:cons ':result (result msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'myprocess_position)))
  'myprocess_position-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'myprocess_position)))
  'myprocess_position-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'myprocess_position)))
  "Returns string type for a service object of type '<myprocess_position>"
  "myprocess/myprocess_position")