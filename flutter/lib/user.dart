class User {
  String name;

  User({this.name});

  User.fromJson(Map<String, dynamic> json)
      : name = json['name'];

  Map<String, dynamic> toJson() =>
    {
      'name': name
    };

  @override
  String toString() {
    // TODO: implement toString
    return "User class => name:$name";
  }
}