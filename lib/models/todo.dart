class Todo {
  String _title;
  String _description;
  bool _done;
  int _id;
  int _user;

  Todo(
      {String title = '',
      String description = '',
      bool done = false,
      int id,
      int user})
      : _title = title,
        _description = description,
        _done = done,
        _id = id,
        _user = user;

  String get title => _title;
  set title(title) =>_title = title;
  
  String get description => _description;
  set description(description) =>_description = description;
  
  bool get done =>_done;
  set done(done) =>_done = done;
  
  int get id =>_id;
  set id(id) =>_id = id;
  
  int get user => _user;
  set user(user) =>_user = user;


  Todo.copy(Todo from) : this(title: from.title, description: from.description, done: from.done, id: from.id, user: from.user);


  Todo.fromJson(Map<String, dynamic> json)
    : _title = json['title'],
      _description = json['description'],
      _done = json['done'], 
      _id = json['id'], 
      _user = json['user'];

  Map<String, dynamic> toJson() => {
    'title': _title,
    'description': _description,
    'done': _done,
    'id': _id,
    'user': _user,
  };
}