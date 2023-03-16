import 'package:llama_dart/llama_dart.dart';

void main(List<String> arguments) {
  LLaMa lib = LLaMa(pathLib: "/home/galaxeus/Documents/hexaminate/app/llama/native_lib/build/libllama.so");

  var calculate_result = lib.calculate(num1: 10, num2: 5);
  print(calculate_result);

  lib.print(data: 'azka');

  var result = lib.request(data: {"@type": "oke", "ok":"p"});
  print(result);
}
