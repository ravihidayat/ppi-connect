import 'package:flutter/material.dart';
import 'package:ppi_connect/screens/login/login_screen.dart';
import 'package:ppi_connect/screens/profile/profile_screen.dart';

class Body extends StatefulWidget {
  const Body({state}) : _state = state;

  final ProfileScreenState _state;

  @override
  State<StatefulWidget> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int _id;
  String _name;
  String _photoUrl;
  String _login;
  String _password;
  String _role;
  
  @override
  void initState() {
    // ignore: event
    // TODO: implement initState
    _id = widget._state.userData.id;
    _name = widget._state.userData.name;
    _photoUrl = widget._state.userData.photoUrl;
    _login = widget._state.userData.login;
    _password = widget._state.userData.password;
    if(widget._state.userData.role == 1) { _role = 'Member'; }
    else if(widget._state.userData.role == 2) { _role = 'Management'; }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
            width: 150.0,
            height: 150.0,
            decoration: BoxDecoration(
                color: Colors.red,
                image: DecorationImage(
                    image: NetworkImage('$_photoUrl'), fit: BoxFit.cover),
                borderRadius: BorderRadius.all(Radius.circular(75.0)),
                boxShadow: [BoxShadow(blurRadius: 7.0, color: Colors.black)])),
        paddedTextField(label: 'ID', value: _id.toString()),
        paddedTextField(label: 'Username', value: _login),
        paddedTextField(label: 'Name', value: _name),
        paddedTextField(label: 'Role', value: _role)
      ],
    );
  }

  Padding paddedTextField({label, value}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(50, 2, 50, 2),
      child: TextFormField(
        initialValue: value,
        decoration: InputDecoration(labelText: label),
      ),
    );
  }
}
