import 'dart:developer';

import 'package:ppi_connect/models/todo.dart';
import 'package:ppi_connect/services/todo_service.dart';
import 'package:flutter/material.dart';

import 'edit_screen.dart';

class Body extends StatefulWidget {
  const Body({state}) : _state = state;

  final EditScreenState _state;
  @override
  _Body createState() => _Body();
}

class _Body extends State<Body> {
  String _title = '';
  String _desc = '';
  String _category = '';
  bool _done;

  @override
  void initState() {
    super.initState();
    if(widget._state.isEditing == true){
      _title = widget._state.data.title;
      _desc = widget._state.data.description;
      _category = widget._state.data.category;
      _done = widget._state.data.done;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        widget._state.user.role == 2 ?
        _buildTextInputListTile(
          label: 'Title',
          value: _title,
          onChanged: (value) {
          setState(() => _title = value);
        }) : Container(),
        widget._state.user.role == 2 ?
        _buildTextInputListTile(
          label: 'Description',
          value:  _desc,
          onChanged: (value) {
          setState(() =>  _desc = value);
        }) : Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              _desc,
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ),
        ),
        _dropDownCategory(context),
        Visibility(
          visible: (_desc == '' || _title == '' || _category == ''),
          child: Center(
            child: Text(
              'Don\'t leave any field empty',
              style: TextStyle(color: Colors.red, fontSize: 15.0),
            ) 
          ),
        ),
        _doneCheckList(context),
        _buildButtons(context),
      ],
    );
  }

  ListTile _buildTextInputListTile({label, value, onChanged}) {
    return ListTile(
      title: TextFormField(
        initialValue: value,
        decoration: InputDecoration(
          labelText: label,
        ),
        onChanged: onChanged,
      ),
    );
  }

  Row _buildButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        widget._state.user.role == 2 ?
        ElevatedButton(
          onPressed: () => widget._state.isEditing == true ? 
            _onTodoOkPressedEdit(context) : _onTodoOkPressedAdd(context),
          child: Text('Ok'),
        ) : Container(),
        SizedBox(width: 10.0),
        ElevatedButton(
          onPressed: () => _onTodoCancelPressed(context),
          child: widget._state.user.role == 2? Text('Cancel') : Text('Back'),
        ),
      ],
    );
  }

  Center _dropDownCategory(BuildContext context){
    return Center(
      child: DropdownButton<String>(
        value: _category == ''? null : _category,
        style: TextStyle(color: Colors.black),
        items: widget._state.user.role == 1 ? null : [
          'Human Dev',
          'Strategic Studies',
          'Sport',
          'Academic',
          'Arts or Music',
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        hint: Text(
          (widget._state.user.role == 1 && widget._state.isEditing) ? 
          _category :
          'Please choose a Category',
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w600),
          ),
        onChanged: (String value) {
          if(widget._state.user.role == 2){
            setState(() { _category = value; });
          }
        },
      ),
    );
  }

  dynamic _doneCheckList(BuildContext context){
    if(widget._state.isEditing == true && widget._state.user.role == 2){
      return CheckboxListTile(
        value: _done,
        onChanged: (value) {
          setState(() => _done = value);
        },
        title: Text('Done'),
      );
    }
    return Container();
  }

  void _onTodoOkPressedAdd(BuildContext context) async {
    if(!(_desc == '' || _title == '' || _category == '')){
      var _todo = Todo(description: _desc, title: _title, category: _category);
      Navigator.pop(context, _todo);
    }
  }

  void _onTodoOkPressedEdit(BuildContext context) async {
    if(!(_desc == '' || _title == '')){
      var _todo = Todo(description: _desc, title: _title, done: _done, category: _category);
      Navigator.pop(context, _todo);
    }
  }

  void _onTodoCancelPressed(BuildContext context){
    Navigator.pop(context, null);
  }
}
