import 'package:flutter/material.dart';

class Bar extends StatelessWidget implements PreferredSizeWidget {
  // const Bar({
  //   Key key,
  // }) : super(key: key);
  @override
  Size get preferredSize => Size.fromHeight(50.0);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.arrow_back)),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            'Profile',
          ),
        ],
      ),
    );
  }
}
