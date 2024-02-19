cmake_minimum_required(VERSION 3.15)
project(bbl-usd VERSION 0.1 LANGUAGES C CXX)

find_package(pxr REQUIRED)

add_library(openusd-c ${BBL_USD_SRC_FILE})

target_link_libraries(
  openusd-c 
    PUBLIC 
      ${PXR_LIBRARIES}
)
