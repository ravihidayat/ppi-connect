import 'dart:convert';

import 'package:http/http.dart';

import 'rest.dart';
import '../models/todo.dart';

class TodoService {
  static Future<List<Todo>> getAllTodo() async {
    final List jsonList = await Rest.get('todos');

    return jsonList.map((json) => Todo.fromJson(json)).toList();
  }

  static Future<List<Todo>> getTodoListByUser(int userId) async {
    final List jsonList = await Rest.get('todos?user=$userId');

    return jsonList.map((json) => Todo.fromJson(json)).toList();
  }

  static Future<Todo> addTodo(Todo todo) async {
    final json = await Rest.post('todos', data:todo);

    return Todo.fromJson(json);
  }

  static Future<Todo> updateTodo(Todo todo) async {
    final json = await Rest.patch('todos/${todo.id}', data: todo);

    return Todo.fromJson(json);
  }

  static Future<void> removeTodo(Todo todo) async {
    await Rest.delete('todos/${todo.id}');
  }
}
