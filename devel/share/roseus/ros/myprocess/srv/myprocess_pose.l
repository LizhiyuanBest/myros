;; Auto-generated. Do not edit!


(when (boundp 'myprocess::myprocess_pose)
  (if (not (find-package "MYPROCESS"))
    (make-package "MYPROCESS"))
  (shadow 'myprocess_pose (find-package "MYPROCESS")))
(unless (find-package "MYPROCESS::MYPROCESS_POSE")
  (make-package "MYPROCESS::MYPROCESS_POSE"))
(unless (find-package "MYPROCESS::MYPROCESS_POSEREQUEST")
  (make-package "MYPROCESS::MYPROCESS_POSEREQUEST"))
(unless (find-package "MYPROCESS::MYPROCESS_POSERESPONSE")
  (make-package "MYPROCESS::MYPROCESS_POSERESPONSE"))

(in-package "ROS")



(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass myprocess::myprocess_poseRequest
  :super ros::object
  :slots ())

(defmethod myprocess::myprocess_poseRequest
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass myprocess::myprocess_poseResponse
  :super ros::object
  :slots (_result ))

(defmethod myprocess::myprocess_poseResponse
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

(defclass myprocess::myprocess_pose
  :super ros::object
  :slots ())

(setf (get myprocess::myprocess_pose :md5sum-) "a8a649bfeb277adfa469bbcaeb9c828b")
(setf (get myprocess::myprocess_pose :datatype-) "myprocess/myprocess_pose")
(setf (get myprocess::myprocess_pose :request) myprocess::myprocess_poseRequest)
(setf (get myprocess::myprocess_pose :response) myprocess::myprocess_poseResponse)

(defmethod myprocess::myprocess_poseRequest
  (:response () (instance myprocess::myprocess_poseResponse :init)))

(setf (get myprocess::myprocess_poseRequest :md5sum-) "a8a649bfeb277adfa469bbcaeb9c828b")
(setf (get myprocess::myprocess_poseRequest :datatype-) "myprocess/myprocess_poseRequest")
(setf (get myprocess::myprocess_poseRequest :definition-)
      "
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

(setf (get myprocess::myprocess_poseResponse :md5sum-) "a8a649bfeb277adfa469bbcaeb9c828b")
(setf (get myprocess::myprocess_poseResponse :datatype-) "myprocess/myprocess_poseResponse")
(setf (get myprocess::myprocess_poseResponse :definition-)
      "
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



(provide :myprocess/myprocess_pose "a8a649bfeb277adfa469bbcaeb9c828b")


