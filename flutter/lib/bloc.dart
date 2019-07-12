import 'package:docker_api_sample/repository.dart';
import 'package:docker_api_sample/user.dart';

import 'item.dart';
import 'package:rxdart/rxdart.dart';

class Bloc {

  final repository = Repository();

  // Input
  final _addItem = PublishSubject<Item>();  
  final _users = PublishSubject<List<User>>();

  //Input
  // title
  final _title = PublishSubject<String>();
  // content
  final _content = PublishSubject<String>();
  // value
  final _value = PublishSubject<String>();

  // Output
  get addItem => _addItem.stream;
  get title => _title.stream;
  get content => _content.stream;
  get value => _value.stream;
  get users => _users.stream;

  // TODO title, content => value

  Bloc() {
    Observable.combineLatest2(title, content, (a, b) => _value.sink.add('<$a,$b>'));
  }

  add(Item item) async {
    // print('$item');
    // _addItem.sink.add(item);

    List<User> users = await repository.addItem(item);
    print('users > $users');
    _users.sink.add(users);
  }

  dispose() {
    _addItem.close();
    _title.close();
    _content.close();
    _value.close();
    _users.close();
  }
}