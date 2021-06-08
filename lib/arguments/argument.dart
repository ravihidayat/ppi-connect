import 'package:ppi_connect/models/todo.dart';
import 'package:ppi_connect/models/user.dart';

class UserTodoArguments{
  final User user;
  final Todo todo;

  UserTodoArguments(this.user, this.todo);
}