import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:ppi_connect/notifiers/member_notifier.dart';
import 'package:provider/provider.dart';

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
    setState(() {
      _member = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MemberNotifier>(builder: (context, memberNotifier, __) {
      return SafeArea(
        child: Scaffold(
          appBar: Bar(
            state: this,
          ),
          body: memberNotifier.member != null
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
          drawer: memberNotifier.member != null
              ? AppDrawer(
                  state: this,
                )
              : null,
          floatingActionButton: memberNotifier.member != null
              ? Float(
                  state: this,
                )
              : null,
        ),
      );
    });
  }
}
