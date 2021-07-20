import 'package:flutter/material.dart';
import 'package:ppi_connect/services/event_service.dart';
import 'package:provider/provider.dart';
import 'models/event.dart';
import 'notifiers/member_notifier.dart';
import 'router.dart';
import 'notifiers/events_notifier.dart';
import 'dependencies.dart' as di;

void main() {
  di.init();
  runApp(
    MultiProvider(
      providers: [
        // FutureProvider<List<Event>>(create: (_)=> EventService.getAllEvent()),
        ChangeNotifierProvider<MemberNotifier>(create: (_) => MemberNotifier()),
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
