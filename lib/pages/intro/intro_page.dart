import 'package:flutter/material.dart';
import 'package:todo_reminder/pages/home/home_page.dart';
import 'package:todo_reminder/widgets/raised_gradient_button.dart';

class IntroPage extends StatefulWidget {
  IntroPage({Key key}) : super(key: key);
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomPadding: true,
          body: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                  padding: EdgeInsets.only(bottom: 20),
                  child: SizedBox(
                      height: 100,
                      width: 100,
                      child: Image.asset('assets/homework.png'))),
              Container(
                  padding: EdgeInsets.only(top: 100),
                  child: Text('Reminder made simple!')),
              Container(
                padding: EdgeInsets.only(top: 5),
                child: RaisedGradientButton(
                    child: Text(
                      'Get Started',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    gradient: LinearGradient(
                      colors: <Color>[
                        Colors.lightGreen[400],
                        Colors.green[800]
                      ],
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    }),
              )
            ],
          ))),
    );
  }
}
