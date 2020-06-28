;; Auto-generated. Do not edit!


(when (boundp 'myprocess::myprocess_position)
  (if (not (find-package "MYPROCESS"))
    (make-package "MYPROCESS"))
  (shadow 'myprocess_position (find-package "MYPROCESS")))
(unless (find-package "MYPROCESS::MYPROCESS_POSITION")
  (make-package "MYPROCESS::MYPROCESS_POSITION"))
(unless (find-package "MYPROCESS::MYPROCESS_POSITIONREQUEST")
  (make-package "MYPROCESS::MYPROCESS_POSITIONREQUEST"))
(unless (find-package "MYPROCESS::MYPROCESS_POSITIONRESPONSE")
  (make-package "MYPROCESS::MYPROCESS_POSITIONRESPONSE"))

(in-package "ROS")

(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass myprocess::myprocess_positionRequest
  :super ros::object
  :slots (_name ))

(defmethod myprocess::myprocess_positionRequest
  (:init
   (&key
    ((:name __name) (instance std_msgs::String :init))
    )
   (send-super :init)
   (setq _name __name)
   self)
  (:name
   (&rest __name)
   (if (keywordp (car __name))
       (send* _name __name)
     (progn
       (if __name (setq _name (car __name)))
       _name)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/String _name
    (send _name :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/String _name
       (send _name :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/String _name
     (send _name :deserialize buf ptr-) (incf ptr- (send _name :serialization-length))
   ;;
   self)
  )

(defclass myprocess::myprocess_positionResponse
  :super ros::object
  :slots (_result ))

(defmethod myprocess::myprocess_positionResponse
  (:init
   (&key
    ((:result __result) (instance std_msgs::Float64MultiArray :init))
    )
   (send-super :init)
   (setq _result __result)
   self)
  (:result
   (&rest __result)
   (if (keywordp (car __result))
       (send* _result __result)
     (progn
       (if __result (setq _result (car __result)))
       _result)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Float64MultiArray _result
    (send _result :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Float64MultiArray _result
       (send _result :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Float64MultiArray _result
     (send _result :deserialize buf ptr-) (incf ptr- (send _result :serialization-length))
   ;;
   self)
  )

(defclass myprocess::myprocess_position
  :super ros::object
  :slots ())

(setf (get myprocess::myprocess_position :md5sum-) "2020962a1bb2cd737e928d23469d8479")
(setf (get myprocess::myprocess_position :datatype-) "myprocess/myprocess_position")
(setf (get myprocess::myprocess_position :request) myprocess::myprocess_positionRequest)
(setf (get myprocess::myprocess_position :response) myprocess::myprocess_positionResponse)

(defmethod myprocess::myprocess_positionRequest
  (:response () (instance myprocess::myprocess_positionResponse :init)))

(setf (get myprocess::myprocess_positionRequest :md5sum-) "2020962a1bb2cd737e928d23469d8479")
(setf (get myprocess::myprocess_positionRequest :datatype-) "myprocess/myprocess_positionRequest")
(setf (get myprocess::myprocess_positionRequest :definition-)
      "std_msgs/String name


================================================================================
MSG: std_msgs/String
string data
---
std_msgs/Float64MultiArray result


================================================================================
MSG: std_msgs/Float64MultiArray
# Please look at the MultiArrayLayout message definition for
# documentation on all multiarrays.

MultiArrayLayout  layout        # specification of data layout
float64[]         data          # array of data


================================================================================
MSG: std_msgs/MultiArrayLayout
# The multiarray declares a generic multi-dimensional array of a
# particular data type.  Dimensions are ordered from outer most
# to inner most.

MultiArrayDimension[] dim # Array of dimension properties
uint32 data_offset        # padding elements at front of data

# Accessors should ALWAYS be written in terms of dimension stride
# and specified outer-most dimension first.
# 
# multiarray(i,j,k) = data[data_offset + dim_stride[1]*i + dim_stride[2]*j + k]
#
# A standard, 3-channel 640x480 image with interleaved color channels
# would be specified as:
#
# dim[0].label  = \"height\"
# dim[0].size   = 480
# dim[0].stride = 3*640*480 = 921600  (note dim[0] stride is just size of image)
# dim[1].label  = \"width\"
# dim[1].size   = 640
# dim[1].stride = 3*640 = 1920
# dim[2].label  = \"channel\"
# dim[2].size   = 3
# dim[2].stride = 3
#
# multiarray(i,j,k) refers to the ith row, jth column, and kth channel.

================================================================================
MSG: std_msgs/MultiArrayDimension
string label   # label of given dimension
uint32 size    # size of given dimension (in type units)
")

(setf (get myprocess::myprocess_positionResponse :md5sum-) "2020962a1bb2cd737e928d23469d8479")
(setf (get myprocess::myprocess_positionResponse :datatype-) "myprocess/myprocess_positionResponse")
(setf (get myprocess::myprocess_positionResponse :definition-)
      "std_msgs/String name


================================================================================
MSG: std_msgs/String
string data
---
std_msgs/Float64MultiArray result


================================================================================
MSG: std_msgs/Float64MultiArray
# Please look at the MultiArrayLayout message definition for
# documentation on all multiarrays.

MultiArrayLayout  layout        # specification of data layout
float64[]         data          # array of data


================================================================================
MSG: std_msgs/MultiArrayLayout
# The multiarray declares a generic multi-dimensional array of a
# particular data type.  Dimensions are ordered from outer most
# to inner most.

MultiArrayDimension[] dim # Array of dimension properties
uint32 data_offset        # padding elements at front of data

# Accessors should ALWAYS be written in terms of dimension stride
# and specified outer-most dimension first.
# 
# multiarray(i,j,k) = data[data_offset + dim_stride[1]*i + dim_stride[2]*j + k]
#
# A standard, 3-channel 640x480 image with interleaved color channels
# would be specified as:
#
# dim[0].label  = \"height\"
# dim[0].size   = 480
# dim[0].stride = 3*640*480 = 921600  (note dim[0] stride is just size of image)
# dim[1].label  = \"width\"
# dim[1].size   = 640
# dim[1].stride = 3*640 = 1920
# dim[2].label  = \"channel\"
# dim[2].size   = 3
# dim[2].stride = 3
#
# multiarray(i,j,k) refers to the ith row, jth column, and kth channel.

================================================================================
MSG: std_msgs/MultiArrayDimension
string label   # label of given dimension
uint32 size    # size of given dimension (in type units)
")



(provide :myprocess/myprocess_position "2020962a1bb2cd737e928d23469d8479")


