
# USAGE:
# cmake . && make DESTDIR=./ all install


# sudo apt-get install mesa-utils
# glxinfo | grep "OpenGL version"
# OpenGL version string: 3.0 Mesa 11.2.2

cmake_minimum_required(VERSION 2.8)
project(wxSightGL)

#message(STATUS "CMAKE_SYSTEM: " ${CMAKE_SYSTEM})
#message(STATUS "CMAKE_SYSTEM_NAME: " ${CMAKE_SYSTEM_NAME})
##message(STATUS "CMAKE_SYSTEM_VERSION: " ${CMAKE_SYSTEM_VERSION})
#message(STATUS "CMAKE_SYSTEM_PROCESSOR: " ${CMAKE_SYSTEM_PROCESSOR})

# KRITI (CENTOS 5.11) FIXES
if(${CMAKE_SYSTEM} STREQUAL "Linux-2.6.18-410.el5")
	set(GCC_PATH  "/opt/rh/devtoolset-2/root/usr/bin")
	message(STATUS "Changing default compiler on CentOS 5.11 to (${GCC_PATH})")
	set(CMAKE_C_COMPILER   "${GCC_PATH}/gcc")
	set(CMAKE_CXX_COMPILER "${GCC_PATH}/g++")
	set(CMAKE_AS_COMPILER  "${GCC_PATH}/as")
endif()

# set(ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/bin)
# set(RUNTIME_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/bin)

set(SRCS
	src/app.cpp
	src/basicglpane.cpp
	src/interface/interface.cpp
	src/interface/layeritem.cpp
	src/sight/camera.cpp
	src/sight/fileformats/BinaryFileReader.cpp
	src/sight/fileformats/gds.cpp
	src/sight/io_files.cpp
	src/sight/label.cpp
	src/sight/layer.cpp
	src/sight/model.cpp
	src/sight/opengl.cpp
	src/sight/rectangle.cpp
	src/sight/repository.cpp
	src/sight/ruler.cpp
	src/sight/sight.cpp
	src/sight/states/drag.cpp
	src/sight/states/lbl.cpp
	src/sight/states/line.cpp
	src/sight/states/rulerst.cpp
	src/sight/states/select.cpp
	src/sight/states/sqr.cpp
	src/sight/states/wire.cpp
	src/sight/txGpu.cpp
	src/sight/wire_line.cpp)

# The following folder will be included
include_directories(${PROJECT_SOURCE_DIR})

##---------------------------------------------------
## Please set your wxWidgets configuration here
##---------------------------------------------------

set(wxWidgets_USE_LIBS)

# If we build for windows systems, we also include the resource file
# containing the manifest, icon and other resources
if(WIN32)
	set(SRCS ${SRCS} ${PROJECT_NAME}.rc)
endif(WIN32)

# Here we define the executable minimal.exe or minimal on other systems
# the above paths and defines will be used in this build
add_executable(wxsightgl WIN32 ${SRCS})

# You can figure out what libraries you need here;
# We need the Find package for wxWidgets to work
find_package(wxWidgets COMPONENTS gl core base aui REQUIRED)

set(CMAKE_CXX_FLAGS "-std=c++11 -Wno-deprecated -Wl,-rpath,/usr/lib64/")

if(wxWidgets_FOUND)
	include(${wxWidgets_USE_FILE})
	target_link_libraries(wxsightgl ${wxWidgets_LIBRARIES} glut GL GLU GLEW)
else(wxWidgets_FOUND)
	message("wxWidgets not found!")
endif()

