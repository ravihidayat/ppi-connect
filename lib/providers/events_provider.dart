import 'package:flutter/material.dart';
import 'package:ppi_connect/models/event.dart';
import '../services/event_service.dart';

import '../dependencies.dart';

class EventNotifier with ChangeNotifier {
  List<Event> _events = [];

  List<Event> get events => _events;
  Event changedEvent;

  EventService get eventService => service();

  void addEvent() {
    // _events.add(value);
    notifyListeners();
  }

  Future<void> getEvents() async {
    _events = await EventService.getAllEvent();
    notifyListeners();
  }

  void updateEvent({int index, Event event}) async {
    event.id = _events[index].id;
    _events[index] = await EventService.updateEvent(event);
    changedEvent = event;
    notifyListeners();
  }
}
