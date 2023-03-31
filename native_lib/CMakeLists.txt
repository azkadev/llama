cmake_minimum_required(VERSION 3.10)

project(llama_library VERSION 0.0.1 LANGUAGES C CXX) 
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED true)
set(CMAKE_C_STANDARD 11)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fPIC -pthread")

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fPIC -pthread -mavx -mavx2 -mfma -mf16c -msse3")
add_subdirectory("lib/llama.cpp/examples")
add_subdirectory("lib/llama.cpp")
include_directories("lib/llama.cpp")
include_directories("lib/llama.cpp/examples")

add_library(llama_slebew SHARED main.cpp)
# add_library(ggml lib/llama.cpp/ggml.c) 
# add_library(utils lib/llama.cpp/examples/common.cpp lib/llama.cpp/examples/common.h)


# # add_executable(llama_exe main.cpp)

set_target_properties(llama_slebew PROPERTIES 
  PUBLIC_HEADER lib/llama.cpp/ggml.h
  PUBLIC_HEADER lib/llama.cpp/llama.h
  PUBLIC_HEADER lib/llama.cpp/examples/common.h
  OUTPUT_NAME "llama"
)


# # set_target_properties(llama_exe PROPERTIES 
# #   PUBLIC_HEADER lib/llama.cpp/ggml.h
# #   PUBLIC_HEADER lib/llama.cpp/utils.h
# #   OUTPUT_NAME "llama_exe"
# # )

# if (WIN32)
# set_target_properties(llama PROPERTIES
#   WINDOWS_EXPORT_ALL_SYMBOLS ON
# )
# endif (WIN32)
 

target_compile_definitions(llama PUBLIC DART_SHARED_LIB)
target_link_libraries(llama_slebew PRIVATE llama common ggml ${CMAKE_THREAD_LIBS_INIT})