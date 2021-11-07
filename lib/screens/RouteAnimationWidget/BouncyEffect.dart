import 'package:flutter/material.dart';

class BouncinessEffect extends StatefulWidget {
  final VoidCallback? onTap;
  final Widget? child;
  final bool isDownBounciness;

  const BouncinessEffect({
    Key? key,
    this.onTap,
    required this.child,
    this.isDownBounciness = false,
  }) : super(key: key);

  @override
  State<BouncinessEffect> createState() => _BouncinessEffectState();
}

class _BouncinessEffectState extends State<BouncinessEffect>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late double _scale;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 400,
      ),
      reverseDuration: Duration(
        milliseconds: 300,
      ),
      lowerBound: 0.0,
      upperBound: widget.isDownBounciness ? 0.1 : 0.02,
      animationBehavior: AnimationBehavior.preserve,
    )..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - _controller.value;
    return GestureDetector(
      onTap: widget.onTap,
      onTapDown: (details) {
        setState(() {
          widget.isDownBounciness ? _controller.forward() : _controller.reverse();
        });
        
      },
      onTapUp: (detail) {
       setState(() {
          widget.isDownBounciness ? _controller.reverse() : _controller.forward();
       });
      },
      child: Transform.scale(
        scale: _scale,
        child: widget.child,
      ),
    );
  }
}
