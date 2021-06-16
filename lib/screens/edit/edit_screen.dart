import 'package:ppi_connect/arguments/argument.dart';
import 'package:ppi_connect/models/user.dart';
import 'package:ppi_connect/screens/edit/bar.dart';
import 'package:flutter/material.dart';

import '../../models/event.dart';
import 'body.dart';

class EditScreen extends StatefulWidget {
  static Route route({isEditing = true, data}) => MaterialPageRoute(
      builder: (context) => EditScreen(isEditing: isEditing, data: data));

  final bool _isEditing;
  final _data;

  bool get isEditing => _isEditing;

  dynamic get data => _data;
  EditScreen({isEditing, data})
      : _isEditing = isEditing,
        _data = data as UserEventArguments;
        

  @override
  EditScreenState createState() => EditScreenState();
}

class EditScreenState extends State<EditScreen> {
  Event get data => widget.data.event;
  User get user => widget.data.user;
  bool get isEditing => widget.isEditing;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: SafeArea(
        child: Scaffold(
          appBar: Bar(state: this),
          body: Body(state: this),
        ),
      ),
    );
  }
}
