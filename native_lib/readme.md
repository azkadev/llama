# Native Lib llama

1. Cross platform

```bash
rm -rf build
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Release ..
cmake --build .
``` 

2. Untuk Android

```bash
rm -rf build
mkdir build
cd build
cmake .. -DCMAKE_TOOLCHAIN_FILE=${ANDROID_SDK}/ndk/24.0.8215888/build/cmake/android.toolchain.cmake -DCMAKE_BUILD_TYPE=Release -DANDROID_ABI=arm64-v8a
cmake --build .
```



<!-- 



cc  -I.              -O3 -DNDEBUG -std=c11   -fPIC -pthread -mavx -mavx2 -mfma -mf16c -msse3   -c ggml.c -o ggml.o
g++ -I. -I./examples -O3 -DNDEBUG -std=c++11 -fPIC -pthread -c utils.cpp -o utils.o
g++ -I. -I./examples -O3 -DNDEBUG -std=c++11 -fPIC -pthread main.cpp ggml.o utils.o -o main 



cc  -I.              -O3 -DNDEBUG -std=c11   -fPIC -pthread -mavx -mavx2 -mfma -mf16c -msse3   -c lib/llama.cpp/ggml.c -o ggml.o
g++ -I. -I./examples -O3 -DNDEBUG -std=c++11 -fPIC -pthread -c lib/llama.cpp/utils.cpp -o utils.o
g++ -I. -I./examples -O3 -DNDEBUG -std=c++11 -fPIC -pthread llama.cpp ggml.o utils.o -o main 

cc  -I.              -O3 -DNDEBUG -std=c11   -fPIC -pthread -mavx -mavx2 -mfma -mf16c -msse3   -c lib/llama.cpp/ggml.c -o ggml.o
g++ -I. -I./examples -O3 -DNDEBUG -std=c++11 -fPIC -pthread -c lib/llama.cpp/utils.cpp -o utils.o
g++ -I. -I./examples -O3 -DNDEBUG -std=c++11 -fPIC -pthread main.cpp ggml.o utils.o -o main 



 -->