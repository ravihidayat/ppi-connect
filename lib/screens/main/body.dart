import 'package:ppi_connect/arguments/argument.dart';
import 'package:ppi_connect/services/event_service.dart';
import 'package:flutter/material.dart';

import '../../models/event.dart';
import 'main_screen.dart';

class Body extends StatelessWidget {
  const Body({state}) : _state = state;

  final MainScreenState _state;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Event>>(
      future: _state.eventListFuture,
      builder: (context, snapshot){
        if(snapshot.hasData){
          _state.eventList = snapshot.data;
          return _buildListView();
        }
        return Center(child: Text('Please Login'),);
      }
    );
  }

  ListView _buildListView() {
    return ListView.separated(
        itemCount: _state.eventList.length,
        separatorBuilder: (context, index) => Divider(
          color: Colors.blueGrey,
        ),
        itemBuilder: (context, index) => ListTile(
          title: Text(
            '${_state.eventList[index].title}',
            style: TextStyle(decoration: _state.eventList[index].done == true ? TextDecoration.lineThrough : TextDecoration.none)),
          subtitle: Text(
            '${_state.eventList[index].category}'
          ),
          onTap: () => _eventTap(context, index),
          onLongPress: () {
            if(_state.member.access_grant == 2) _eventLongPressed(index);
          },
        ),
      );
  }
  void _eventTap(BuildContext context, int _index) async {
    final _event = await Navigator.pushNamed(context, '/edit', 
      arguments: MemberEventArguments(
        _state.member,
        _state.eventList[_index],
      )
    );
    if(_event != null){
      _state.updateEvent(index: _index, event: _event);
    }
  }

  void _eventLongPressed(int index){
    if(_state.eventList[index].done == true){
      _state.removeEvent(index);
    }
  }
}
