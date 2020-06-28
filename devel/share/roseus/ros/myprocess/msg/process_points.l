;; Auto-generated. Do not edit!


(when (boundp 'myprocess::process_points)
  (if (not (find-package "MYPROCESS"))
    (make-package "MYPROCESS"))
  (shadow 'process_points (find-package "MYPROCESS")))
(unless (find-package "MYPROCESS::PROCESS_POINTS")
  (make-package "MYPROCESS::PROCESS_POINTS"))

(in-package "ROS")
;;//! \htmlinclude process_points.msg.html
(if (not (find-package "SENSOR_MSGS"))
  (ros::roseus-add-msgs "sensor_msgs"))


(defclass myprocess::process_points
  :super ros::object
  :slots (_src_points _tgt_points _res_points ))

(defmethod myprocess::process_points
  (:init
   (&key
    ((:src_points __src_points) (instance sensor_msgs::PointCloud2 :init))
    ((:tgt_points __tgt_points) (instance sensor_msgs::PointCloud2 :init))
    ((:res_points __res_points) (instance sensor_msgs::PointCloud2 :init))
    )
   (send-super :init)
   (setq _src_points __src_points)
   (setq _tgt_points __tgt_points)
   (setq _res_points __res_points)
   self)
  (:src_points
   (&rest __src_points)
   (if (keywordp (car __src_points))
       (send* _src_points __src_points)
     (progn
       (if __src_points (setq _src_points (car __src_points)))
       _src_points)))
  (:tgt_points
   (&rest __tgt_points)
   (if (keywordp (car __tgt_points))
       (send* _tgt_points __tgt_points)
     (progn
       (if __tgt_points (setq _tgt_points (car __tgt_points)))
       _tgt_points)))
  (:res_points
   (&rest __res_points)
   (if (keywordp (car __res_points))
       (send* _res_points __res_points)
     (progn
       (if __res_points (setq _res_points (car __res_points)))
       _res_points)))
  (:serialization-length
   ()
   (+
    ;; sensor_msgs/PointCloud2 _src_points
    (send _src_points :serialization-length)
    ;; sensor_msgs/PointCloud2 _tgt_points
    (send _tgt_points :serialization-length)
    ;; sensor_msgs/PointCloud2 _res_points
    (send _res_points :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; sensor_msgs/PointCloud2 _src_points
       (send _src_points :serialize s)
     ;; sensor_msgs/PointCloud2 _tgt_points
       (send _tgt_points :serialize s)
     ;; sensor_msgs/PointCloud2 _res_points
       (send _res_points :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; sensor_msgs/PointCloud2 _src_points
     (send _src_points :deserialize buf ptr-) (incf ptr- (send _src_points :serialization-length))
   ;; sensor_msgs/PointCloud2 _tgt_points
     (send _tgt_points :deserialize buf ptr-) (incf ptr- (send _tgt_points :serialization-length))
   ;; sensor_msgs/PointCloud2 _res_points
     (send _res_points :deserialize buf ptr-) (incf ptr- (send _res_points :serialization-length))
   ;;
   self)
  )

(setf (get myprocess::process_points :md5sum-) "803bf268be6fc471c9857ee901f96556")
(setf (get myprocess::process_points :datatype-) "myprocess/process_points")
(setf (get myprocess::process_points :definition-)
      "sensor_msgs/PointCloud2 src_points
sensor_msgs/PointCloud2 tgt_points
sensor_msgs/PointCloud2 res_points
================================================================================
MSG: sensor_msgs/PointCloud2
# This message holds a collection of N-dimensional points, which may
# contain additional information such as normals, intensity, etc. The
# point data is stored as a binary blob, its layout described by the
# contents of the \"fields\" array.

# The point cloud data may be organized 2d (image-like) or 1d
# (unordered). Point clouds organized as 2d images may be produced by
# camera depth sensors such as stereo or time-of-flight.

# Time of sensor data acquisition, and the coordinate frame ID (for 3d
# points).
Header header

# 2D structure of the point cloud. If the cloud is unordered, height is
# 1 and width is the length of the point cloud.
uint32 height
uint32 width

# Describes the channels and their layout in the binary data blob.
PointField[] fields

bool    is_bigendian # Is this data bigendian?
uint32  point_step   # Length of a point in bytes
uint32  row_step     # Length of a row in bytes
uint8[] data         # Actual point data, size is (row_step*height)

bool is_dense        # True if there are no invalid points

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
# 0: no frame
# 1: global frame
string frame_id

================================================================================
MSG: sensor_msgs/PointField
# This message holds the description of one point entry in the
# PointCloud2 message format.
uint8 INT8    = 1
uint8 UINT8   = 2
uint8 INT16   = 3
uint8 UINT16  = 4
uint8 INT32   = 5
uint8 UINT32  = 6
uint8 FLOAT32 = 7
uint8 FLOAT64 = 8

string name      # Name of field
uint32 offset    # Offset from start of point struct
uint8  datatype  # Datatype enumeration, see above
uint32 count     # How many elements in the field

")



(provide :myprocess/process_points "803bf268be6fc471c9857ee901f96556")


