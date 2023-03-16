cmake_minimum_required(VERSION 3.10)
project(llama_flutter_library VERSION 0.0.0 LANGUAGES C CXX)

add_library(llama_flutter SHARED
  "llama.cpp"
)

set_target_properties(llama_flutter PROPERTIES
  # PUBLIC_HEADER llama_flutter.h
  OUTPUT_NAME "llama"
)

target_compile_definitions(llama_flutter PUBLIC DART_SHARED_LIB)
