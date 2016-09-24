
# cmake . && make DESTDIR=/usr all install

cmake_minimum_required(VERSION 2.8)
project(Astran)

message(STATUS "CMAKE_SYSTEM: " ${CMAKE_SYSTEM})
message(STATUS "CMAKE_SYSTEM_NAME: " ${CMAKE_SYSTEM_NAME})
message(STATUS "CMAKE_SYSTEM_VERSION: " ${CMAKE_SYSTEM_VERSION})
message(STATUS "CMAKE_SYSTEM_PROCESSOR: " ${CMAKE_SYSTEM_PROCESSOR})

# KRITI (CENTOS 5.11) FIXES
if(${CMAKE_SYSTEM} STREQUAL "Linux-2.6.18-410.el5")
	message(STATUS "Chaning default compiler on CentOS 5.11")
	set(CMAKE_C_COMPILER   "/opt/rh/devtoolset-2/root/usr/bin/gcc")
	set(CMAKE_CXX_COMPILER "/opt/rh/devtoolset-2/root/usr/bin/g++")
	set(CMAKE_AS_COMPILER  "/opt/rh/devtoolset-2/root/usr/bin/as")
endif()

#set(ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/bin)
#set(RUNTIME_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/bin)

set(ASTRAN_SRCS
	src/autocell2.cpp
	src/cellnetlst.cpp
	src/cif.cpp
	src/circuit.cpp
	src/clayout.cpp
	src/compaction.cpp
	src/designmng.cpp
	src/draw.cpp
	src/gds.cpp
	src/graphrouter.cpp
	src/gridrouter.cpp
	src/icpdApp.cpp
	src/icpdfrm.cpp
	src/lef.cpp
	src/placer.cpp
	src/router.cpp
	src/rules.cpp
	src/verilog.cpp
	src/wxabout.cpp
	src/wxautocell.cpp
	src/wxcircuit.cpp
	src/wxfp.cpp
	src/wxinterface.cpp
	src/wxpreferences.cpp
	src/wxrules.cpp)

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
add_executable(astran WIN32 ${ASTRAN_SRCS})

# You can figure out what libraries you need here
find_package(wxWidgets COMPONENTS gl core base REQUIRED)

set(CMAKE_CXX_FLAGS "-std=c++11 -Wno-deprecated -Wl,-rpath,/usr/lib64/")

if(wxWidgets_FOUND)
	include(${wxWidgets_USE_FILE})
	target_link_libraries(astran ${wxWidgets_LIBRARIES})
else(wxWidgets_FOUND)
	message("wxWidgets not found!")
endif()



