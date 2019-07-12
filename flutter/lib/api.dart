import 'dart:convert';

import 'package:docker_api_sample/repository.dart';
import 'package:docker_api_sample/user.dart';
import 'item.dart';
import 'package:http/http.dart' as http;

class Api implements Source {
  final base_url = "http://dd7ac9cd.ngrok.io/api";
  final client = http.Client();

  @override
  addItem(Item item) async {    
    var url = base_url + '/users';
    try {
      var response = await client.get(url);
      // print(response.body);

      String body = '{ "name":"kim" }';//response.body;
      Map<String, dynamic> userMap = jsonDecode(body);
      User user = User.fromJson(userMap);
      print(user);

    } catch(e) {
      print(e);
    }
    return null;
  }
}