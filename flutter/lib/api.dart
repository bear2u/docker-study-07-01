import 'package:docker_api_sample/repository.dart';
import 'item.dart';
import 'package:http/http.dart' as http;

class Api implements Source {
  final base_url = "http://1c641899.ngrok.io/api";
  final client = http.Client();

  @override
  addItem(Item item) async {    
    var url = base_url + '/users';
    try {
      var response = await client.get(url);
      print(response.body);

    } catch(e) {
      print(e);
    }
    return null;
  }
}