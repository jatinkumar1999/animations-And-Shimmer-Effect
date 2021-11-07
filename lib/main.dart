import 'package:animation_dummy_projects/screens/RouteAnimationWidget/BouncyEffect.dart';
import 'package:animation_dummy_projects/screens/RouteAnimationWidget/customAnimation.dart';
import 'package:animation_dummy_projects/screens/secondScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    // _animation = Tween(
    //   begin: 0.0,
    //   end: 1.0,
    // ).animate(_controller);
    _animation = CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.2, 1, curve: Curves.elasticInOut));
    _controller.addListener(() {
      setState(() {});
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
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        title: Text("Demo Animation App"),
      ),
      body: Center(
        child: FadeTransition(
          opacity: _animation,
          child: BouncinessEffect(
            onTap: () {
              Navigator.push(
                  context,
                  CustomAnimation(
                    direction: AxisDirection.right,
                    page: SecondScreen(),
                  ));
            },
            child: Container(
              height: 150,
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 20),
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
