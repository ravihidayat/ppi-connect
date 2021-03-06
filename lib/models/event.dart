import 'package:flutter/foundation.dart';

class Event {
  String _event_title;
  String _event_details;
  String _event_venue;
  DateTime _event_date;
  int _id;
  String _event_category;

  Event({
    String event_title = '',
    String event_details = '',
    String event_venue = '',
    DateTime event_date,
    int id,
    String event_category,
  })
    : _event_title = event_title,
      _event_details = event_details,
      _event_venue = event_venue,
      _event_date = event_date,
      _id = id,
      _event_category = event_category;

  String get title => _event_title;
  set title(event_title) =>_event_title = event_title;
  
  String get desc => _event_details;
  set desc(event_details) =>_event_details = event_details;
  
  String get venue => _event_venue;
  set venue(event_venue) => _event_venue = event_venue;

  DateTime get date => _event_date;
  set date(event_date) => _event_date = event_date;
  
  int get id =>_id;
  set id(id) =>_id = id;

  String get category => _event_category;
  set category(event_category) =>_event_category = event_category;


  Event.copy(Event from) : this(
    id: from.id,
    event_title: from.title,
    event_details: from.desc,
    event_venue: from.venue,
    event_date: from.date,
    event_category: from.category,
  );

  Event.fromJson(Map<String, dynamic> json)
    : _id = json['id'],
      _event_title = json['event_title'],
      _event_details = json['event_details'],
      _event_venue = json['event_venue'],
      _event_date = DateTime.tryParse(json['event_date']), 
      _event_category = json['event_category'];

  Map<String, dynamic> toJson() => {
    'id': _id,
    'event_title': _event_title,
    'event_details': _event_details,
    'event_venue': _event_venue,
    'event_date': _event_date.toString(),
    'event_category': _event_category,
  };
}
