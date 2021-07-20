import 'package:flutter/material.dart';
import 'package:ppi_connect/models/event.dart';
import 'package:ppi_connect/models/member.dart';
import '../services/member_service.dart';

import '../dependencies.dart';

class MemberNotifier with ChangeNotifier {
  Member _member;
  Member get member => _member;
  void set member(member) => _member = member;

  Future<void> authenticateMember(String _email, String _password) async {
    _member = await MemberService.getMemberByLoginAndPassword(
      email: _email,
      password: _password,
    );
    notifyListeners();
  }
}
