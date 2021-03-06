import 'package:flutter/material.dart';

import 'body.dart';

class LoginScreen extends StatefulWidget {
  static Route route() =>
      MaterialPageRoute(builder: (context) => LoginScreen());

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  String _email = '';
  String _password = '';
  bool _showPassword = false;
  bool _showErrorMsg = false;

  String get email => _email;
  set email(value) => setState(() => _email = value);

  String get password => _password;
  set password(value) => setState(() => _password = value);
  
  bool get showPassword => _showPassword;
  set showPassword(value) => setState(() => _showPassword = value);
  
  bool get showErrorMsg => _showErrorMsg;
  set showErrorMsg(value) => setState(() => _showErrorMsg = value);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: SafeArea(
        child: Scaffold(
          body: Body(state: this,),
        ),
      ),
    );
  }
}
