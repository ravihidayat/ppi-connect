import 'package:flutter/material.dart';

import 'body.dart';

class LoginScreen extends StatefulWidget {
  static Route route() =>
      MaterialPageRoute(builder: (context) => LoginScreen());

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  String _login = '';
  String _password = '';
  bool _showPassword = false;
  bool _showErrorMsg = false;

  get login => _login;
  set login(value) => setState(() => _login = value);

  get password => _password;
  set password(value) => setState(() => _password = value);
  
  get showPassword => _showPassword;
  set showPassword(value) => setState(() => _showPassword = value);
  
  get showErrorMsg => _showErrorMsg;
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
