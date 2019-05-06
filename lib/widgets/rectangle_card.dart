import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_reminder/widgets/circle_painter.dart';

class RectangleCard extends StatelessWidget {
  final String text;
  final bool isDone;
  RectangleCard({@required this.text, @required this.isDone});

  @override
  Widget build(BuildContext context) {
    return Slidable(
        child: Container(
            height: 50,
            width: MediaQuery.of(context).size.width - 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(const Radius.circular(6.0)),
              gradient: LinearGradient(
                stops: [0.02, 0.01],
                colors: [Colors.red, Colors.white],
              ),
            ),
            child: ListTile(
              leading: isDone
                      ? Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.greenAccent),
                          child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Icon(
                                Icons.check,
                                size: 20,
                                color: Colors.white,
                              )),
                        )
                      : CustomPaint(
                          painter: CirclePainter(
                              color: Colors.grey, style: PaintingStyle.stroke),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                          ),
                        ) /*Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          shape: BoxShape.circle,
                          color: Colors.white),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                      ),
                    )*/
                  ,
              title: Text(
                text,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: Icon(Icons.notifications),
              ),
            )),
        delegate: SlidableDrawerDelegate(),
        secondaryActions: <Widget>[
          InkWell(
            onTap: () {
              print("tapped");
            },
            child: Container(
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.red[100]),
              child: Icon(
                Icons.delete_outline,
                size: 20,
                color: Colors.red,
              ),
            ),
          )
        ]);
  }
}
