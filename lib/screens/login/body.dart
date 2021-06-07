import 'package:flutter/material.dart';

import '../../services/user_service.dart';
import '../../models/user.dart';
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
        _buildTextField(
            hint: 'Username',
            icon: Icons.people,
            onChanged: (value) {
              _state.login = value;
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
          child: Text(
            'Invalid username or password!',
            style: TextStyle(color: Colors.red, fontSize: 20.0),
          ),
          visible: _state.showErrorMsg,
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
          child: Text('Log in'),
          onPressed: () => onLoginPressed(context),
        ),
        SizedBox(width: 10.0),
        ElevatedButton(
          child: Text('Cancel'),
          onPressed: () => onCancelPressed(context),
        ),
      ],
    );
  }

  void onLoginPressed(BuildContext context) async {
    final User user = await UserService.getUserByLoginAndPassword(
      login: _state.login,
      password: _state.password,
    );

    if(user == null){
      _state.showErrorMsg = true;
    }else{
      _state.showErrorMsg = false;
      Navigator.pop(context, user);
    }
  }
  void onCancelPressed(BuildContext context){
    Navigator.pop(context, null);
  }
}