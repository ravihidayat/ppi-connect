import 'package:flutter/cupertino.dart';

import 'package:ppi_connect/models/member.dart';
import 'package:flutter/material.dart';

import 'main_screen.dart';

class AppDrawer extends StatelessWidget {
  final MainScreenState _state;
  const AppDrawer({state}) : _state = state;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
              accountName:
                  Text(_state.member == null ? 'Anonymous' : _state.member.name),
              accountEmail: Text(_state.member == null
                  ? 'Anonymous'
                  : _state.member.matrix_card),
              currentAccountPicture: GestureDetector(
                onTap: () => _state.member == null
                    ? {}
                    : Navigator.pushNamed(context, '/profile',
                        arguments: _state.member),
                child: CircleAvatar(
                    backgroundImage: AssetImage('assets/unknown_user.png')),
              )),
        ],
      ),
    );
  }
}
