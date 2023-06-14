# Install script for directory: /Users/lusterclaws/Desktop/mdig-agh-lang_c__exercises-8b07bfe7cc20/projekty/untitled

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

if(CMAKE_INSTALL_COMPONENT STREQUAL "licenses" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/licenses/opencv4" TYPE FILE RENAME "ade-LICENSE" FILES "/Users/lusterclaws/Desktop/mdig-agh-lang_c__exercises-8b07bfe7cc20/projekty/untitled/cmake-build-debug/3rdparty/ade/ade-0.1.2a/LICENSE")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "dev" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/opencv4/opencv2" TYPE FILE FILES "/Users/lusterclaws/Desktop/mdig-agh-lang_c__exercises-8b07bfe7cc20/projekty/untitled/cmake-build-debug/cvconfig.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "dev" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/opencv4/opencv2" TYPE FILE FILES "/Users/lusterclaws/Desktop/mdig-agh-lang_c__exercises-8b07bfe7cc20/projekty/untitled/cmake-build-debug/opencv2/opencv_modules.hpp")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "dev" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/opencv4/OpenCVModules.cmake")
    file(DIFFERENT _cmake_export_file_changed FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/opencv4/OpenCVModules.cmake"
         "/Users/lusterclaws/Desktop/mdig-agh-lang_c__exercises-8b07bfe7cc20/projekty/untitled/cmake-build-debug/CMakeFiles/Export/51ea738ee2ea68756d9122094dacc2a4/OpenCVModules.cmake")
    if(_cmake_export_file_changed)
      file(GLOB _cmake_old_config_files "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/opencv4/OpenCVModules-*.cmake")
      if(_cmake_old_config_files)
        string(REPLACE ";" ", " _cmake_old_config_files_text "${_cmake_old_config_files}")
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/opencv4/OpenCVModules.cmake\" will be replaced.  Removing files [${_cmake_old_config_files_text}].")
        unset(_cmake_old_config_files_text)
        file(REMOVE ${_cmake_old_config_files})
      endif()
      unset(_cmake_old_config_files)
    endif()
    unset(_cmake_export_file_changed)
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/opencv4" TYPE FILE FILES "/Users/lusterclaws/Desktop/mdig-agh-lang_c__exercises-8b07bfe7cc20/projekty/untitled/cmake-build-debug/CMakeFiles/Export/51ea738ee2ea68756d9122094dacc2a4/OpenCVModules.cmake")
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/opencv4" TYPE FILE FILES "/Users/lusterclaws/Desktop/mdig-agh-lang_c__exercises-8b07bfe7cc20/projekty/untitled/cmake-build-debug/CMakeFiles/Export/51ea738ee2ea68756d9122094dacc2a4/OpenCVModules-debug.cmake")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "dev" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/opencv4" TYPE FILE FILES
    "/Users/lusterclaws/Desktop/mdig-agh-lang_c__exercises-8b07bfe7cc20/projekty/untitled/cmake-build-debug/unix-install/OpenCVConfig-version.cmake"
    "/Users/lusterclaws/Desktop/mdig-agh-lang_c__exercises-8b07bfe7cc20/projekty/untitled/cmake-build-debug/unix-install/OpenCVConfig.cmake"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "scripts" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE FILE PERMISSIONS OWNER_READ OWNER_WRITE OWNER_EXECUTE GROUP_READ GROUP_EXECUTE WORLD_READ WORLD_EXECUTE FILES "/Users/lusterclaws/Desktop/mdig-agh-lang_c__exercises-8b07bfe7cc20/projekty/untitled/cmake-build-debug/CMakeFiles/install/setup_vars_opencv4.sh")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "dev" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/opencv4" TYPE FILE FILES
    "/Users/lusterclaws/Desktop/mdig-agh-lang_c__exercises-8b07bfe7cc20/projekty/untitled/platforms/scripts/valgrind.supp"
    "/Users/lusterclaws/Desktop/mdig-agh-lang_c__exercises-8b07bfe7cc20/projekty/untitled/platforms/scripts/valgrind_3rdparty.supp"
    )
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/Users/lusterclaws/Desktop/mdig-agh-lang_c__exercises-8b07bfe7cc20/projekty/untitled/cmake-build-debug/3rdparty/zlib/cmake_install.cmake")
  include("/Users/lusterclaws/Desktop/mdig-agh-lang_c__exercises-8b07bfe7cc20/projekty/untitled/cmake-build-debug/3rdparty/libjpeg-turbo/cmake_install.cmake")
  include("/Users/lusterclaws/Desktop/mdig-agh-lang_c__exercises-8b07bfe7cc20/projekty/untitled/cmake-build-debug/3rdparty/libtiff/cmake_install.cmake")
  include("/Users/lusterclaws/Desktop/mdig-agh-lang_c__exercises-8b07bfe7cc20/projekty/untitled/cmake-build-debug/3rdparty/libwebp/cmake_install.cmake")
  include("/Users/lusterclaws/Desktop/mdig-agh-lang_c__exercises-8b07bfe7cc20/projekty/untitled/cmake-build-debug/3rdparty/openjpeg/cmake_install.cmake")
  include("/Users/lusterclaws/Desktop/mdig-agh-lang_c__exercises-8b07bfe7cc20/projekty/untitled/cmake-build-debug/3rdparty/libpng/cmake_install.cmake")
  include("/Users/lusterclaws/Desktop/mdig-agh-lang_c__exercises-8b07bfe7cc20/projekty/untitled/cmake-build-debug/3rdparty/openexr/cmake_install.cmake")
  include("/Users/lusterclaws/Desktop/mdig-agh-lang_c__exercises-8b07bfe7cc20/projekty/untitled/cmake-build-debug/3rdparty/protobuf/cmake_install.cmake")
  include("/Users/lusterclaws/Desktop/mdig-agh-lang_c__exercises-8b07bfe7cc20/projekty/untitled/cmake-build-debug/3rdparty/quirc/cmake_install.cmake")
  include("/Users/lusterclaws/Desktop/mdig-agh-lang_c__exercises-8b07bfe7cc20/projekty/untitled/cmake-build-debug/3rdparty/carotene/hal/cmake_install.cmake")
  include("/Users/lusterclaws/Desktop/mdig-agh-lang_c__exercises-8b07bfe7cc20/projekty/untitled/cmake-build-debug/3rdparty/ittnotify/cmake_install.cmake")
  include("/Users/lusterclaws/Desktop/mdig-agh-lang_c__exercises-8b07bfe7cc20/projekty/untitled/cmake-build-debug/include/cmake_install.cmake")
  include("/Users/lusterclaws/Desktop/mdig-agh-lang_c__exercises-8b07bfe7cc20/projekty/untitled/cmake-build-debug/modules/.firstpass/calib3d/cmake_install.cmake")
  include("/Users/lusterclaws/Desktop/mdig-agh-lang_c__exercises-8b07bfe7cc20/projekty/untitled/cmake-build-debug/modules/.firstpass/core/cmake_install.cmake")
  include("/Users/lusterclaws/Desktop/mdig-agh-lang_c__exercises-8b07bfe7cc20/projekty/untitled/cmake-build-debug/modules/.firstpass/dnn/cmake_install.cmake")
  include("/Users/lusterclaws/Desktop/mdig-agh-lang_c__exercises-8b07bfe7cc20/projekty/untitled/cmake-build-debug/modules/.firstpass/features2d/cmake_install.cmake")
  include("/Users/lusterclaws/Desktop/mdig-agh-lang_c__exercises-8b07bfe7cc20/projekty/untitled/cmake-build-debug/modules/.firstpass/flann/cmake_install.cmake")
  include("/Users/lusterclaws/Desktop/mdig-agh-lang_c__exercises-8b07bfe7cc20/projekty/untitled/cmake-build-debug/modules/.firstpass/gapi/cmake_install.cmake")
  include("/Users/lusterclaws/Desktop/mdig-agh-lang_c__exercises-8b07bfe7cc20/projekty/untitled/cmake-build-debug/modules/.firstpass/highgui/cmake_install.cmake")
  include("/Users/lusterclaws/Desktop/mdig-agh-lang_c__exercises-8b07bfe7cc20/projekty/untitled/cmake-build-debug/modules/.firstpass/imgcodecs/cmake_install.cmake")
  include("/Users/lusterclaws/Desktop/mdig-agh-lang_c__exercises-8b07bfe7cc20/projekty/untitled/cmake-build-debug/modules/.firstpass/imgproc/cmake_install.cmake")
  include("/Users/lusterclaws/Desktop/mdig-agh-lang_c__exercises-8b07bfe7cc20/projekty/untitled/cmake-build-debug/modules/.firstpass/java/cmake_install.cmake")
  include("/Users/lusterclaws/Desktop/mdig-agh-lang_c__exercises-8b07bfe7cc20/projekty/untitled/cmake-build-debug/modules/.firstpass/js/cmake_install.cmake")
  include("/Users/lusterclaws/Desktop/mdig-agh-lang_c__exercises-8b07bfe7cc20/projekty/untitled/cmake-build-debug/modules/.firstpass/ml/cmake_install.cmake")
  include("/Users/lusterclaws/Desktop/mdig-agh-lang_c__exercises-8b07bfe7cc20/projekty/untitled/cmake-build-debug/modules/.firstpass/objc/cmake_install.cmake")
  include("/Users/lusterclaws/Desktop/mdig-agh-lang_c__exercises-8b07bfe7cc20/projekty/untitled/cmake-build-debug/modules/.firstpass/objdetect/cmake_install.cmake")
  include("/Users/lusterclaws/Desktop/mdig-agh-lang_c__exercises-8b07bfe7cc20/projekty/untitled/cmake-build-debug/modules/.firstpass/photo/cmake_install.cmake")
  include("/Users/lusterclaws/Desktop/mdig-agh-lang_c__exercises-8b07bfe7cc20/projekty/untitled/cmake-build-debug/modules/.firstpass/python/cmake_install.cmake")
  include("/Users/lusterclaws/Desktop/mdig-agh-lang_c__exercises-8b07bfe7cc20/projekty/untitled/cmake-build-debug/modules/.firstpass/stitching/cmake_install.cmake")
  include("/Users/lusterclaws/Desktop/mdig-agh-lang_c__exercises-8b07bfe7cc20/projekty/untitled/cmake-build-debug/modules/.firstpass/ts/cmake_install.cmake")
  include("/Users/lusterclaws/Desktop/mdig-agh-lang_c__exercises-8b07bfe7cc20/projekty/untitled/cmake-build-debug/modules/.firstpass/video/cmake_install.cmake")
  include("/Users/lusterclaws/Desktop/mdig-agh-lang_c__exercises-8b07bfe7cc20/projekty/untitled/cmake-build-debug/modules/.firstpass/videoio/cmake_install.cmake")
  include("/Users/lusterclaws/Desktop/mdig-agh-lang_c__exercises-8b07bfe7cc20/projekty/untitled/cmake-build-debug/modules/.firstpass/world/cmake_install.cmake")
  include("/Users/lusterclaws/Desktop/mdig-agh-lang_c__exercises-8b07bfe7cc20/projekty/untitled/cmake-build-debug/modules/core/cmake_install.cmake")
  include("/Users/lusterclaws/Desktop/mdig-agh-lang_c__exercises-8b07bfe7cc20/projekty/untitled/cmake-build-debug/modules/flann/cmake_install.cmake")
  include("/Users/lusterclaws/Desktop/mdig-agh-lang_c__exercises-8b07bfe7cc20/projekty/untitled/cmake-build-debug/modules/imgproc/cmake_install.cmake")
  include("/Users/lusterclaws/Desktop/mdig-agh-lang_c__exercises-8b07bfe7cc20/projekty/untitled/cmake-build-debug/modules/ml/cmake_install.cmake")
  include("/Users/lusterclaws/Desktop/mdig-agh-lang_c__exercises-8b07bfe7cc20/projekty/untitled/cmake-build-debug/modules/photo/cmake_install.cmake")
  include("/Users/lusterclaws/Desktop/mdig-agh-lang_c__exercises-8b07bfe7cc20/projekty/untitled/cmake-build-debug/modules/python_tests/cmake_install.cmake")
  include("/Users/lusterclaws/Desktop/mdig-agh-lang_c__exercises-8b07bfe7cc20/projekty/untitled/cmake-build-debug/modules/dnn/cmake_install.cmake")
  include("/Users/lusterclaws/Desktop/mdig-agh-lang_c__exercises-8b07bfe7cc20/projekty/untitled/cmake-build-debug/modules/features2d/cmake_install.cmake")
  include("/Users/lusterclaws/Desktop/mdig-agh-lang_c__exercises-8b07bfe7cc20/projekty/untitled/cmake-build-debug/modules/imgcodecs/cmake_install.cmake")
  include("/Users/lusterclaws/Desktop/mdig-agh-lang_c__exercises-8b07bfe7cc20/projekty/untitled/cmake-build-debug/modules/videoio/cmake_install.cmake")
  include("/Users/lusterclaws/Desktop/mdig-agh-lang_c__exercises-8b07bfe7cc20/projekty/untitled/cmake-build-debug/modules/calib3d/cmake_install.cmake")
  include("/Users/lusterclaws/Desktop/mdig-agh-lang_c__exercises-8b07bfe7cc20/projekty/untitled/cmake-build-debug/modules/highgui/cmake_install.cmake")
  include("/Users/lusterclaws/Desktop/mdig-agh-lang_c__exercises-8b07bfe7cc20/projekty/untitled/cmake-build-debug/modules/objdetect/cmake_install.cmake")
  include("/Users/lusterclaws/Desktop/mdig-agh-lang_c__exercises-8b07bfe7cc20/projekty/untitled/cmake-build-debug/modules/stitching/cmake_install.cmake")
  include("/Users/lusterclaws/Desktop/mdig-agh-lang_c__exercises-8b07bfe7cc20/projekty/untitled/cmake-build-debug/modules/ts/cmake_install.cmake")
  include("/Users/lusterclaws/Desktop/mdig-agh-lang_c__exercises-8b07bfe7cc20/projekty/untitled/cmake-build-debug/modules/video/cmake_install.cmake")
  include("/Users/lusterclaws/Desktop/mdig-agh-lang_c__exercises-8b07bfe7cc20/projekty/untitled/cmake-build-debug/modules/gapi/cmake_install.cmake")
  include("/Users/lusterclaws/Desktop/mdig-agh-lang_c__exercises-8b07bfe7cc20/projekty/untitled/cmake-build-debug/modules/java_bindings_generator/cmake_install.cmake")
  include("/Users/lusterclaws/Desktop/mdig-agh-lang_c__exercises-8b07bfe7cc20/projekty/untitled/cmake-build-debug/modules/js_bindings_generator/cmake_install.cmake")
  include("/Users/lusterclaws/Desktop/mdig-agh-lang_c__exercises-8b07bfe7cc20/projekty/untitled/cmake-build-debug/modules/objc_bindings_generator/cmake_install.cmake")
  include("/Users/lusterclaws/Desktop/mdig-agh-lang_c__exercises-8b07bfe7cc20/projekty/untitled/cmake-build-debug/modules/python_bindings_generator/cmake_install.cmake")
  include("/Users/lusterclaws/Desktop/mdig-agh-lang_c__exercises-8b07bfe7cc20/projekty/untitled/cmake-build-debug/doc/cmake_install.cmake")
  include("/Users/lusterclaws/Desktop/mdig-agh-lang_c__exercises-8b07bfe7cc20/projekty/untitled/cmake-build-debug/data/cmake_install.cmake")
  include("/Users/lusterclaws/Desktop/mdig-agh-lang_c__exercises-8b07bfe7cc20/projekty/untitled/cmake-build-debug/apps/cmake_install.cmake")

endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/Users/lusterclaws/Desktop/mdig-agh-lang_c__exercises-8b07bfe7cc20/projekty/untitled/cmake-build-debug/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")