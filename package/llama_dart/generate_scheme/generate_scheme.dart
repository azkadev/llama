import 'dart:io';

import 'package:galaxeus_lib/galaxeus_lib.dart';
import "package:path/path.dart" as path;

void main(List<String> args) async {
  List<Map> scripts = [
    {
      "@type": "error",
      "message": "",
      "description": ""
    },
    {
      "@type": "ok",
  
    }
  ];
  await jsonToScripts(
    scripts,
    directory: Directory(
      path.join(Directory.current.path, "lib", "scheme"),
    ),
  );
}
