import 'dart:async';

import 'package:flutter/material.dart';
import 'package:notifications/notifications.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Notifications _notifications;
  StreamSubscription<NotificationEvent> _subscription;

  Future<void> initPlatformState() async {
    startListening();
  }

  void onData(NotificationEvent event) {
    print(event);
    print('converting package extra to json');
    //var jsonDatax = json.decode(event.packageExtra);
    //print(jsonDatax);
  }

  void startListening() {
    _notifications = new Notifications();
    try {
      _subscription = _notifications.notificationStream.listen(onData);
    } on NotificationException catch (exception) {
      print(exception);
    }
  }

  void stopListening() {
    _subscription.cancel();
  }

  void initState() {
    super.initState();
    initPlatformState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
