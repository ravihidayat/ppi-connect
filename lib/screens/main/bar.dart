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
      leading:
          CircleAvatar(
            backgroundImage: _state.user == null ?
              AssetImage('assets/unknown_user.png') 
              : NetworkImage('${_state.user.photoUrl}')
          ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('PPI-UTM connect'),
          Text(
            _state.user == null ? 'something' : _state.user.name, 
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
  void onLogin(BuildContext context) async {
    final _user = await  Navigator.pushNamed(context, '/login');
    if(_user != null){
      _state.user = _user;
    }
  }
  void onLogout(BuildContext context) async {
    _state.user = null;
    await Navigator.pushNamed(context, '/');
  }
}