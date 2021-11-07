import 'package:flutter/material.dart';

class CustomAnimation extends PageRouteBuilder {
  final Widget page;
  final AxisDirection direction;
  CustomAnimation({
    required this.page,
    this.direction = AxisDirection.right,
  }) : super(
          transitionDuration: Duration(milliseconds: 300),
          reverseTransitionDuration: Duration(milliseconds: 300),
          pageBuilder: (context, animation, secondaryAnimation) => page,
        );

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    Offset start = getBeginOffset();
    Offset end = Offset.zero;
    var tween = Tween(begin: start, end: end)
        .chain(CurveTween(curve: Curves.easeInOut));

    return SlideTransition(position: animation.drive(tween), child: child);
  }

  //!For Start
  Offset getBeginOffset() {
    switch (direction) {
      case AxisDirection.right:
        return Offset(-1, 0);

      case AxisDirection.left:
        return Offset(1, 0);
      case AxisDirection.up:
        return Offset(0, 1);
      case AxisDirection.down:
        return Offset(0, -1);

      default:
        return Offset(-1, 0);
    }
  }
}
