import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_reminder/widgets/circle_painter.dart';
import 'package:todo_reminder/widgets/color_picker.dart';
import 'package:todo_reminder/widgets/ensure_visible_node.dart';

class TagCategory extends StatefulWidget {
  @override
  _TagCategoryState createState() => _TagCategoryState();
}

class _TagCategoryState extends State<TagCategory> {
  Color _color = Colors.lightBlue;
  FocusNode _focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightBlue[50],
        body: SafeArea(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.only(bottomLeft: Radius.circular(108.0)),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 8.0),
                      InkWell(
                        child: Icon(Icons.arrow_back),
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      SizedBox(height: 8.0),
                      Container(
                        child: Text(
                          'Tags',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                              color: Colors.blueGrey),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Text('Add Tag Name'),
                      ),
                      EnsureVisibleWhenFocused(
                        focusNode: _focusNode,
                        child: CupertinoTextField(
                          padding: EdgeInsets.all(15),
                          cursorColor: Colors.white,
                          onSubmitted: (String categoryName) {},
                          style: TextStyle(color: Colors.white),
                          clearButtonMode: OverlayVisibilityMode.always,
                          decoration: BoxDecoration(
                            color: Colors.blueGrey,
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                          ),
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          CupertinoButton(
                            child: Text('Select Color'),
                            onPressed: dialog,
                          ),
                          CustomPaint(
                            painter: CirclePainter(
                                color: _color, style: PaintingStyle.fill),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                            ),
                          )
                        ],
                      ),
                      Center(
                        child: CupertinoButton(
                          color: Colors.teal,
                          child: const Text('Save'),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }

  Future<void> dialog() async {
    await showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(6))),
            title: const Text('Select assignment'),
            children: <Widget>[
              ColorPicker(
                currentColor: _color,
                onSelected: (color) {
                  setState(() {
                    _color = color;
                  });
                  Navigator.of(context).pop('discard');
                },
              )
            ],
          );
        });
  }
}
