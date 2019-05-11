import 'dart:ui';
import 'package:flutter/material.dart';

class FrostedGlass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.fromLTRB(
          10, mediaQuerySize.height * .01, 10, mediaQuerySize.height * .01),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white70.withOpacity(0.5),
            borderRadius: BorderRadius.circular(3)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text('Today Reminder'),
            Text('Meeting with doctor'),
            Text('Meeting with doctor'),
          ],
        ),
      ),
    );
  }
}
