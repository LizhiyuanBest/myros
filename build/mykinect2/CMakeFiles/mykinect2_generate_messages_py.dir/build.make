# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.5

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/li/ROS/myros/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/li/ROS/myros/build

# Utility rule file for mykinect2_generate_messages_py.

# Include the progress variables for this target.
include mykinect2/CMakeFiles/mykinect2_generate_messages_py.dir/progress.make

mykinect2/CMakeFiles/mykinect2_generate_messages_py: /home/li/ROS/myros/devel/lib/python2.7/dist-packages/mykinect2/srv/_mykinect.py
mykinect2/CMakeFiles/mykinect2_generate_messages_py: /home/li/ROS/myros/devel/lib/python2.7/dist-packages/mykinect2/srv/__init__.py


/home/li/ROS/myros/devel/lib/python2.7/dist-packages/mykinect2/srv/_mykinect.py: /opt/ros/kinetic/lib/genpy/gensrv_py.py
/home/li/ROS/myros/devel/lib/python2.7/dist-packages/mykinect2/srv/_mykinect.py: /home/li/ROS/myros/src/mykinect2/srv/mykinect.srv
/home/li/ROS/myros/devel/lib/python2.7/dist-packages/mykinect2/srv/_mykinect.py: /opt/ros/kinetic/share/std_msgs/msg/Header.msg
/home/li/ROS/myros/devel/lib/python2.7/dist-packages/mykinect2/srv/_mykinect.py: /opt/ros/kinetic/share/sensor_msgs/msg/PointField.msg
/home/li/ROS/myros/devel/lib/python2.7/dist-packages/mykinect2/srv/_mykinect.py: /opt/ros/kinetic/share/std_msgs/msg/String.msg
/home/li/ROS/myros/devel/lib/python2.7/dist-packages/mykinect2/srv/_mykinect.py: /opt/ros/kinetic/share/sensor_msgs/msg/PointCloud2.msg
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/li/ROS/myros/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating Python code from SRV mykinect2/mykinect"
	cd /home/li/ROS/myros/build/mykinect2 && ../catkin_generated/env_cached.sh /usr/bin/python2 /opt/ros/kinetic/share/genpy/cmake/../../../lib/genpy/gensrv_py.py /home/li/ROS/myros/src/mykinect2/srv/mykinect.srv -Isensor_msgs:/opt/ros/kinetic/share/sensor_msgs/cmake/../msg -Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg -Igeometry_msgs:/opt/ros/kinetic/share/geometry_msgs/cmake/../msg -p mykinect2 -o /home/li/ROS/myros/devel/lib/python2.7/dist-packages/mykinect2/srv

/home/li/ROS/myros/devel/lib/python2.7/dist-packages/mykinect2/srv/__init__.py: /opt/ros/kinetic/lib/genpy/genmsg_py.py
/home/li/ROS/myros/devel/lib/python2.7/dist-packages/mykinect2/srv/__init__.py: /home/li/ROS/myros/devel/lib/python2.7/dist-packages/mykinect2/srv/_mykinect.py
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/li/ROS/myros/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Generating Python srv __init__.py for mykinect2"
	cd /home/li/ROS/myros/build/mykinect2 && ../catkin_generated/env_cached.sh /usr/bin/python2 /opt/ros/kinetic/share/genpy/cmake/../../../lib/genpy/genmsg_py.py -o /home/li/ROS/myros/devel/lib/python2.7/dist-packages/mykinect2/srv --initpy

mykinect2_generate_messages_py: mykinect2/CMakeFiles/mykinect2_generate_messages_py
mykinect2_generate_messages_py: /home/li/ROS/myros/devel/lib/python2.7/dist-packages/mykinect2/srv/_mykinect.py
mykinect2_generate_messages_py: /home/li/ROS/myros/devel/lib/python2.7/dist-packages/mykinect2/srv/__init__.py
mykinect2_generate_messages_py: mykinect2/CMakeFiles/mykinect2_generate_messages_py.dir/build.make

.PHONY : mykinect2_generate_messages_py

# Rule to build all files generated by this target.
mykinect2/CMakeFiles/mykinect2_generate_messages_py.dir/build: mykinect2_generate_messages_py

.PHONY : mykinect2/CMakeFiles/mykinect2_generate_messages_py.dir/build

mykinect2/CMakeFiles/mykinect2_generate_messages_py.dir/clean:
	cd /home/li/ROS/myros/build/mykinect2 && $(CMAKE_COMMAND) -P CMakeFiles/mykinect2_generate_messages_py.dir/cmake_clean.cmake
.PHONY : mykinect2/CMakeFiles/mykinect2_generate_messages_py.dir/clean

mykinect2/CMakeFiles/mykinect2_generate_messages_py.dir/depend:
	cd /home/li/ROS/myros/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/li/ROS/myros/src /home/li/ROS/myros/src/mykinect2 /home/li/ROS/myros/build /home/li/ROS/myros/build/mykinect2 /home/li/ROS/myros/build/mykinect2/CMakeFiles/mykinect2_generate_messages_py.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : mykinect2/CMakeFiles/mykinect2_generate_messages_py.dir/depend

