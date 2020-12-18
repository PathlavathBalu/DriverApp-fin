import 'package:driverapp/ui/loginscreen/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget{

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {

  Animation<double> opacity;
AnimationController controller;
  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: Duration(seconds: 4), vsync: this);
    opacity = Tween<double>(begin: 1.0, end: 0.0).animate(controller)
      ..addListener(() {
        setState(() {});
      });
    controller.forward().then((_) {
      navigationPage();
    });
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  void navigationPage() {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (_) => LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 812.0,
        width: 375.0,
        decoration: BoxDecoration(color: Colors.blue),
        child: Scaffold(
body: Column(
  children: [
Expanded(child: Opacity(opacity: opacity.value,
  child: Image.asset('images/logo.png',),),),Padding(padding: const EdgeInsets.all(8.0),
    ),
  ],
),
  ),
      ),
    );
  }

}