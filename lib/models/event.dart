import 'package:flutter/foundation.dart';

class Event {
  String _event_title;
  String _event_details;
  bool _done;
  int _event_id;
  int _member;
  String _event_category;

  Event(
      {String event_title = '',
      String event_details = '',
      bool done = false,
      int event_id,
      int member,
      String event_category,})
      : _event_title = event_title,
        _event_details = event_details,
        _done = done,
        _event_id = event_id,
        _member = member,
        _event_category = event_category;

  String get title => _event_title;
  set title(event_title) =>_event_title = event_title;
  
  String get desc => _event_details;
  set desc(event_details) =>_event_details = event_details;
  
  bool get done =>_done;
  set done(done) =>_done = done;
  
  int get id =>_event_id;
  set id(event_id) =>_event_id = event_id;
  
  int get member => _member;
  set member(member) =>_member = member;

  String get category => _event_category;
  set category(event_category) =>_event_category = event_category;


  Event.copy(Event from) : this(
    event_title: from.title,
    event_details: from.desc,
    done: from.done,
    event_id: from.id,
    member: from.member,
    event_category: from.category,
  );

  Event.fromJson(Map<String, dynamic> json)
    : _event_title = json['event_title'],
      _event_details = json['event_details'],
      _done = json['done'], 
      _event_id = json['event_id'], 
      _member = json['member'],
      _event_category = json['event_category'];

  Map<String, dynamic> toJson() => {
    'event_title': _event_title,
    'event_details': _event_details,
    'done': _done,
    'event_id': _event_id,
    'member': _member,
    'event_category': _event_category,
  };
}
