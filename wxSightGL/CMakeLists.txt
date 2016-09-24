
cmake_minimum_required(VERSION 2.8)
project(wxSightGL)


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
target_link_libraries(
	${PROJECT_NAME}
	${wxWidgets_LIBRARIES}
)

# target_link_libraries(
	# ${PROJECT_NAME}
	# ${wxWidgets_LIBRARIES}
	# ${OPENGL_gl_LIBRARY}
	# ${GLUT_LIBRARIES})

# $(sdl-config --libs) $(shell pkg-config glu --libs)
# SET(CMAKE_EXE_LINKER_FLAGS "-L/usr/lib/x86_64-linux-gnu -lSDL -lGLU -lGL")

set(CMAKE_CXX_FLAGS "-std=c++11 -I/usr/lib/x86_64-linux-gnu/wx/include/gtk2-unicode-3.0 -I/usr/include/wx-3.0 -D_FILE_OFFSET_BITS=64 -DWXUSINGDLL -D__WXGTK__")
# set(CMAKE_CXX_FLAGS "-std=c++11 -Wno-deprecated")
# set(CMAKE_CXX_FLAGS "-std=c++11 -c -Wall -I/usr/include/SDL -D_GNU_SOURCE=1 -D_REENTRANT -I/usr/include/libdrm")


# `wx-config --libs --gl-libs` -lGL -lglut
set(CMAKE_SHARED_LINKER_FLAGS "-lwx_gtk2u_gl-3.0 -L/usr/lib/x86_64-linux-gnu -pthread -lwx_gtk2u_xrc-3.0 -lwx_gtk2u_html-3.0 -lwx_gtk2u_qa-3.0 -lwx_gtk2u_adv-3.0 -lwx_gtk2u_core-3.0 -lwx_baseu_xml-3.0 -lwx_baseu_net-3.0 -lwx_baseu-3.0 -lGL -lglut")

# cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr . && make all install


# echo $(sdl-config --cflags) $(pkg-config glu --cflags)
# -I/usr/include/SDL -D_GNU_SOURCE=1 -D_REENTRANT -I/usr/include/libdrm



# -lwx_gtk2u_gl-3.0
# -pthread
# -lwx_gtk2u_xrc-3.0 -lwx_gtk2u_html-3.0 -lwx_gtk2u_qa-3.0 -lwx_gtk2u_adv-3.0 -lwx_gtk2u_core-3.0 -lwx_baseu_xml-3.0 -lwx_baseu_net-3.0 -lwx_baseu-3.0
