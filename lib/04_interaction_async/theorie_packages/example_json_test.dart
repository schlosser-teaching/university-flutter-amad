import 'dart:convert';
import 'package:http/http.dart';

class RequestUser {
  final String name;
  final int age;

  RequestUser({required this.name, required this.age});

  factory RequestUser.fromJson(Map<String, dynamic> json) {
    return RequestUser(
        name: json['name'],
        age: json['age'],
    );
  }
}

class ExampleJsonTest {

  Future<void> parseExample() async {
    var response = await get(
        Uri.parse('http://dummy-test.com/api/user/schlosser')
    );
    var json = jsonDecode(response.body);
    var user = RequestUser.fromJson(json);
  }
}