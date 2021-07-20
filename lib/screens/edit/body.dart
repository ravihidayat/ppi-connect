import 'dart:developer';

import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:ppi_connect/models/event.dart';
import 'package:ppi_connect/notifiers/member_notifier.dart';
import 'package:ppi_connect/services/event_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
  String _venue = '';
  String _category = '';
  DateTime _date = DateTime.now();

  @override
  void initState() {
    super.initState();
    if (widget._state.isEditing == true) {
      _title = widget._state.data.title;
      _desc = widget._state.data.desc;
      _venue = widget._state.data.venue;
      _category = widget._state.data.category;
      _date = widget._state.data.date;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MemberNotifier>(builder: (context, memberNotifier, __) {
      return ListView(
        children: [
          memberNotifier.member.access_grant == 2
              ? _buildTextInputListTile(
                  label: 'Title',
                  value: _title,
                  onChanged: (value) {
                    setState(() => _title = value);
                  })
              : Container(),
          memberNotifier.member.access_grant == 2
              ? _buildTextInputListTile(
                  label: 'Description',
                  value: _desc,
                  onChanged: (value) {
                    setState(() => _desc = value);
                  })
              : Center(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      _desc,
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                ),
          memberNotifier.member.access_grant == 2
              ? _buildTextInputListTile(
                  label: 'Venue',
                  value: _venue,
                  onChanged: (value) {
                    setState(() => _venue = value);
                  })
              : Center(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      _venue,
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                ),
          _dropDownCategory(context, memberNotifier),
          Visibility(
            visible: (_desc == '' ||
                _title == '' ||
                _venue == '' ||
                _category == ''),
            child: Center(
                child: Text(
              'Don\'t leave any field empty',
              style: TextStyle(color: Colors.red, fontSize: 15.0),
            )),
          ),
          TextButton(
            onPressed: () => widget._state.isEditing == true &&
                    memberNotifier.member.access_grant == 2
                ? _datePicker(context)
                : {},
            child: Text(DateFormat.yMMMd().format(_date).toString()),
          ),
          _buildButtons(context, memberNotifier),
        ],
      );
    });
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

  Row _buildButtons(BuildContext context, MemberNotifier mn) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        mn.member.access_grant == 2
            ? ElevatedButton(
                onPressed: () => widget._state.isEditing == true
                    ? _onEventOkPressedEdit(context)
                    : _onEventOkPressedAdd(context),
                child: Text('Ok'),
              )
            : Container(),
        SizedBox(width: 10.0),
        ElevatedButton(
          onPressed: () => _onEventCancelPressed(context),
          child: mn.member.access_grant == 2 ? Text('Cancel') : Text('Back'),
        ),
      ],
    );
  }

  Center _dropDownCategory(BuildContext context, MemberNotifier mn) {
    return Center(
      child: DropdownButton<String>(
        value: _category == '' ? null : _category,
        style: TextStyle(color: Colors.black),
        items: mn.member.access_grant != 2
            ? null
            : [
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
          (mn.member.access_grant != 2 && widget._state.isEditing)
              ? _category
              : 'Please choose a Category',
          style: TextStyle(
              color: Colors.black, fontSize: 14, fontWeight: FontWeight.w600),
        ),
        onChanged: (String value) {
          if (mn.member.access_grant == 2) {
            setState(() {
              _category = value;
            });
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
    if (!(_desc == '' || _title == '' || _venue == '' || _category == '')) {
      var _event = Event(
          event_details: _desc,
          event_title: _title,
          event_date: _date,
          event_venue: _venue,
          event_category: _category);
      Navigator.pop(context, _event);
    }
  }

  void _onEventOkPressedEdit(BuildContext context) async {
    if (!(_desc == '' || _title == '' || _venue == '')) {
      var _event = Event(
          event_details: _desc,
          event_title: _title,
          event_date: _date,
          event_venue: _venue,
          event_category: _category);
      Navigator.pop(context, _event);
    }
  }

  void _onEventCancelPressed(BuildContext context) {
    Navigator.pop(context, null);
  }
}
