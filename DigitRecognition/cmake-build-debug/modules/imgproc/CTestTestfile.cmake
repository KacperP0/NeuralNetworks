# CMake generated Testfile for 
# Source directory: /Users/lusterclaws/Desktop/mdig-agh-lang_c__exercises-8b07bfe7cc20/projekty/untitled/modules/imgproc
# Build directory: /Users/lusterclaws/Desktop/mdig-agh-lang_c__exercises-8b07bfe7cc20/projekty/untitled/cmake-build-debug/modules/imgproc
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(opencv_test_imgproc "/Users/lusterclaws/Desktop/mdig-agh-lang_c__exercises-8b07bfe7cc20/projekty/untitled/cmake-build-debug/bin/opencv_test_imgproc" "--gtest_output=xml:opencv_test_imgproc.xml")
set_tests_properties(opencv_test_imgproc PROPERTIES  LABELS "Main;opencv_imgproc;Accuracy" WORKING_DIRECTORY "/Users/lusterclaws/Desktop/mdig-agh-lang_c__exercises-8b07bfe7cc20/projekty/untitled/cmake-build-debug/test-reports/accuracy" _BACKTRACE_TRIPLES "/Users/lusterclaws/Desktop/mdig-agh-lang_c__exercises-8b07bfe7cc20/projekty/untitled/cmake/OpenCVUtils.cmake;1752;add_test;/Users/lusterclaws/Desktop/mdig-agh-lang_c__exercises-8b07bfe7cc20/projekty/untitled/cmake/OpenCVModule.cmake;1352;ocv_add_test_from_target;/Users/lusterclaws/Desktop/mdig-agh-lang_c__exercises-8b07bfe7cc20/projekty/untitled/cmake/OpenCVModule.cmake;1110;ocv_add_accuracy_tests;/Users/lusterclaws/Desktop/mdig-agh-lang_c__exercises-8b07bfe7cc20/projekty/untitled/modules/imgproc/CMakeLists.txt;13;ocv_define_module;/Users/lusterclaws/Desktop/mdig-agh-lang_c__exercises-8b07bfe7cc20/projekty/untitled/modules/imgproc/CMakeLists.txt;0;")
add_test(opencv_perf_imgproc "/Users/lusterclaws/Desktop/mdig-agh-lang_c__exercises-8b07bfe7cc20/projekty/untitled/cmake-build-debug/bin/opencv_perf_imgproc" "--gtest_output=xml:opencv_perf_imgproc.xml")
set_tests_properties(opencv_perf_imgproc PROPERTIES  LABELS "Main;opencv_imgproc;Performance" WORKING_DIRECTORY "/Users/lusterclaws/Desktop/mdig-agh-lang_c__exercises-8b07bfe7cc20/projekty/untitled/cmake-build-debug/test-reports/performance" _BACKTRACE_TRIPLES "/Users/lusterclaws/Desktop/mdig-agh-lang_c__exercises-8b07bfe7cc20/projekty/untitled/cmake/OpenCVUtils.cmake;1752;add_test;/Users/lusterclaws/Desktop/mdig-agh-lang_c__exercises-8b07bfe7cc20/projekty/untitled/cmake/OpenCVModule.cmake;1251;ocv_add_test_from_target;/Users/lusterclaws/Desktop/mdig-agh-lang_c__exercises-8b07bfe7cc20/projekty/untitled/cmake/OpenCVModule.cmake;1111;ocv_add_perf_tests;/Users/lusterclaws/Desktop/mdig-agh-lang_c__exercises-8b07bfe7cc20/projekty/untitled/modules/imgproc/CMakeLists.txt;13;ocv_define_module;/Users/lusterclaws/Desktop/mdig-agh-lang_c__exercises-8b07bfe7cc20/projekty/untitled/modules/imgproc/CMakeLists.txt;0;")
add_test(opencv_sanity_imgproc "/Users/lusterclaws/Desktop/mdig-agh-lang_c__exercises-8b07bfe7cc20/projekty/untitled/cmake-build-debug/bin/opencv_perf_imgproc" "--gtest_output=xml:opencv_perf_imgproc.xml" "--perf_min_samples=1" "--perf_force_samples=1" "--perf_verify_sanity")
set_tests_properties(opencv_sanity_imgproc PROPERTIES  LABELS "Main;opencv_imgproc;Sanity" WORKING_DIRECTORY "/Users/lusterclaws/Desktop/mdig-agh-lang_c__exercises-8b07bfe7cc20/projekty/untitled/cmake-build-debug/test-reports/sanity" _BACKTRACE_TRIPLES "/Users/lusterclaws/Desktop/mdig-agh-lang_c__exercises-8b07bfe7cc20/projekty/untitled/cmake/OpenCVUtils.cmake;1752;add_test;/Users/lusterclaws/Desktop/mdig-agh-lang_c__exercises-8b07bfe7cc20/projekty/untitled/cmake/OpenCVModule.cmake;1252;ocv_add_test_from_target;/Users/lusterclaws/Desktop/mdig-agh-lang_c__exercises-8b07bfe7cc20/projekty/untitled/cmake/OpenCVModule.cmake;1111;ocv_add_perf_tests;/Users/lusterclaws/Desktop/mdig-agh-lang_c__exercises-8b07bfe7cc20/projekty/untitled/modules/imgproc/CMakeLists.txt;13;ocv_define_module;/Users/lusterclaws/Desktop/mdig-agh-lang_c__exercises-8b07bfe7cc20/projekty/untitled/modules/imgproc/CMakeLists.txt;0;")
