# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "myprocess: 1 messages, 2 services")

set(MSG_I_FLAGS "-Imyprocess:/home/li/ROS/myros/src/myprocess/msg;-Isensor_msgs:/opt/ros/kinetic/share/sensor_msgs/cmake/../msg;-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/kinetic/share/geometry_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(myprocess_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/li/ROS/myros/src/myprocess/srv/myprocess_pose.srv" NAME_WE)
add_custom_target(_myprocess_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "myprocess" "/home/li/ROS/myros/src/myprocess/srv/myprocess_pose.srv" "std_msgs/MultiArrayDimension:std_msgs/Float64MultiArray:std_msgs/MultiArrayLayout"
)

get_filename_component(_filename "/home/li/ROS/myros/src/myprocess/msg/process_points.msg" NAME_WE)
add_custom_target(_myprocess_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "myprocess" "/home/li/ROS/myros/src/myprocess/msg/process_points.msg" "sensor_msgs/PointField:std_msgs/Header:sensor_msgs/PointCloud2"
)

get_filename_component(_filename "/home/li/ROS/myros/src/myprocess/srv/myprocess_position.srv" NAME_WE)
add_custom_target(_myprocess_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "myprocess" "/home/li/ROS/myros/src/myprocess/srv/myprocess_position.srv" "std_msgs/MultiArrayDimension:std_msgs/Float64MultiArray:std_msgs/String:std_msgs/MultiArrayLayout"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(myprocess
  "/home/li/ROS/myros/src/myprocess/msg/process_points.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/sensor_msgs/cmake/../msg/PointField.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/sensor_msgs/cmake/../msg/PointCloud2.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/myprocess
)

### Generating Services
_generate_srv_cpp(myprocess
  "/home/li/ROS/myros/src/myprocess/srv/myprocess_pose.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/MultiArrayDimension.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Float64MultiArray.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/MultiArrayLayout.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/myprocess
)
_generate_srv_cpp(myprocess
  "/home/li/ROS/myros/src/myprocess/srv/myprocess_position.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/MultiArrayDimension.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Float64MultiArray.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/String.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/MultiArrayLayout.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/myprocess
)

### Generating Module File
_generate_module_cpp(myprocess
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/myprocess
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(myprocess_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(myprocess_generate_messages myprocess_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/li/ROS/myros/src/myprocess/srv/myprocess_pose.srv" NAME_WE)
add_dependencies(myprocess_generate_messages_cpp _myprocess_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/li/ROS/myros/src/myprocess/msg/process_points.msg" NAME_WE)
add_dependencies(myprocess_generate_messages_cpp _myprocess_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/li/ROS/myros/src/myprocess/srv/myprocess_position.srv" NAME_WE)
add_dependencies(myprocess_generate_messages_cpp _myprocess_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(myprocess_gencpp)
add_dependencies(myprocess_gencpp myprocess_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS myprocess_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(myprocess
  "/home/li/ROS/myros/src/myprocess/msg/process_points.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/sensor_msgs/cmake/../msg/PointField.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/sensor_msgs/cmake/../msg/PointCloud2.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/myprocess
)

### Generating Services
_generate_srv_eus(myprocess
  "/home/li/ROS/myros/src/myprocess/srv/myprocess_pose.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/MultiArrayDimension.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Float64MultiArray.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/MultiArrayLayout.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/myprocess
)
_generate_srv_eus(myprocess
  "/home/li/ROS/myros/src/myprocess/srv/myprocess_position.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/MultiArrayDimension.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Float64MultiArray.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/String.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/MultiArrayLayout.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/myprocess
)

### Generating Module File
_generate_module_eus(myprocess
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/myprocess
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(myprocess_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(myprocess_generate_messages myprocess_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/li/ROS/myros/src/myprocess/srv/myprocess_pose.srv" NAME_WE)
add_dependencies(myprocess_generate_messages_eus _myprocess_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/li/ROS/myros/src/myprocess/msg/process_points.msg" NAME_WE)
add_dependencies(myprocess_generate_messages_eus _myprocess_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/li/ROS/myros/src/myprocess/srv/myprocess_position.srv" NAME_WE)
add_dependencies(myprocess_generate_messages_eus _myprocess_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(myprocess_geneus)
add_dependencies(myprocess_geneus myprocess_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS myprocess_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(myprocess
  "/home/li/ROS/myros/src/myprocess/msg/process_points.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/sensor_msgs/cmake/../msg/PointField.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/sensor_msgs/cmake/../msg/PointCloud2.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/myprocess
)

### Generating Services
_generate_srv_lisp(myprocess
  "/home/li/ROS/myros/src/myprocess/srv/myprocess_pose.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/MultiArrayDimension.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Float64MultiArray.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/MultiArrayLayout.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/myprocess
)
_generate_srv_lisp(myprocess
  "/home/li/ROS/myros/src/myprocess/srv/myprocess_position.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/MultiArrayDimension.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Float64MultiArray.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/String.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/MultiArrayLayout.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/myprocess
)

### Generating Module File
_generate_module_lisp(myprocess
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/myprocess
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(myprocess_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(myprocess_generate_messages myprocess_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/li/ROS/myros/src/myprocess/srv/myprocess_pose.srv" NAME_WE)
add_dependencies(myprocess_generate_messages_lisp _myprocess_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/li/ROS/myros/src/myprocess/msg/process_points.msg" NAME_WE)
add_dependencies(myprocess_generate_messages_lisp _myprocess_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/li/ROS/myros/src/myprocess/srv/myprocess_position.srv" NAME_WE)
add_dependencies(myprocess_generate_messages_lisp _myprocess_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(myprocess_genlisp)
add_dependencies(myprocess_genlisp myprocess_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS myprocess_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(myprocess
  "/home/li/ROS/myros/src/myprocess/msg/process_points.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/sensor_msgs/cmake/../msg/PointField.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/sensor_msgs/cmake/../msg/PointCloud2.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/myprocess
)

### Generating Services
_generate_srv_nodejs(myprocess
  "/home/li/ROS/myros/src/myprocess/srv/myprocess_pose.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/MultiArrayDimension.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Float64MultiArray.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/MultiArrayLayout.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/myprocess
)
_generate_srv_nodejs(myprocess
  "/home/li/ROS/myros/src/myprocess/srv/myprocess_position.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/MultiArrayDimension.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Float64MultiArray.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/String.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/MultiArrayLayout.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/myprocess
)

### Generating Module File
_generate_module_nodejs(myprocess
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/myprocess
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(myprocess_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(myprocess_generate_messages myprocess_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/li/ROS/myros/src/myprocess/srv/myprocess_pose.srv" NAME_WE)
add_dependencies(myprocess_generate_messages_nodejs _myprocess_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/li/ROS/myros/src/myprocess/msg/process_points.msg" NAME_WE)
add_dependencies(myprocess_generate_messages_nodejs _myprocess_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/li/ROS/myros/src/myprocess/srv/myprocess_position.srv" NAME_WE)
add_dependencies(myprocess_generate_messages_nodejs _myprocess_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(myprocess_gennodejs)
add_dependencies(myprocess_gennodejs myprocess_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS myprocess_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(myprocess
  "/home/li/ROS/myros/src/myprocess/msg/process_points.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/sensor_msgs/cmake/../msg/PointField.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/sensor_msgs/cmake/../msg/PointCloud2.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/myprocess
)

### Generating Services
_generate_srv_py(myprocess
  "/home/li/ROS/myros/src/myprocess/srv/myprocess_pose.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/MultiArrayDimension.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Float64MultiArray.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/MultiArrayLayout.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/myprocess
)
_generate_srv_py(myprocess
  "/home/li/ROS/myros/src/myprocess/srv/myprocess_position.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/MultiArrayDimension.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Float64MultiArray.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/String.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/MultiArrayLayout.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/myprocess
)

### Generating Module File
_generate_module_py(myprocess
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/myprocess
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(myprocess_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(myprocess_generate_messages myprocess_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/li/ROS/myros/src/myprocess/srv/myprocess_pose.srv" NAME_WE)
add_dependencies(myprocess_generate_messages_py _myprocess_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/li/ROS/myros/src/myprocess/msg/process_points.msg" NAME_WE)
add_dependencies(myprocess_generate_messages_py _myprocess_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/li/ROS/myros/src/myprocess/srv/myprocess_position.srv" NAME_WE)
add_dependencies(myprocess_generate_messages_py _myprocess_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(myprocess_genpy)
add_dependencies(myprocess_genpy myprocess_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS myprocess_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/myprocess)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/myprocess
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET sensor_msgs_generate_messages_cpp)
  add_dependencies(myprocess_generate_messages_cpp sensor_msgs_generate_messages_cpp)
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(myprocess_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/myprocess)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/myprocess
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET sensor_msgs_generate_messages_eus)
  add_dependencies(myprocess_generate_messages_eus sensor_msgs_generate_messages_eus)
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(myprocess_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/myprocess)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/myprocess
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET sensor_msgs_generate_messages_lisp)
  add_dependencies(myprocess_generate_messages_lisp sensor_msgs_generate_messages_lisp)
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(myprocess_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/myprocess)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/myprocess
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET sensor_msgs_generate_messages_nodejs)
  add_dependencies(myprocess_generate_messages_nodejs sensor_msgs_generate_messages_nodejs)
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(myprocess_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/myprocess)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/myprocess\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/myprocess
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET sensor_msgs_generate_messages_py)
  add_dependencies(myprocess_generate_messages_py sensor_msgs_generate_messages_py)
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(myprocess_generate_messages_py std_msgs_generate_messages_py)
endif()
