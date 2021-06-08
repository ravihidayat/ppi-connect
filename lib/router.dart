import 'package:flutter/material.dart';
import 'package:ppi_connect/arguments/argument.dart';

import 'models/todo.dart';
import 'screens/edit/edit_screen.dart';
import 'screens/login/login_screen.dart';
import 'screens/main/main_screen.dart';

Route<dynamic> createRoute(settings) {
  switch (settings.name) {
    case '/':
    case '/main':
      return MainScreen.route();

    case '/login':
      return LoginScreen.route();

    case '/new':
      return EditScreen.route(
        isEditing: false, data: settings.arguments);

    case '/edit':
      return EditScreen.route(
        isEditing: true, data: settings.arguments);
  }
  return null;
}
