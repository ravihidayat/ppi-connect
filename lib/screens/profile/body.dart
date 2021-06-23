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
  String _matrix_card;
  String _name;
  String _photoUrl;
  String _email;
  String _password;
  String _access_grant;
  
  @override
  void initState() {
    _matrix_card = widget._state.memberData.matrix_card;
    _name = widget._state.memberData.name;
    // _photoUrl = widget._state.memberData.photoUrl;
    _email = widget._state.memberData.email;
    _password = widget._state.memberData.password;
    if(widget._state.memberData.access_grant == 1) { _access_grant = 'Member'; }
    else if(widget._state.memberData.access_grant == 2) { _access_grant = 'Management'; }
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
                    image: AssetImage('assets/unknown_user.png'), fit: BoxFit.cover),
                borderRadius: BorderRadius.all(Radius.circular(75.0)),
                boxShadow: [BoxShadow(blurRadius: 7.0, color: Colors.black)])),
        paddedTextField(label: 'Matric No', value: _matrix_card),
        paddedTextField(label: 'Username', value: _email),
        paddedTextField(label: 'Name', value: _name),
        paddedTextField(label: 'Role', value: _access_grant)
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
