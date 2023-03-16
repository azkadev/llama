import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'package:llama_dart/llama_dart.dart';

class Args {
  List<String> args;
  Args(this.args);
  Pointer<Pointer<Utf8>> toNativeList() {
    List<Pointer<Utf8>> utf8PointerList = args.map((str) => str.toNativeUtf8()).toList();
    final Pointer<Pointer<Utf8>> pointerPointer = malloc.allocate(utf8PointerList.length);
    args.asMap().forEach((index, utf) {
      pointerPointer[index] = utf8PointerList[index];
    });
    return pointerPointer;
  }
}

typedef NativeMainFunction = Int Function(Int argc, Pointer<Pointer<Utf8>>);

typedef DartMainFunction = int Function(int argc, Pointer<Pointer<Utf8>>);
void main(List<String> arguments) {
  LLaMa lib = LLaMa(pathLib: "/home/galaxeus/Documents/hexaminate/app/llama/native_lib/build/libllama.so");
  DynamicLibrary dynamicLibrary = lib.library();
  Args args = Args(["./main", "-h"]);

  var test = dynamicLibrary.lookupFunction<NativeMainFunction, DartMainFunction>("main").call(args.args.length, args.toNativeList());

  print(test);
  // var calculate_result = lib.calculate(num1: 10, num2: 5);
  // print(calculate_result);

  // lib.print(data: 'azka');

  // var result = lib.request(data: {"@type": "oke", "ok":"p"});
  // print(result);
}
