import 'package:flutter/material.dart';

import 'edit_screen.dart';

class Bar extends StatelessWidget implements PreferredSizeWidget {
  const Bar({state}) : _state = state;

  final EditScreenState _state;
  @override
  Size get preferredSize => Size.fromHeight(50.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title(),
      leading: Container(),
      centerTitle: true,
    );
  }

  Text title(){
    if(_state.isEditing == true){
      if(_state.user.role == 1) return Text(_state.data.title);
      return Text('Edit a Todo');
    }
    return Text('Add a Todo');
  }
}
