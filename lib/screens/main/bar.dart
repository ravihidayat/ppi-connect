import 'package:ppi_connect/models/member.dart';
import 'package:flutter/material.dart';
import 'package:ppi_connect/notifiers/member_notifier.dart';
import 'package:provider/provider.dart';

import 'main_screen.dart';

class Bar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(60.0);

  final MainScreenState _state;
  const Bar({state}) : _state = state;

  @override
  Widget build(BuildContext context) {
    return Consumer<MemberNotifier>(builder: (context, memberNotifier, __) {
      return AppBar(
        // leading:
        //     CircleAvatar(
        //       backgroundImage: _state.member == null ?
        //         AssetImage('assets/unknown_member.png')
        //         : NetworkImage('${_state.member.photoUrl}')
        //     ),
        centerTitle: memberNotifier.member == null ? true : false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('PPI-UTM connect'),
            Text(memberRole(memberNotifier), style: TextStyle(fontSize: 12.0)),
          ],
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.login),
              onPressed: () {
                if (memberNotifier.member == null) {
                  onLogin(context);
                } else {
                  onLogout(context, memberNotifier);
                }
              })
        ],
      );
    });
  }

  String memberRole(MemberNotifier mn) {
    if (mn.member != null) {
      if (mn.member.access_grant == 1) {
        return 'Member';
      } else if (mn.member.access_grant == 2) {
        return 'Management';
      } else if (mn.member.access_grant == 3) {
        return 'Admin';
      }
    }
    return 'Welcome to PPI-UTM Apps';
  }

  void onLogin(BuildContext context) async {
    final _member = await Navigator.pushNamed(context, '/login');
    // if(_member != null){
    //   _state.member = _member;
    // }
  }

  void onLogout(BuildContext context, MemberNotifier mn) async {
    mn.member = null;
    await Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }
}
