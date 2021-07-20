import 'package:ppi_connect/arguments/argument.dart';
import 'package:ppi_connect/models/event.dart';
import 'package:flutter/material.dart';
import 'package:ppi_connect/providers/events_provider.dart';
import 'package:provider/provider.dart';

import 'main_screen.dart';

class Float extends StatelessWidget {
  const Float({state}) : _state = state;

  final MainScreenState _state;

  @override
  Widget build(BuildContext context) {
    return Consumer<EventNotifier>(builder: (context, eventNotifier, child) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if (_state.member.access_grant == 2)
            FloatingActionButton(
              tooltip: 'Add a new event',
              heroTag: null,
              onPressed: () => onAddPressed(context, eventNotifier),
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
    });
  }

  void onAddPressed(BuildContext context, EventNotifier en) async {
    final _event = await Navigator.pushNamed(context, '/new',
        arguments: MemberEventArguments(_state.member, Event()));
    if (_event != null) {
      en.addEvent(event: _event);
    }
  }

  void onRefreshPressed() {
    _state.refreshEventListFuture();
  }
  // void onAddPressed(BuildContext context) async {
  //   final _event = await Navigator.pushNamed(context, '/new',
  //       arguments: MemberEventArguments(_state.member, Event()));
  //   if (_event != null) {
  //     _state.addEvent(_event);
  //   }
  // }

  // void onRefreshPressed() {
  //   _state.refreshEventListFuture();
  // }
}
