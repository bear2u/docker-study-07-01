import 'package:docker_api_sample/user.dart';

import 'api.dart';
import 'item.dart';

class Repository {
  final sources = [
    new Api()
  ];

  Future<List<User>> addItem(Item item) {
    return sources[0].addItem(item);
  }
}

abstract class Source {
  Future<List<User>> addItem(Item item);
}