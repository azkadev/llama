cmake_minimum_required(VERSION 3.10)

project(llama_library VERSION 0.0.1 LANGUAGES C CXX)
set(CMAKE_CXX_STANDARD 20)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fPIC")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fPIC")

add_library(llama SHARED llama.cpp)
add_executable(llama_exe llama.cpp)

set_target_properties(llama PROPERTIES 
  OUTPUT_NAME "llama"
)

set_target_properties(llama_exe PROPERTIES 
  OUTPUT_NAME "llama"
)

if (WIN32)
set_target_properties(llama PROPERTIES
  WINDOWS_EXPORT_ALL_SYMBOLS ON
)
endif (WIN32)
 