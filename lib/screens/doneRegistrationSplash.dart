import 'package:flutter/material.dart';
import 'package:flare_splash_screen/flare_splash_screen.dart';
import '../screens/noGoalHomePage.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            width: double.infinity,
            height: 500,
            child: SplashScreen.navigate(
              name: 'assets/flare/prizeAnim.flr',
              next: NoGoalHomePage(),
              until: () => Future.delayed(Duration(seconds: 5)),
              startAnimation: 'Untitled',
            )),
      ),
    );
  }
}
