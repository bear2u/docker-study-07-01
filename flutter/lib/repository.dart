import 'item.dart';

class Repository {
  final sources = [
    new Api()
  ];

  Future addItem(Item item) {
    return sources[0].addItem(item);
  }
}

abstract class Source {
  addItem(Item item);
}

class Api implements Source {
  @override
  addItem(Item item) {    
    return null;
  }
}