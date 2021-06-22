import 'dart:developer';

import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:ppi_connect/models/event.dart';
import 'package:ppi_connect/services/event_service.dart';
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
  DateTime _date = DateTime.now();

  @override
  void initState() {
    super.initState();
    if(widget._state.isEditing == true){
      _title = widget._state.data.title;
      _desc = widget._state.data.desc;
      _category = widget._state.data.category;
      _date = widget._state.data.date;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        widget._state.member.access_grant == 2 ?
        _buildTextInputListTile(
          label: 'Title',
          value: _title,
          onChanged: (value) {
          setState(() => _title = value);
        }) : Container(),
        widget._state.member.access_grant == 2 ?
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
        TextButton(
          onPressed: () => widget._state.isEditing == true && widget._state.member.access_grant == 2 ? 
          _datePicker(context) : {},
          child: Text(DateFormat.yMMMd().format(_date).toString()),
        ),
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
        widget._state.member.access_grant == 2 ?
        ElevatedButton(
          onPressed: () => widget._state.isEditing == true ? 
            _onEventOkPressedEdit(context) : _onEventOkPressedAdd(context),
          child: Text('Ok'),
        ) : Container(),
        SizedBox(width: 10.0),
        ElevatedButton(
          onPressed: () => _onEventCancelPressed(context),
          child: widget._state.member.access_grant == 2? Text('Cancel') : Text('Back'),
        ),
      ],
    );
  }

  Center _dropDownCategory(BuildContext context){
    return Center(
      child: DropdownButton<String>(
        value: _category == ''? null : _category,
        style: TextStyle(color: Colors.black),
        items: widget._state.member.access_grant == 1 ? null : [
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
          (widget._state.member.access_grant == 1 && widget._state.isEditing) ? 
          _category :
          'Please choose a Category',
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w600),
          ),
        onChanged: (String value) {
          if(widget._state.member.access_grant == 2){
            setState(() { _category = value; });
          }
        },
      ),
    );
  }

  Future<void> _datePicker(BuildContext context) async {
    final picked = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != _date) {
      setState(() {
        _date = picked;
      });
    }
  }

  void _onEventOkPressedAdd(BuildContext context) async {
    if(!(_desc == '' || _title == '' || _category == '')){
      var _event = Event(event_details: _desc, event_title: _title, event_date: _date, event_category: _category);
      Navigator.pop(context, _event);
    }
  }

  void _onEventOkPressedEdit(BuildContext context) async {
    if(!(_desc == '' || _title == '')){
      var _event = Event(event_details: _desc, event_title: _title, event_date: _date, event_category: _category);
      Navigator.pop(context, _event);
    }
  }

  void _onEventCancelPressed(BuildContext context){
    Navigator.pop(context, null);
  }
}
