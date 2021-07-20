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
  String _email;
  String _access_grant;

  @override
  void initState() {
    _matrix_card = widget._state.memberData.matrix_card;
    _name = widget._state.memberData.name;
    _email = widget._state.memberData.email;
    if (widget._state.memberData.access_grant == 1) {
      _access_grant = 'Member';
    } else if (widget._state.memberData.access_grant == 2) {
      _access_grant = 'Management';
    } else if (widget._state.memberData.access_grant == 3) {
      _access_grant = 'Admin';
    }
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
                    image: NetworkImage(
                        'https://source.unsplash.com/random/200x200'),
                    fit: BoxFit.cover),
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
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: TextFormField(
        initialValue: value,
        decoration: InputDecoration(labelText: label),
      ),
    );
  }
}
