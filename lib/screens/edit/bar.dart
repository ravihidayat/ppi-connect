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
      title: _state.isEditing == true ? 
        Text('Edit a Todo') : Text('Add a Todo'),
      leading: Container(),
      centerTitle: true,
    );
  }
}
