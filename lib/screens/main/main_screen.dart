import 'dart:developer';

import 'package:flutter/material.dart';

import '../../models/user.dart';
import '../../models/todo.dart';
import '../../services/todo_service.dart';

import 'bar.dart';
import 'body.dart';
import 'float.dart';
import 'appdrawer.dart';

class MainScreen extends StatefulWidget {
  static Route route() => MaterialPageRoute(builder: (context) => MainScreen());

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  User _user;
  List<Todo> _todoList;
  Future<List<Todo>> _todoListFuture;

  User get user => _user;
  set user(User value) {
    _user = value;
    refreshTodoListFuture();
  }

  List<Todo> get todoList => _todoList;
  set todoList(value) => _todoList = value;

  Future<List<Todo>> get todoListFuture => _todoListFuture;
  set todoListFuture(value) => _todoListFuture = value;

  void refreshTodoListFuture() {
    if (_user != null) {
      _todoListFuture = TodoService.getTodoListByUser(_user.id);
      setState(() {});
    }
  }

  void addTodo(Todo todo) async {
    if (_user != null) {
      todo.user = _user.id;
      final _todo = await TodoService.addTodo(todo);
      setState(() => _todoList.add(_todo));
    }
  }

  void updateTodo({int index, Todo todo}) async {
    todo.id = _todoList[index].id;
    todo.user = _todoList[index].user;
    _todoList[index] = await TodoService.updateTodo(todo);
    refreshTodoListFuture();
  }

  void removeTodo(int index) async {
    await TodoService.removeTodo(_todoList[index]);
    refreshTodoListFuture();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: SafeArea(
        child: Scaffold(
          appBar: Bar(
            state: this,
          ),
          body: _user != null
              ? Body(
                  state: this,
                )
              : Container(
                  // color: Colors.red,
                  child: Center(
                    child: Stack(
                      children: <Widget>[
                        Container(
                          alignment: Alignment.center,
                          child: Image.asset(
                            'assets/ppi2.png',
                            height: 300,
                            width: double.infinity,
                            color: Colors.red.withOpacity(0.2),
                            // fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                            alignment: Alignment.center,
                            child: Text(
                              'Please Login First',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22.0),
                            )),
                      ],
                    ),
                  ),
                ),
          drawer: AppDrawer(
            state: this,
          ),
          floatingActionButton: _user != null
              ? Float(
                  state: this,
                )
              : null,
        ),
      ),
    );
  }
}
