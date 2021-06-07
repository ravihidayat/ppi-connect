import 'package:ppi_connect/screens/edit/bar.dart';
import 'package:flutter/material.dart';

import '../../models/todo.dart';
import 'body.dart';

class EditScreen extends StatefulWidget {
  static Route route({isEditing = true, data}) => MaterialPageRoute(
      builder: (context) => EditScreen(isEditing: isEditing, data: data));

  final bool _isEditing;
  final Todo _data;

  bool get isEditing => _isEditing;

  Todo get data => _data;
  EditScreen({isEditing, data})
      : _isEditing = isEditing,
        _data = data;
        

  @override
  EditScreenState createState() => EditScreenState();
}

class EditScreenState extends State<EditScreen> {
  Todo get data => widget.data;
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
