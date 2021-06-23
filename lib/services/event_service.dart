import 'dart:convert';

import 'package:http/http.dart';

import 'rest.dart';
import '../models/event.dart';

class EventService {
  static Future<List<Event>> getAllEvent() async {
    final List jsonList = await Rest.get('event');

    return jsonList.map((json) => Event.fromJson(json)).toList();
  }

  static Future<Event> addEvent(Event event) async {
    final json = await Rest.post('event', data:event);

    return Event.fromJson(json);
  }

  static Future<Event> updateEvent(Event event) async {
    final json = await Rest.patch('event/${event.id}', data: event);

    return Event.fromJson(json);
  }

  static Future<void> removeEvent(Event event) async {
    await Rest.delete('event/${event.id}');
  }
}
