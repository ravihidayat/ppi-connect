import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'router.dart';
import './providers/events_provider.dart';

void main() => runApp(
      ChangeNotifierProvider(
        create: (ctx) => Events(),
        child: MaterialApp(
          title: 'PPI UTM Connect',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primarySwatch: Colors.red),
          initialRoute: '/',
          onGenerateRoute: createRoute,
        ),
      ),
    );
 