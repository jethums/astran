
cmake_minimum_required(VERSION 2.8)
project(Astran)


# Set the output folder where your program will be created
set(CMAKE_BINARY_DIR ${CMAKE_SOURCE_DIR}/bin)
set(EXECUTABLE_OUTPUT_PATH ${CMAKE_BINARY_DIR})
set(LIBRARY_OUTPUT_PATH ${CMAKE_BINARY_DIR})

# The following folder will be included
include_directories("${PROJECT_SOURCE_DIR}")



# install(TARGETS test DESTINATION lib)
# install(FILES test.h DESTINATION include)










# Location where cmake first looks for cmake modules.
# set(CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}")

##---------------------------------------------------
## Please set your wxWidgets configuration here
##---------------------------------------------------

# Here you can define what libraries of wxWidgets you need for your
# application. You can figure out what libraries you need here;
# http://www.wxwidgets.org/manuals/2.8/wx_librarieslist.html
# We need the Find package for wxWidgets to work
# NOTE: if you're using aui, include aui in this required components list.

# It was noticed that when using MinGW gcc it is essential that 'core' is mentioned before 'base'.
find_package(wxWidgets COMPONENTS core base REQUIRED)

##---------------------------------------------------
## Actual config file starts here
##---------------------------------------------------

# wxWidgets include (this will do all the magic to configure everything)
include( "${wxWidgets_USE_FILE}" )

# For convenience we define the sources as a variable. You can add
# header files and cpp/c files and CMake will sort them out
# set(SRCS minimal.cpp)

set(SRCS
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


# If we build for windows systems, we also include the resource file
# containing the manifest, icon and other resources
if(WIN32)
	set(SRCS ${SRCS} minimal.rc)
endif(WIN32)

# Here we define the executable minimal.exe or minimal on other systems
# the above paths and defines will be used in this build
# add_executable(minimal WIN32 ${SRCS})


add_executable(${PROJECT_NAME} ${SRCS})

# We add to our target 'minimal' the wxWidgets libraries. These are
# set for us by the find script. If you need other libraries, you
# can add them here as well.
target_link_libraries(${PROJECT_NAME} ${wxWidgets_LIBRARIES})

SET(CMAKE_CXX_FLAGS "-std=c++11")
# SET(CMAKE_CXX_FLAGS "-std=c++11 -Wno-deprecated")
# cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr . && make all install
