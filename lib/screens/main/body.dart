import 'package:ppi_connect/services/todo_service.dart';
import 'package:flutter/material.dart';

import '../../models/todo.dart';
import 'main_screen.dart';

class Body extends StatelessWidget {
  const Body({state}) : _state = state;

  final MainScreenState _state;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Todo>>(
      future: _state.todoListFuture,
      builder: (context, snapshot){
        if(snapshot.hasData){
          _state.todoList = snapshot.data;
          return _buildListView();
        }
        return Center(child: Text('Please Login'),);
      }
    );
  }

  ListView _buildListView() {
    return ListView.separated(
        itemCount: _state.todoList.length,
        separatorBuilder: (context, index) => Divider(
          color: Colors.blueGrey,
        ),
        itemBuilder: (context, index) => ListTile(
          title: Text(
            '${_state.todoList[index].title}',
            style: TextStyle(decoration: _state.todoList[index].done == true ? TextDecoration.lineThrough : TextDecoration.none)),
          subtitle: Text(
            '${_state.todoList[index].description}'
          ),
          onTap: () => _todoTap(context, index),
          onLongPress: () => _todoLongPressed(index),
        ),
      );
  }
  void _todoTap(BuildContext context, int _index) async {
    //This _todo only contain the updated attribute. (Desc, Title & Done)
    final _todo = await Navigator.pushNamed(context, '/edit', arguments: _state.todoList[_index]);
    if(_todo != null){
      _state.updateTodo(index: _index, todo: _todo);
    }
  }

  void _todoLongPressed(int index){
    if(_state.todoList[index].done == true){
      _state.removeTodo(index);
    }
  }
}
