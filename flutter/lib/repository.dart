import 'package:docker_api_sample/user.dart';

import 'api.dart';

class Repository {
  final sources = [
    new Api()
  ];

  Future<List<User>> addUser(User user) {
    return sources[0].addUser(user);
  }
}

abstract class Source {
  Future<List<User>> addUser(User item);
}