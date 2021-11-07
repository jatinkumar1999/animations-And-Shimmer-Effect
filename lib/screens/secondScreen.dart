import 'package:animation_dummy_projects/screens/RouteAnimationWidget/BouncyEffect.dart';
import 'package:animation_dummy_projects/screens/shimmerEffetcImage/shimmerEffectImage.dart';

import 'package:flutter/material.dart';


class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;
  late Animation<double> _fadeAnimation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _animation = Tween<Offset>(begin: Offset(-1.0, 0.0), end: Offset.zero)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));
    // _fadeAnimation = Tween(begin: 0.0, end: 1.0).animate(_controller);
    _fadeAnimation = CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.2, 1, curve: Curves.elasticInOut));

    _controller.addListener(() {
      setState(() {
        print("Dfdf==>${_animation.value}");
      });
    });

    _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: BouncinessEffect(
            isDownBounciness: false,
            onTap: () {},
            child:CustomImage(
              imagePath: 'https://thumbs.dreamstime.com/z/sunset-heart-hands-sea-33939547.jpg',
            ),
        
          ),
        ),
      ),
    );
  }
}
