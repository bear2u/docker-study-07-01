import 'package:docker_api_sample/repository.dart';
import 'package:docker_api_sample/user.dart';

import 'item.dart';
import 'package:rxdart/rxdart.dart';

class Bloc {

  final repository = Repository();

  // Input
  final _addUser = PublishSubject<User>();  
  final _users = PublishSubject<List<User>>();

  //Input
  // title
  final _title = PublishSubject<String>();
  // content
  final _content = PublishSubject<String>();
  // value
  final _value = PublishSubject<String>();

  // Output
  get addItem => _addUser.stream;
  get title => _title.stream;
  get content => _content.stream;
  get value => _value.stream;
  get users => _users.stream;

  // TODO title, content => value

  Bloc() {
    Observable.combineLatest2(title, content, (a, b) => _value.sink.add('<$a,$b>'));
  }

  add(User user) async {

    User ur = await repository.addUser(user);
    print('user => $ur');    
  }

  dispose() {
    _addUser.close();
    _title.close();
    _content.close();
    _value.close();
    _users.close();
  }
}