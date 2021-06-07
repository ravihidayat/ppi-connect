class User {
  int _id;
  String _name;
  String _photoUrl;
  String _login;
  String _password;

  int _role; // 1 = member, 2 = management

  int get id => _id;
  set id(value) => _id = value;

  String get name => _name;
  set name(value) => _name = value;

  String get photoUrl => _photoUrl;
  set photoUrl(value) => _photoUrl = value;

  String get login => _login;
  set login(value) => _login = value;

  String get password => _password;
  set password(value) => _password = value;

  int get role => _role;
  set role(value) => _role = value;

  User(
      {int id,
      String name = '',
      String photoUrl = '',
      String login = '',
      String password = '',
      int role})
      : _id = id,
        _name = name,
        _photoUrl = photoUrl,
        _login = login,
        _password = password,
        _role = role;

  User.copy(User from)
      : this(
            id: from.id,
            name: from.name,
            photoUrl: from.photoUrl,
            login: from.login,
            password: from.password,
            role: from.role);
  
  User.fromJson(Map<String, dynamic> json)
    : _id = json['id'],
      _name = json['name'],
      _photoUrl = json['photoUrl'], 
      _login = json['login'], 
      _password = json['password'], 
      _role = json['role'];

  //d
  Map<String, dynamic> toJson() => {
    'id': _id,
    'name': _name,
    'photoUrl': _photoUrl,
    'login': _login,
    'password': _password,
    'role': _role,
  };
}
