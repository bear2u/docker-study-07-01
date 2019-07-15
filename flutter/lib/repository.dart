import 'package:docker_api_sample/user.dart';

import 'api.dart';

class Repository {
  final sources = [
    new Api()
  ];

  Future<User> addUser(User user) {
    return sources[0].addUser(user);
  }
}

abstract class Source {
  Future<User> addUser(User item);
}