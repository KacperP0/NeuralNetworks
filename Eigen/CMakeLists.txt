cmake_minimum_required(VERSION 3.24)

project(Eigen)

set(PROJECT_ID Eigen)

set(CMAKE_CXX_STANDARD 17)

set(SOURCE_FILES
        src/eigen.cpp)

include(../SetCommonConfig.cmake)