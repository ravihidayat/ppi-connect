import 'package:flutter/material.dart';
import 'package:ppi_connect/models/event.dart';
import '../services/event_service.dart';

import '../dependencies.dart';

class EventNotifier with ChangeNotifier {
  List<Event> _events = [];

  List<Event> get events => _events;
  Event changedEvent;

  EventService get eventService => service();

  Future<void> getEvents() async {
    _events = await EventService.getAllEvent();
    changedEvent = _events[_events.length - 1];
    notifyListeners();
  }

  void updateEvent({int index, Event event}) async {
    event.id = _events[index].id;
    _events[index] = await EventService.updateEvent(event);
    changedEvent = event;
    notifyListeners();
  }

  void addEvent({Event event}) async {
    final _event = await EventService.addEvent(event);
    _events.add(_event);
    changedEvent = event;
    notifyListeners();
  }

  void removeEvent({int index}) async {
    final _event = _events[index];
    await EventService.removeEvent(_events[index]);
    changedEvent = null;
    notifyListeners();
  }
}
