import 'dart:developer';

import 'package:flutter/material.dart';

import '../../models/member.dart';
import '../../models/event.dart';
import '../../services/event_service.dart';

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
  Member _member;
  List<Event> _eventList;
  Future<List<Event>> _eventListFuture;

  Member get member => _member;
  set member(Member value) {
    _member = value;
    refreshEventListFuture();
  }

  List<Event> get eventList => _eventList;
  set eventList(value) => _eventList = value;

  Future<List<Event>> get eventListFuture => _eventListFuture;
  set eventListFuture(value) => _eventListFuture = value;

  void refreshEventListFuture(){
    if(_member != null){
      _eventListFuture = EventService.getAllEvent();
      setState(() {});
    }
  }

  void addEvent(Event event) async {
    if (_member != null) {
      final _event = await EventService.addEvent(event);
      setState(() => _eventList.add(_event));
    }
  }

  void updateEvent({int index, Event event}) async {
    event.id = _eventList[index].id;
    _eventList[index] = await EventService.updateEvent(event);
    refreshEventListFuture();
  }

  void removeEvent(int index) async {
    await EventService.removeEvent(_eventList[index]);
    refreshEventListFuture();
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
          body: _member != null
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
          drawer: _member != null ? AppDrawer(
            state: this,
          ) : null,
          // floatingActionButton: _member != null
          //     ? Float(
          //         state: this,
          //       )
          //     : null,
        ),
      ),
    );
  }
}
