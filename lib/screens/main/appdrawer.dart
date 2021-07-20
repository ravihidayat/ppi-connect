import 'package:flutter/cupertino.dart';

import 'package:ppi_connect/models/member.dart';
import 'package:flutter/material.dart';
import 'package:ppi_connect/notifiers/member_notifier.dart';
import 'package:provider/provider.dart';

import 'main_screen.dart';

class AppDrawer extends StatelessWidget {
  final MainScreenState _state;
  const AppDrawer({state}) : _state = state;
  @override
  Widget build(BuildContext context) {
    return Consumer<MemberNotifier>(builder: (context, memberNotifier, __) {
      return Drawer(
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
                accountName: Text(memberNotifier.member == null
                    ? 'Anonymous'
                    : memberNotifier.member.name),
                accountEmail: Text(memberNotifier.member == null
                    ? 'Anonymous'
                    : memberNotifier.member.matrix_card),
                currentAccountPicture: GestureDetector(
                  onTap: () => memberNotifier.member == null
                      ? {}
                      : Navigator.pushNamed(context, '/profile',
                          arguments: memberNotifier.member),
                  child: CircleAvatar(
                      backgroundImage: AssetImage('assets/unknown_user.png')),
                )),
          ],
        ),
      );
    });
  }
}
