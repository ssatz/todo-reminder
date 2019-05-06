import 'package:flutter/material.dart';

class RaisedGradientButton extends StatelessWidget {
  final Widget child;
  final Gradient gradient;
  final double width;
  final double height;
  final Function onPressed;
  const RaisedGradientButton({
    Key key,
    @required this.child,
    this.gradient,
    this.width,
    this.height = 50.0,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width == null ? MediaQuery.of(context).size.width / 2 + 15 : width,
      height: 50.0,
      decoration: BoxDecoration(
          backgroundBlendMode: BlendMode.colorBurn,
          borderRadius: BorderRadius.circular(8.0),
          gradient: gradient,
          boxShadow: [
            BoxShadow(
              color: gradient.colors[0],
              blurRadius: 10,
              spreadRadius: 2.0,
            ),
          ]),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
            onTap: onPressed,
            child: Center(
              child: child,
            )),
      ),
    );
  }
}
