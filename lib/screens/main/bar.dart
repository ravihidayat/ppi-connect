import 'package:ppi_connect/models/member.dart';
import 'package:flutter/material.dart';

import 'main_screen.dart';

class Bar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(60.0);

  final MainScreenState _state;
  const Bar({state}) : _state = state;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // leading:
      //     CircleAvatar(
      //       backgroundImage: _state.member == null ?
      //         AssetImage('assets/unknown_member.png') 
      //         : NetworkImage('${_state.member.photoUrl}')
      //     ),
      centerTitle: _state.member == null ? true : false,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('PPI-UTM connect'),
          Text(
            memberRole(), 
            style: TextStyle(fontSize: 12.0)
          ),
        ],
      ),
      actions: [IconButton(icon: Icon(Icons.login), 
        onPressed: () {
          if(_state.member == null){
            onLogin(context);
          }else{
            onLogout(context);
          }
        })],
    );
  }

  String memberRole(){
    if(_state.member != null){
      if(_state.member.access_grant == 1){ return 'Member'; }
      else if(_state.member.access_grant == 2){ return 'Management'; }
    }
    return 'Welcome to PPI-UTM Apps';
  }

  void onLogin(BuildContext context) async {
    final _member = await  Navigator.pushNamed(context, '/login');
    if(_member != null){
      _state.member = _member;
    }
  }
  void onLogout(BuildContext context) async {
    _state.member = null;
    await Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }
}
