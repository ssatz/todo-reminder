import 'package:flutter/material.dart';
import 'package:todo_reminder/pages/intro/intro_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo Reminder',
      theme: ThemeData(
        //canvasColor: Colors.transparent,
        scaffoldBackgroundColor: Colors.lightBlue[50],
        primarySwatch: Colors.blueGrey,
      ),
      home: IntroPage(),
    );
  }
}
