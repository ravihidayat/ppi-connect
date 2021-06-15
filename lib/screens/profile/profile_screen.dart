import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ppi_connect/arguments/argument.dart';
import 'package:ppi_connect/models/user.dart';
import 'bar.dart';
import 'body.dart';

class ProfileScreen extends StatefulWidget {
  static Route route({userData}) => MaterialPageRoute(
      builder: (context) => ProfileScreen(userData: userData));

  final User _userData;
  User get userData => _userData;

  ProfileScreen({userData}) : _userData = userData;
  @override
  ProfileScreenState createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  // int _id;
  // String _name;
  // String _photoUrl;
  // String _login;
  // String _password;
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   _id=widget._userData.id;
  //   _name=widget._userData.name;
  //   _photoUrl=widget._userData.photoUrl;
  //   _login=widget._userData.login;
  //   _password=widget._userData.password;
  // }

  User get userData => widget._userData;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: SafeArea(
        child: Scaffold(
          appBar: Bar(),
          body: Body(state: this),
        ),
      ),
    );
  }
}
