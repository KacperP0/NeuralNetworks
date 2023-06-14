cmake_minimum_required(VERSION 3.24)
project(DigitRecognition)

set(CMAKE_CXX_STANDARD 17)

find_package(OpenCV)

include_directories(${OpenCV_INCLUDE_DIRS})

add_executable(DigitRecognition main.cpp)

target_link_libraries(DigitRecognition ${OpenCV_LIBS})

