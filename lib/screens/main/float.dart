import 'package:ppi_connect/arguments/argument.dart';
import 'package:ppi_connect/models/event.dart';
import 'package:flutter/material.dart';
import 'package:ppi_connect/notifiers/member_notifier.dart';
import '../../notifiers/events_notifier.dart';
import 'package:provider/provider.dart';

import 'main_screen.dart';

class Float extends StatelessWidget {
  const Float({state}) : _state = state;

  final MainScreenState _state;

  @override
  Widget build(BuildContext context) {
    return Consumer<EventNotifier>(builder: (context, eventNotifier, child) {
      return Consumer<MemberNotifier>(
          builder: (context, memberNotifier, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if (memberNotifier.member.access_grant == 2)
              FloatingActionButton(
                tooltip: 'Add a new event',
                heroTag: null,
                onPressed: () =>
                    onAddPressed(context, eventNotifier, memberNotifier),
                child: Icon(Icons.add),
              ),
            FloatingActionButton(
              tooltip: 'Refresh',
              heroTag: null,
              onPressed: () => onRefreshPressed(eventNotifier),
              child: Icon(Icons.refresh),
            )
          ],
        );
      });
    });
  }

  void onAddPressed(
      BuildContext context, EventNotifier en, MemberNotifier mn) async {
    final _event = await Navigator.pushNamed(context, '/new',
        arguments: MemberEventArguments(mn.member, Event()));
    if (_event != null) {
      en.addEvent(event: _event);
    }
  }

  void onRefreshPressed(EventNotifier en) {
    en.getEvents();
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
