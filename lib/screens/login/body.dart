import 'package:flutter/material.dart';

import '../../services/member_service.dart';
import '../../models/member.dart';
import 'login_screen.dart';

class Body extends StatelessWidget {
  const Body({state}) : _state = state;

  final LoginScreenState _state;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/ppi.png',
          height: 250,
          width: 250,
        ),
        _buildTextField(
            hint: 'Username',
            icon: Icons.people,
            onChanged: (value) {
              _state.email = value;
            }),
        _buildTextField(
            hint: 'Password',
            isObsecure: !_state.showPassword,
            icon: Icons.lock,
            button: IconButton(icon: Icon(Icons.visibility), onPressed: () {
              _state.showPassword = !_state.showPassword;
            }),
            onChanged: (value) {
              _state.password = value;
            }),
        Visibility(
          visible: _state.showErrorMsg,
          child: Text(
            'Invalid membername or password!',
            style: TextStyle(color: Colors.red, fontSize: 20.0),
          ),
        ),
        SizedBox(height: 10.0),
        _buildButtons(context)
      ],
    );
  }

  TextField _buildTextField(
      {hint, icon, isObsecure = false, button, onChanged}) {
    return TextField(
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: icon != null ? Icon(icon) : null,
        suffixIcon: button,
      ),
      obscureText: isObsecure,
      onChanged: onChanged,
    );
  }

  Row _buildButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () => onLoginPressed(context),
          child: Text('Log in'),
        ),
        SizedBox(width: 10.0),
        ElevatedButton(
          onPressed: () => onCancelPressed(context),
          child: Text('Cancel'),
        ),
      ],
    );
  }

  void onLoginPressed(BuildContext context) async {
    final member = await MemberService.getMemberByLoginAndPassword(
      email: _state.email,
      password: _state.password,
    );

    if(member == null){
      _state.showErrorMsg = true;
    }else{
      _state.showErrorMsg = false;
      Navigator.pop(context, member);
    }
  }
  void onCancelPressed(BuildContext context){
    Navigator.pop(context, null);
  }
}
