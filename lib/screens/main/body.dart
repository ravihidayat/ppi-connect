import 'package:ppi_connect/arguments/argument.dart';
import 'package:ppi_connect/notifiers/member_notifier.dart';

import 'package:ppi_connect/services/event_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../notifiers/events_notifier.dart';
import '../../models/event.dart';
import 'main_screen.dart';

class Body extends StatelessWidget {
  const Body({state}) : _state = state;

  final MainScreenState _state;

  @override
  Widget build(BuildContext context) {
    // return FutureBuilder<List<Event>>(
    //     future: _state.eventListFuture,
    //     builder: (context, snapshot) {
    //       if (snapshot.hasData) {
    //         _state.eventList = snapshot.data;
    //         return _buildListView();
    //       }
    //       return Center(
    //         child: Text('Please Login'),
    //       );
    //     });
    return Selector<EventNotifier, Event>(
        selector: (_, eventNotifier) => eventNotifier.changedEvent,
        builder: (context, _, __) {
          final eventProv = Provider.of<EventNotifier>(context);
          eventProv.getEvents();
          final eventsList = eventProv.events;
          if (eventsList == null) {
            return Center(child: CircularProgressIndicator());
          }
          return Consumer<MemberNotifier>(
              builder: (context, memberNotifier, __) {
            return SafeArea(
              child: ListView.builder(
                itemCount: eventsList.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                    elevation: 10,
                    child: ListTile(
                        tileColor:
                            eventsList[index].date.isBefore(DateTime.now())
                                ? Colors.amber
                                : Colors.white,
                        leading: CircleAvatar(
                          backgroundImage: AssetImage('assets/ppi.png'),
                        ),
                        title: Text('${eventsList[index].title}'),
                        subtitle: Text('${eventsList[index].category}'),
                        onTap: () => _eventTap(context, index, eventsList,
                            eventProv, memberNotifier),
                        onLongPress: () {
                          if (memberNotifier.member.access_grant == 2) {
                            _eventLongPressed(index, eventProv);
                          }
                        }),
                  );
                },
              ),
            );
          });
        });
  }

  // ListView _buildListView() {
  //   return ListView.separated(
  //     itemCount: _state.eventList.length,
  //     separatorBuilder: (context, index) => Divider(
  //       color: Colors.red,
  //     ),
  //     itemBuilder: (context, index) => ListTile(
  //       tileColor: _state.eventList[index].date.isBefore(DateTime.now())
  //           ? Colors.amber[100]
  //           : Colors.white,
  //       leading: CircleAvatar(
  //         backgroundImage: AssetImage('assets/ppi.png'),
  //       ),
  //       title: Text('${_state.eventList[index].title}'),
  //       subtitle: Text('${_state.eventList[index].category}'),
  //       onTap: () => _eventTap(context, index),
  //       onLongPress: () {
  //         if (_state.member.access_grant == 2) _eventLongPressed(index, eventsList[index]);
  //       },
  //     ),
  //   );
  // }

  // void _eventTap(BuildContext context, int _index) async {
  //   final _event = await Navigator.pushNamed(context, '/edit',
  //       arguments: MemberEventArguments(
  //         _state.member,
  //         _state.eventList[_index],
  //       ));
  //   if (_event != null) {
  //     _state.updateEvent(index: _index, event: _event);
  //   }
  // }

  // void _eventLongPressed(int index) {
  //   if (_state.eventList[index].date.isBefore(DateTime.now())) {
  //     _state.removeEvent(index);
  //   }
  // }
  void _eventTap(BuildContext context, int _index, List e, EventNotifier en,
      MemberNotifier mn) async {
    final _event = await Navigator.pushNamed(context, '/edit',
        arguments: MemberEventArguments(
          mn.member,
          e[_index],
        ));
    if (_event != null) {
      en.updateEvent(index: _index, event: _event);
    }
  }

  void _eventLongPressed(int index, EventNotifier en) {
    if (en.events[index].date.isBefore(DateTime.now())) {
      en.removeEvent(index: index);
    }
  }
}
