# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canoncical targets will work.
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
CMAKE_COMMAND = "/Applications/CMake 2.8-1.app/Contents/bin/cmake"

# The command to remove a file.
RM = "/Applications/CMake 2.8-1.app/Contents/bin/cmake" -E remove -f

# The program to use to edit the cache.
CMAKE_EDIT_COMMAND = "/Applications/CMake 2.8-1.app/Contents/bin/ccmake"

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/NK/Development/factions/src/4ha6EW2cru.System

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/NK/Development/factions/src/4ha6EW2cru.System

# Include any dependencies generated for this target.
include CMakeFiles/Application.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/Application.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/Application.dir/flags.make

CMakeFiles/Application.dir/Users/NK/Development/factions/src/4ha6EW2cru.Application/main_osx.cpp.o: CMakeFiles/Application.dir/flags.make
CMakeFiles/Application.dir/Users/NK/Development/factions/src/4ha6EW2cru.Application/main_osx.cpp.o: /Users/NK/Development/factions/src/4ha6EW2cru.Application/main_osx.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /Users/NK/Development/factions/src/4ha6EW2cru.System/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/Application.dir/Users/NK/Development/factions/src/4ha6EW2cru.Application/main_osx.cpp.o"
	/opt/local/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/Application.dir/Users/NK/Development/factions/src/4ha6EW2cru.Application/main_osx.cpp.o -c /Users/NK/Development/factions/src/4ha6EW2cru.Application/main_osx.cpp

CMakeFiles/Application.dir/Users/NK/Development/factions/src/4ha6EW2cru.Application/main_osx.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Application.dir/Users/NK/Development/factions/src/4ha6EW2cru.Application/main_osx.cpp.i"
	/opt/local/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /Users/NK/Development/factions/src/4ha6EW2cru.Application/main_osx.cpp > CMakeFiles/Application.dir/Users/NK/Development/factions/src/4ha6EW2cru.Application/main_osx.cpp.i

CMakeFiles/Application.dir/Users/NK/Development/factions/src/4ha6EW2cru.Application/main_osx.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Application.dir/Users/NK/Development/factions/src/4ha6EW2cru.Application/main_osx.cpp.s"
	/opt/local/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /Users/NK/Development/factions/src/4ha6EW2cru.Application/main_osx.cpp -o CMakeFiles/Application.dir/Users/NK/Development/factions/src/4ha6EW2cru.Application/main_osx.cpp.s

CMakeFiles/Application.dir/Users/NK/Development/factions/src/4ha6EW2cru.Application/main_osx.cpp.o.requires:
.PHONY : CMakeFiles/Application.dir/Users/NK/Development/factions/src/4ha6EW2cru.Application/main_osx.cpp.o.requires

CMakeFiles/Application.dir/Users/NK/Development/factions/src/4ha6EW2cru.Application/main_osx.cpp.o.provides: CMakeFiles/Application.dir/Users/NK/Development/factions/src/4ha6EW2cru.Application/main_osx.cpp.o.requires
	$(MAKE) -f CMakeFiles/Application.dir/build.make CMakeFiles/Application.dir/Users/NK/Development/factions/src/4ha6EW2cru.Application/main_osx.cpp.o.provides.build
.PHONY : CMakeFiles/Application.dir/Users/NK/Development/factions/src/4ha6EW2cru.Application/main_osx.cpp.o.provides

CMakeFiles/Application.dir/Users/NK/Development/factions/src/4ha6EW2cru.Application/main_osx.cpp.o.provides.build: CMakeFiles/Application.dir/Users/NK/Development/factions/src/4ha6EW2cru.Application/main_osx.cpp.o
.PHONY : CMakeFiles/Application.dir/Users/NK/Development/factions/src/4ha6EW2cru.Application/main_osx.cpp.o.provides.build

# Object files for target Application
Application_OBJECTS = \
"CMakeFiles/Application.dir/Users/NK/Development/factions/src/4ha6EW2cru.Application/main_osx.cpp.o"

# External object files for target Application
Application_EXTERNAL_OBJECTS =

/Users/NK/Development/factions/build/bin/Application: CMakeFiles/Application.dir/Users/NK/Development/factions/src/4ha6EW2cru.Application/main_osx.cpp.o
/Users/NK/Development/factions/build/bin/Application: /Users/NK/Development/factions/etc/vendor/physfs/libphysfs.dylib
/Users/NK/Development/factions/build/bin/Application: /Users/NK/Development/factions/build/bin/libBase.dylib
/Users/NK/Development/factions/build/bin/Application: /Users/NK/Development/factions/etc/vendor/physfs/libphysfs.dylib
/Users/NK/Development/factions/build/bin/Application: /Users/NK/Development/boost-trunk/stage/lib/libboost_filesystem.dylib
/Users/NK/Development/factions/build/bin/Application: CMakeFiles/Application.dir/build.make
/Users/NK/Development/factions/build/bin/Application: CMakeFiles/Application.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable /Users/NK/Development/factions/build/bin/Application"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/Application.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/Application.dir/build: /Users/NK/Development/factions/build/bin/Application
.PHONY : CMakeFiles/Application.dir/build

CMakeFiles/Application.dir/requires: CMakeFiles/Application.dir/Users/NK/Development/factions/src/4ha6EW2cru.Application/main_osx.cpp.o.requires
.PHONY : CMakeFiles/Application.dir/requires

CMakeFiles/Application.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/Application.dir/cmake_clean.cmake
.PHONY : CMakeFiles/Application.dir/clean

CMakeFiles/Application.dir/depend:
	cd /Users/NK/Development/factions/src/4ha6EW2cru.System && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/NK/Development/factions/src/4ha6EW2cru.System /Users/NK/Development/factions/src/4ha6EW2cru.System /Users/NK/Development/factions/src/4ha6EW2cru.System /Users/NK/Development/factions/src/4ha6EW2cru.System /Users/NK/Development/factions/src/4ha6EW2cru.System/CMakeFiles/Application.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/Application.dir/depend
