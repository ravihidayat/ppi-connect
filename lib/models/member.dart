class Member {
  int _matrix_card;
  String _name;
  String _photoUrl;
  String _email;
  String _password;

  int _access_grant; // 1 = member, 2 = management

  int get matrix_card => _matrix_card;
  set matrix_card(value) => _matrix_card = value;

  String get name => _name;
  set name(value) => _name = value;

  String get photoUrl => _photoUrl;
  set photoUrl(value) => _photoUrl = value;

  String get email => _email;
  set email(value) => _email = value;

  String get password => _password;
  set password(value) => _password = value;

  int get access_grant => _access_grant;
  set access_grant(value) => _access_grant = value;

  Member(
      {int matrix_card,
      String name = '',
      String photoUrl = '',
      String email = '',
      String password = '',
      int access_grant})
      : _matrix_card = matrix_card,
        _name = name,
        _photoUrl = photoUrl,
        _email = email,
        _password = password,
        _access_grant = access_grant;

  Member.copy(Member from)
      : this(
            matrix_card: from.matrix_card,
            name: from.name,
            photoUrl: from.photoUrl,
            email: from.email,
            password: from.password,
            access_grant: from.access_grant);
  
  Member.fromJson(Map<String, dynamic> json)
    : _matrix_card = json['matrix_card'],
      _name = json['name'],
      _photoUrl = json['photoUrl'], 
      _email = json['email'], 
      _password = json['password'], 
      _access_grant = json['access_grant'];

  //d
  Map<String, dynamic> toJson() => {
    'matrix_card': _matrix_card,
    'name': _name,
    'photoUrl': _photoUrl,
    'email': _email,
    'password': _password,
    'access_grant': _access_grant,
  };
}
