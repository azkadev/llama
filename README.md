# LLaMA

WIP LLaMA (Language Learning for Machine Translation) adalah proyek riset yang diprakarsai oleh Facebook AI Research (FAIR) yang bertujuan untuk meningkatkan kualitas terjemahan mesin menggunakan pendekatan yang lebih alami dan berfokus pada bahasa asal.

## Resources

1. [Chat GPT 4](https://github.com/nomic-ai/gpt4all)
2. [LLaMA](https://github.com/facebookresearch/llama)

## How To Download Models


1. [Facebook LLaMA](https://github.com/facebookresearch/llama/pull/73/files)

### Memory Usage

| Model      | Disk | Mem |
|------------|------|-----|
| Chat GPT 4 | 4gb  | -   |

### Roadmap Features

Features yang akan datang

1. [x] Cross Platform (Android / linux / windows / ios / macos)
2. [ ] Docs

### TESTED ON

| NO | OS                                   | CPU             | RAM     |
|----|--------------------------------------|-----------------|---------|
| 1  | Ubuntu 20.04                         | AMD RYZEN 5500U | 8GB     |


### Development


```bash
git clone https://github.com/azkadev/llama.git --recursive
cd llama
```


### Build Shared Library

```bash
cd native_lib
rm -rf build
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Release ..
cmake --build .
```


### Install Package

Dart

```bash
dart pub add llama_dart
```

Flutter:

```bash
dart pub add llama_flutter
```


### Quickstart


```dart


```