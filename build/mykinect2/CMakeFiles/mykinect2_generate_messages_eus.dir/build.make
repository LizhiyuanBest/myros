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

# Utility rule file for mykinect2_generate_messages_eus.

# Include the progress variables for this target.
include mykinect2/CMakeFiles/mykinect2_generate_messages_eus.dir/progress.make

mykinect2/CMakeFiles/mykinect2_generate_messages_eus: /home/li/ROS/myros/devel/share/roseus/ros/mykinect2/srv/mykinect.l
mykinect2/CMakeFiles/mykinect2_generate_messages_eus: /home/li/ROS/myros/devel/share/roseus/ros/mykinect2/manifest.l


/home/li/ROS/myros/devel/share/roseus/ros/mykinect2/srv/mykinect.l: /opt/ros/kinetic/lib/geneus/gen_eus.py
/home/li/ROS/myros/devel/share/roseus/ros/mykinect2/srv/mykinect.l: /home/li/ROS/myros/src/mykinect2/srv/mykinect.srv
/home/li/ROS/myros/devel/share/roseus/ros/mykinect2/srv/mykinect.l: /opt/ros/kinetic/share/std_msgs/msg/Header.msg
/home/li/ROS/myros/devel/share/roseus/ros/mykinect2/srv/mykinect.l: /opt/ros/kinetic/share/sensor_msgs/msg/PointField.msg
/home/li/ROS/myros/devel/share/roseus/ros/mykinect2/srv/mykinect.l: /opt/ros/kinetic/share/std_msgs/msg/String.msg
/home/li/ROS/myros/devel/share/roseus/ros/mykinect2/srv/mykinect.l: /opt/ros/kinetic/share/sensor_msgs/msg/PointCloud2.msg
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/li/ROS/myros/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating EusLisp code from mykinect2/mykinect.srv"
	cd /home/li/ROS/myros/build/mykinect2 && ../catkin_generated/env_cached.sh /usr/bin/python2 /opt/ros/kinetic/share/geneus/cmake/../../../lib/geneus/gen_eus.py /home/li/ROS/myros/src/mykinect2/srv/mykinect.srv -Isensor_msgs:/opt/ros/kinetic/share/sensor_msgs/cmake/../msg -Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg -Igeometry_msgs:/opt/ros/kinetic/share/geometry_msgs/cmake/../msg -p mykinect2 -o /home/li/ROS/myros/devel/share/roseus/ros/mykinect2/srv

/home/li/ROS/myros/devel/share/roseus/ros/mykinect2/manifest.l: /opt/ros/kinetic/lib/geneus/gen_eus.py
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/li/ROS/myros/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Generating EusLisp manifest code for mykinect2"
	cd /home/li/ROS/myros/build/mykinect2 && ../catkin_generated/env_cached.sh /usr/bin/python2 /opt/ros/kinetic/share/geneus/cmake/../../../lib/geneus/gen_eus.py -m -o /home/li/ROS/myros/devel/share/roseus/ros/mykinect2 mykinect2 sensor_msgs std_msgs

mykinect2_generate_messages_eus: mykinect2/CMakeFiles/mykinect2_generate_messages_eus
mykinect2_generate_messages_eus: /home/li/ROS/myros/devel/share/roseus/ros/mykinect2/srv/mykinect.l
mykinect2_generate_messages_eus: /home/li/ROS/myros/devel/share/roseus/ros/mykinect2/manifest.l
mykinect2_generate_messages_eus: mykinect2/CMakeFiles/mykinect2_generate_messages_eus.dir/build.make

.PHONY : mykinect2_generate_messages_eus

# Rule to build all files generated by this target.
mykinect2/CMakeFiles/mykinect2_generate_messages_eus.dir/build: mykinect2_generate_messages_eus

.PHONY : mykinect2/CMakeFiles/mykinect2_generate_messages_eus.dir/build

mykinect2/CMakeFiles/mykinect2_generate_messages_eus.dir/clean:
	cd /home/li/ROS/myros/build/mykinect2 && $(CMAKE_COMMAND) -P CMakeFiles/mykinect2_generate_messages_eus.dir/cmake_clean.cmake
.PHONY : mykinect2/CMakeFiles/mykinect2_generate_messages_eus.dir/clean

mykinect2/CMakeFiles/mykinect2_generate_messages_eus.dir/depend:
	cd /home/li/ROS/myros/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/li/ROS/myros/src /home/li/ROS/myros/src/mykinect2 /home/li/ROS/myros/build /home/li/ROS/myros/build/mykinect2 /home/li/ROS/myros/build/mykinect2/CMakeFiles/mykinect2_generate_messages_eus.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : mykinect2/CMakeFiles/mykinect2_generate_messages_eus.dir/depend
