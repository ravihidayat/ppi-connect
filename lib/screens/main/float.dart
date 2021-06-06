import 'package:ppi_connect/models/todo.dart';
import 'package:flutter/material.dart';

import 'main_screen.dart';

class Float extends StatelessWidget {
  const Float({state}) : _state = state;

  final MainScreenState _state;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          tooltip: 'Add a new todo',
          child: Icon(Icons.add),
          heroTag: null,
          onPressed: () => onAddPressed(context),
        ),
        FloatingActionButton(
            tooltip: 'Refresh',
            child: Icon(Icons.refresh),
            heroTag: null,
            onPressed: () => onRefreshPressed())
      ],
    );
  }

  void onAddPressed(BuildContext context) async {
    final _todo = await Navigator.pushNamed(context, '/new');
    if(_todo != null){
      _state.addTodo(_todo);
    }
  }
  void onRefreshPressed(){
    _state.refreshTodoListFuture();
  }
}
