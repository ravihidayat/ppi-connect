import 'package:flutter/cupertino.dart';

import 'package:ppi_connect/models/user.dart';
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
                  Text(_state.user == null ? 'Anonymous' : _state.user.name),
              accountEmail: Text(_state.user == null
                  ? 'Anonymous'
                  : _state.user.id.toString()),
              currentAccountPicture: GestureDetector(
                onTap: () => _state.user == null
                    ? {}
                    : Navigator.pushNamed(context, '/profile',
                        arguments: _state.user),
                child: CircleAvatar(
                    backgroundImage: _state.user == null
                        ? AssetImage('assets/unknown_user.png')
                        : NetworkImage('${_state.user.photoUrl}')),
              )),
        ],
      ),
    );
  }
}
