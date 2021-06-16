import 'package:ppi_connect/models/event.dart';
import 'package:ppi_connect/models/user.dart';

class UserEventArguments{
  final User user;
  final Event event;

  UserEventArguments(this.user, this.event);
}