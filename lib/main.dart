import 'package:flutter/material.dart';
import 'package:ppi_connect/services/event_service.dart';
import 'package:provider/provider.dart';
import 'models/event.dart';
import 'router.dart';
import './providers/events_provider.dart';
import 'dependencies.dart' as di;

void main() {
  di.init();
  runApp(
    MultiProvider(
      providers: [
        // FutureProvider<List<Event>>(create: (_)=> EventService.getAllEvent()),
        ChangeNotifierProvider<EventNotifier>(
          create: (_) => EventNotifier(),
        )
      ],
      child: MaterialApp(
        title: 'PPI UTM Connect',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.red),
        initialRoute: '/',
        onGenerateRoute: createRoute,
      ),
    ),
  );
}
