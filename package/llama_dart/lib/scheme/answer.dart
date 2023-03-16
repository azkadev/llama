// ignore_for_file: non_constant_identifier_names
import "json_dart.dart";
// import "dart:convert";



class Answer extends JsonDart {

  
  Answer(super.rawData);
   
  static Map get defaultData {
    return {"@type":"answer","text":""};
  }

  
  String? get special_type {
    try {
      if (rawData["@type"] is String == false){
        return null;
      }
      return rawData["@type"] as String;
    } catch (e) {
      return null;
    }
  }


  
  String? get text {
    try {
      if (rawData["text"] is String == false){
        return null;
      }
      return rawData["text"] as String;
    } catch (e) {
      return null;
    }
  }


  
  static Answer create({

    String? special_type,
    String? text,
})  {
    Answer answer = Answer({
  
      "@type": special_type,
      "text": text,


  });


return answer;

      }
}