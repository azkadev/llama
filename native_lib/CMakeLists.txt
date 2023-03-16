cmake_minimum_required(VERSION 3.10)

project(llama_library VERSION 0.0.1 LANGUAGES C CXX)
set(CMAKE_CXX_STANDARD 20)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fPIC -pthread")

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fPIC -pthread -mavx -mavx2 -mfma -mf16c -msse3")


add_library(ggml lib/llama.cpp/ggml.c) 
add_library(utils lib/llama.cpp/utils.cpp) 

add_library(llama SHARED llama.cpp)
add_executable(llama_exe llama.cpp)

set_target_properties(llama PROPERTIES 
  PUBLIC_HEADER lib/llama.cpp/ggml.h
  PUBLIC_HEADER lib/llama.cpp/utils.h
  OUTPUT_NAME "llama"
)

set_target_properties(llama_exe PROPERTIES 
  PUBLIC_HEADER lib/llama.cpp/ggml.h
  PUBLIC_HEADER lib/llama.cpp/utils.h
  OUTPUT_NAME "llama"
)

if (WIN32)
set_target_properties(llama PROPERTIES
  WINDOWS_EXPORT_ALL_SYMBOLS ON
)
endif (WIN32)
 

# target_compile_definitions(llama PUBLIC DART_SHARED_LIB)
# target_link_libraries(llama PRIVATE utils ggml ${CMAKE_THREAD_LIBS_INIT})