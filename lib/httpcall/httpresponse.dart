import 'package:simplehttpcall/models/model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


 fetchData() async {
  final response = await http.get(Uri.parse("https://thejustinandrew.pythonanywhere.com//task-list/"));
  if(response.statusCode == 200){
    print(response.body);
    final data = jsonDecode(response.body);
    return data;
  }
  else{
    throw Exception();
  }
}