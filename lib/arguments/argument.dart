import 'package:ppi_connect/models/event.dart';
import 'package:ppi_connect/models/member.dart';

class MemberEventArguments{
  final Member member;
  final Event event;

  MemberEventArguments(this.member, this.event);
}