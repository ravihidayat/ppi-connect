import 'package:ppi_connect/models/user.dart';
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
      //       backgroundImage: _state.user == null ?
      //         AssetImage('assets/unknown_user.png') 
      //         : NetworkImage('${_state.user.photoUrl}')
      //     ),
      centerTitle: _state.user == null ? true : false,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('PPI-UTM connect'),
          Text(
            userRole(), 
            style: TextStyle(fontSize: 12.0)
          ),
        ],
      ),
      actions: [IconButton(icon: Icon(Icons.login), 
        onPressed: () {
          if(_state.user == null){
            onLogin(context);
          }else{
            onLogout(context);
          }
        })],
    );
  }

  String userRole(){
    if(_state.user != null){
      if(_state.user.role == 1){ return 'Member'; }
      else if(_state.user.role == 2){ return 'Management'; }
    }
    return 'Welcome to PPI-UTM Apps';
  }

  void onLogin(BuildContext context) async {
    final _user = await  Navigator.pushNamed(context, '/login');
    if(_user != null){
      _state.user = _user;
    }
  }
  void onLogout(BuildContext context) async {
    _state.user = null;
    await Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }
}
