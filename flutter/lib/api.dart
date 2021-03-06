import 'dart:convert';

import 'package:docker_api_sample/repository.dart';
import 'package:docker_api_sample/user.dart';
import 'package:http/http.dart';
import 'item.dart';
import 'package:http/http.dart' as http;

class Api implements Source {
  final base_url = "http://b455e96e.ngrok.io/api";
  final client = http.Client();

  @override
  Future<User> addUser(User user) async {    
    var url = base_url + '/users';

    try {      
      Response response = await client.post(url, body: user.toJson());
      // print(response.body);

      if(response.statusCode == 500) {
        throw Exception('500 error');
      }

      String body = response.body;

      Map<String, dynamic> map = jsonDecode(body);

      // List<dynamic> users = jsonDecode(body);
      
      // // User user = User.fromJson(userMap);
      // List<User> result = users.map((user) => User.fromJson(user)).toList();

      return User.fromJson(map);

    } catch(e) {
      print(e);
    }
    return null;
  }
}