import 'dart:ui';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:rubber/rubber.dart';
import 'package:todo_reminder/widgets/fab_bottom_bar.dart';
import 'package:todo_reminder/widgets/frosted_glass.dart';
import 'package:todo_reminder/widgets/header_background.dart';
import 'package:todo_reminder/widgets/header_text.dart';
import 'package:todo_reminder/widgets/rectangle_card.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  bool isBottomNavigationVisible = true;
  double heightFactor = 0.35;
  RubberAnimationController _rubberAnimationController;
  AnimationController _cardEntranceAnimationController;
  AnimationController _floatingController;
  List<Animation> todoListAnimations;
  Animation fabAnimation;
  List<String> task = ['sathis', 'kumar', 'dinesh', 'ritesh', 'sadsd'];
  //String _lastSelected = 'TAB: 0';

  void _selectedTab(int index) {
    setState(() {
      //_lastSelected = 'TAB: $index';
    });
  }

  @override
  void initState() {
    super.initState();
    _rubberAnimationController = RubberAnimationController(
      dismissable: false,
      lowerBoundValue: AnimationControllerValue(percentage: 0),
      upperBoundValue: AnimationControllerValue(percentage: 0.8),
      duration: Duration(milliseconds: 200),
      vsync: this,
    );
    _rubberAnimationController.collapse();
    _cardEntranceAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1100),
    );
    _rubberAnimationController.height = 0;
    todoListAnimations = task.map((stop) {
      int index = task.indexOf(stop);
      double start = index * 0.1;
      double duration = 0.6;
      double end = duration + start;
      return Tween<double>(begin: 800.0, end: 0.0).animate(CurvedAnimation(
          parent: _cardEntranceAnimationController,
          curve: Interval(start, end, curve: Curves.decelerate)));
    }).toList();
    _cardEntranceAnimationController.forward();
    _floatingController = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  void dispose() {
    _cardEntranceAnimationController.dispose();
    _floatingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: OrientationBuilder(builder: (context, orientation) {
        heightFactor = orientation == Orientation.portrait ? 0.3 : 0.55;
        return Scaffold(
          bottomNavigationBar: !isBottomNavigationVisible
              ? SizedBox()
              : FABBottomAppBar(
                  centerItemText: '',
                  color: Colors.grey,
                  selectedColor: Theme.of(context).primaryColor,
                  onTabSelected: _selectedTab,
                  notchedShape: CircularNotchedRectangle(),
                  items: [
                    FABBottomAppBarItem(iconData: Icons.menu, text: 'Home'),
                    FABBottomAppBarItem(
                        iconData: Icons.track_changes, text: 'TasK'),
                  ],
                ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              if (_floatingController.isDismissed) {
                _rubberAnimationController.launchTo(AnimationState.expanded);
                setState(() {
                  isBottomNavigationVisible = false;
                });
                _floatingController.forward();
              } else {
                _rubberAnimationController.launchTo(AnimationState.collapsed);
                setState(() {
                  isBottomNavigationVisible = true;
                });
                _floatingController.reverse();
              }
            },
            backgroundColor: Colors.pinkAccent,
            tooltip: 'Add Task',
            child: AnimatedBuilder(
              animation: _floatingController,
              builder: (BuildContext context, Widget child) {
                return Transform(
                  transform: Matrix4.rotationZ(
                      _floatingController.value * 0.5 * math.pi),
                  alignment: FractionalOffset.center,
                  child: Icon(_floatingController.isDismissed
                      ? Icons.add
                      : Icons.close),
                );
              },
            ),
            elevation: 3.0,
          ),
          body: RubberBottomSheet(
            animationController: _rubberAnimationController,
            lowerLayer: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                FractionallySizedBox(
                    heightFactor: heightFactor,
                    alignment: Alignment.topCenter,
                    child: CustomPaint(
                      painter: HeaderBackground(),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            HeaderText(),
                            FrostedGlass(),
                          ],
                        ),
                      ),
                    )),
                FractionallySizedBox(
                  heightFactor: 1 - heightFactor,
                  alignment: Alignment.bottomCenter,
                  child: SingleChildScrollView(
                    child: Column(
                      children: _buildTask().toList(),
                    ),
                  ),
                ),
              ],
            ),
            upperLayer: _showBottomSheet(context),
          ),
        );
      }),
    );
  }

  Iterable<Widget> _buildTask() {
    return task.map((stop) {
      int index = task.indexOf(stop);
      return AnimatedBuilder(
        animation: _cardEntranceAnimationController,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 7.0, horizontal: 8),
          child: RectangleCard(
            text: task[index],
            isDone: false,
          ),
        ),
        builder: (context, child) => Transform.translate(
              offset: Offset(0.0, todoListAnimations[index].value),
              child: child,
            ),
      );
    });
  }

  Widget _showBottomSheet(context) {
    return GestureDetector(
      onVerticalDragDown: (details) {},
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [BoxShadow(color: Colors.white, blurRadius: 5)],
            borderRadius: BorderRadius.only(
                topLeft: Radius.elliptical(100, 50),
                topRight: Radius.elliptical(100, 50))),
        padding: EdgeInsets.all(30),
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Expanded(child: Center(child: Text('Add a new task'))),
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Task *',
                    ),
                    onSaved: (String value) {},
                    validator: (String value) {
                      return value.contains('@')
                          ? 'Do not use the @ char.'
                          : null;
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ArcPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
        size.width / 2, size.height - 100, size.width, size.height);
    path.lineTo(size.width, 0);
    final Paint ovalPaint = Paint();
    ovalPaint.color = Colors.lightBlue[700];
    canvas.drawPath(path, ovalPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
