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

# Utility rule file for mykinect2_genlisp.

# Include the progress variables for this target.
include mykinect2/CMakeFiles/mykinect2_genlisp.dir/progress.make

mykinect2_genlisp: mykinect2/CMakeFiles/mykinect2_genlisp.dir/build.make

.PHONY : mykinect2_genlisp

# Rule to build all files generated by this target.
mykinect2/CMakeFiles/mykinect2_genlisp.dir/build: mykinect2_genlisp

.PHONY : mykinect2/CMakeFiles/mykinect2_genlisp.dir/build

mykinect2/CMakeFiles/mykinect2_genlisp.dir/clean:
	cd /home/li/ROS/myros/build/mykinect2 && $(CMAKE_COMMAND) -P CMakeFiles/mykinect2_genlisp.dir/cmake_clean.cmake
.PHONY : mykinect2/CMakeFiles/mykinect2_genlisp.dir/clean

mykinect2/CMakeFiles/mykinect2_genlisp.dir/depend:
	cd /home/li/ROS/myros/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/li/ROS/myros/src /home/li/ROS/myros/src/mykinect2 /home/li/ROS/myros/build /home/li/ROS/myros/build/mykinect2 /home/li/ROS/myros/build/mykinect2/CMakeFiles/mykinect2_genlisp.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : mykinect2/CMakeFiles/mykinect2_genlisp.dir/depend

