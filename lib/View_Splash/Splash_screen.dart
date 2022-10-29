import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/View_Splash/view_world_state.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({Key? key}) : super(key: key);

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> with SingleTickerProviderStateMixin {

  late AnimationController animationController;

  @override
  void dispose() {
    // TODO: implement dispose
    animationController.dispose();
  }

  @override
  void initState(){
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
      )..repeat();

      Timer(const Duration(seconds: 5),
       () => Navigator.push(context, MaterialPageRoute(builder: ((context) => world_State()))));
  }
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        body: SafeArea(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
                AnimatedBuilder(animation: animationController,
                child: Container(
                  height: 200,
                  width: 200,
                  child: Image(image: AssetImage('images/virus.png')),
                ),
                 builder: (BuildContext context, Widget? child){
                  return Transform.rotate(
                    angle: animationController.value * 2.0 * math.pi,
                    child:child ,);
                 }),
                 SizedBox(height: MediaQuery.of(context).size.height * .08,),
                 Align(
                  alignment: Alignment.center,
                  child: Text("Covid 19\nTracker App",textAlign: TextAlign.center,style: TextStyle(fontSize: 25),))
          ],)),
      );
  }
}