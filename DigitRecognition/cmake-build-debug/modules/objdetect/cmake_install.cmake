# Install script for directory: /Users/lusterclaws/Desktop/mdig-agh-lang_c__exercises-8b07bfe7cc20/projekty/untitled/modules/objdetect

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Debug")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/objdump")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "libs" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY OPTIONAL FILES
    "/Users/lusterclaws/Desktop/mdig-agh-lang_c__exercises-8b07bfe7cc20/projekty/untitled/cmake-build-debug/lib/libopencv_objdetect.4.7.0.dylib"
    "/Users/lusterclaws/Desktop/mdig-agh-lang_c__exercises-8b07bfe7cc20/projekty/untitled/cmake-build-debug/lib/libopencv_objdetect.407.dylib"
    )
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libopencv_objdetect.4.7.0.dylib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libopencv_objdetect.407.dylib"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      execute_process(COMMAND /usr/bin/install_name_tool
        -delete_rpath "/Users/lusterclaws/Desktop/mdig-agh-lang_c__exercises-8b07bfe7cc20/projekty/untitled/cmake-build-debug/lib"
        -add_rpath "/usr/local/lib"
        "${file}")
      if(CMAKE_INSTALL_DO_STRIP)
        execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/strip" -x "${file}")
      endif()
    endif()
  endforeach()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "dev" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/Users/lusterclaws/Desktop/mdig-agh-lang_c__exercises-8b07bfe7cc20/projekty/untitled/cmake-build-debug/lib/libopencv_objdetect.dylib")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libopencv_objdetect.dylib" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libopencv_objdetect.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/Users/lusterclaws/Desktop/mdig-agh-lang_c__exercises-8b07bfe7cc20/projekty/untitled/cmake-build-debug/lib"
      -add_rpath "/usr/local/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libopencv_objdetect.dylib")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/strip" -x "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libopencv_objdetect.dylib")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "dev" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/opencv4/opencv2" TYPE FILE OPTIONAL FILES "/Users/lusterclaws/Desktop/mdig-agh-lang_c__exercises-8b07bfe7cc20/projekty/untitled/modules/objdetect/include/opencv2/objdetect.hpp")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "dev" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/opencv4/opencv2/objdetect" TYPE FILE OPTIONAL FILES "/Users/lusterclaws/Desktop/mdig-agh-lang_c__exercises-8b07bfe7cc20/projekty/untitled/modules/objdetect/include/opencv2/objdetect/aruco_board.hpp")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "dev" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/opencv4/opencv2/objdetect" TYPE FILE OPTIONAL FILES "/Users/lusterclaws/Desktop/mdig-agh-lang_c__exercises-8b07bfe7cc20/projekty/untitled/modules/objdetect/include/opencv2/objdetect/aruco_detector.hpp")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "dev" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/opencv4/opencv2/objdetect" TYPE FILE OPTIONAL FILES "/Users/lusterclaws/Desktop/mdig-agh-lang_c__exercises-8b07bfe7cc20/projekty/untitled/modules/objdetect/include/opencv2/objdetect/aruco_dictionary.hpp")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "dev" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/opencv4/opencv2/objdetect" TYPE FILE OPTIONAL FILES "/Users/lusterclaws/Desktop/mdig-agh-lang_c__exercises-8b07bfe7cc20/projekty/untitled/modules/objdetect/include/opencv2/objdetect/charuco_detector.hpp")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "dev" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/opencv4/opencv2/objdetect" TYPE FILE OPTIONAL FILES "/Users/lusterclaws/Desktop/mdig-agh-lang_c__exercises-8b07bfe7cc20/projekty/untitled/modules/objdetect/include/opencv2/objdetect/detection_based_tracker.hpp")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "dev" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/opencv4/opencv2/objdetect" TYPE FILE OPTIONAL FILES "/Users/lusterclaws/Desktop/mdig-agh-lang_c__exercises-8b07bfe7cc20/projekty/untitled/modules/objdetect/include/opencv2/objdetect/face.hpp")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "dev" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/opencv4/opencv2/objdetect" TYPE FILE OPTIONAL FILES "/Users/lusterclaws/Desktop/mdig-agh-lang_c__exercises-8b07bfe7cc20/projekty/untitled/modules/objdetect/include/opencv2/objdetect/objdetect.hpp")
endif()

