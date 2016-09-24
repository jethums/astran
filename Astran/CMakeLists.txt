
# mkdir mybuild; cmake -DCMAKE_INSTALL_PREFIX:PATH=/mybuild . && make all install
# cmake . && make DESTDIR=/usr all install

cmake_minimum_required(VERSION 2.8)
project(Astran)


# KRITI (CENTOS 5.11) FIXES
#if(cmake_host_system_information(HOSTNAME) MATCHES "kriti")
#endif()

set(CMAKE_C_COMPILER     "/opt/rh/devtoolset-2/root/usr/bin/gcc")
set(CMAKE_CXX_COMPILER   "/opt/rh/devtoolset-2/root/usr/bin/g++")
set(CMAKE_AS_COMPILER    "/opt/rh/devtoolset-2/root/usr/bin/as")

#set(ENV{LD_LIBRARY_PATH} "/usr/lib64/")

set(ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/bin)
set(RUNTIME_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/bin)

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

# Here you can define what libraries of wxWidgets you need for your
# application. You can figure out what libraries you need here;
# http://www.wxwidgets.org/manuals/2.8/wx_librarieslist.html
# We need the Find package for wxWidgets to work
# NOTE: if you're using aui, include aui in this required components list.

# It was noticed that when using MinGW gcc it is essential that 'core' is mentioned before 'base'.
find_package(wxWidgets COMPONENTS gl core base REQUIRED)
# FIND_PACKAGE(wxWidgets REQUIRED html adv core base net aui xrc qa richtext)

if(wxWidgets_FOUND)
	include(${wxWidgets_USE_FILE})
	target_link_libraries(astran ${wxWidgets_LIBRARIES})
else(wxWidgets_FOUND)
	message("wxWidgets not found!")
endif()

set(CMAKE_CXX_FLAGS "-std=c++11 -Wno-deprecated -Wl,-rpath,/usr/lib64/")



link_directories(/usr/local/lib64 /lib64 /usr/lib64/ /usr/local/lib64)




# install(TARGETS test DESTINATION lib)
# install(FILES test.h DESTINATION include)

# install(TARGETS myExe mySharedLib myStaticLib
#         RUNTIME DESTINATION bin
#         LIBRARY DESTINATION lib
#         ARCHIVE DESTINATION lib/static)





