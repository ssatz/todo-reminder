import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_reminder/model/choice.dart';
import 'package:todo_reminder/pages/tag/tag_category.dart';

class HeaderText extends StatefulWidget {
  @override
  _HeaderTextState createState() => _HeaderTextState();
}

class _HeaderTextState extends State<HeaderText> {
  List<Choice> choices = <Choice>[
    Choice(title: 'Add Tag', icon: Icons.tag_faces, widget: TagCategory()),
  ];

  void _select(Choice choice) {
    Navigator.of(context, rootNavigator: true).push(
      CupertinoPageRoute<bool>(
        fullscreenDialog: true,
        builder: (BuildContext context) => choice.widget,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: ListTile(
              title: Text(
                'Hello Damn',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
              subtitle: Text(
                'You have 9 task today',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          PopupMenuButton<Choice>(
            icon: Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
            onSelected: _select,
            itemBuilder: (BuildContext context) {
              return choices.map((Choice choice) {
                return PopupMenuItem<Choice>(
                  value: choice,
                  child: Text(choice.title),
                );
              }).toList();
            },
          ),
        ],
      ),
    );
  }
}
