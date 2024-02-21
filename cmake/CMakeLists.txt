cmake_minimum_required(VERSION 3.15)
project(bbl-usd VERSION 0.1 LANGUAGES C CXX)

find_package(pxr REQUIRED)

add_library(openusd-c ${BBL_USD_SRC_DIR}/openusd-c.cpp)

target_link_libraries(
  openusd-c 
    PUBLIC 
      ${PXR_LIBRARIES}
)


# Compile a simple test program to exercise the generated library
add_executable(usd-c-test01 usd-c-test01.c)
target_link_libraries(usd-c-test01 PUBLIC openusd-c)
target_include_directories(usd-c-test01 PRIVATE ${BBL_USD_SRC_DIR})
#set_property(TARGET usd-c-test01 PROPERTY C_STANDARD 99)

