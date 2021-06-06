import 'package:flutter/material.dart';

import 'router.dart';

void main() => runApp(
      MaterialApp(
        title: 'MAP Exercise 3',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.green),
        initialRoute: '/',
        onGenerateRoute: createRoute,
      ),
    );
