import 'package:ppi_connect/arguments/argument.dart';
import 'package:ppi_connect/models/event.dart';
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
        if(_state.user.role == 2)
        FloatingActionButton(
          tooltip: 'Add a new event',
          heroTag: null,
          onPressed: () => onAddPressed(context),
          child: Icon(Icons.add),
        ),
        FloatingActionButton(
            tooltip: 'Refresh',
            heroTag: null,
            onPressed: () => onRefreshPressed(),
            child: Icon(Icons.refresh),
        )
      ],
    );
  }

  void onAddPressed(BuildContext context) async {
    final _event = await Navigator.pushNamed(context, '/new',
      arguments: UserEventArguments(_state.user, Event())
    );
    if(_event != null){
      _state.addEvent(_event);
    }
  }
  void onRefreshPressed(){
    _state.refreshEventListFuture();
  }
}
