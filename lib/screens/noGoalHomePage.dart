import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:moneysaver/widgets/curvePainter.dart';
import '../CustomDrawer.dart';
import '../models/user.dart';
import '../widgets/customScaffold.dart';
import 'package:flare_splash_screen/flare_splash_screen.dart';

class NoGoalHomePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyCustomAppBar(
          height: 100,
        ),
        drawer: CustomDrawer(),
        body: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                CustomPaint(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 36.0),
                        child: Row(
                          children: <Widget>[
                            CircleAvatar(
                                radius: 35.0,
                                backgroundImage: user.hasAvatar
                                    ? AssetImage(
                                        "assets/user/" + user.avatarUrl)
                                    : AssetImage('assets/user/default.png')),
                            SizedBox(width: 10.0),
                            Text(
                              user.name,
                              style: TextStyle(
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      Container(
                          height: 500.0,
                          width: double.infinity,
                          child: Padding(
                            padding: EdgeInsets.all(36.0),
                            child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.0)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color.fromARGB(9, 161, 161, 161),
                                      blurRadius: 18,
                                      offset: Offset(
                                        0.0,
                                        3.0,
                                      ),
                                    )
                                  ],
                                ),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                        width: double.infinity,
                                        height: 300.0,
                                        child: FlareActor(
                                          'assets/flare/noGoalHomePage.flr',
                                          alignment: Alignment.center,
                                          fit: BoxFit.contain,
                                          animation: 'Untitled',
                                        )),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Container(
                                        child: Text(
                                          "Start save \n your money now!",
                                          style:
                                              Theme.of(context).textTheme.title,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                    FractionalTranslation(
                                      translation: Offset(0, .5),
                                      child: RaisedButton(
                                        color: Theme.of(context).primaryColor,
                                        padding: EdgeInsets.symmetric(
                                            vertical: 13, horizontal: 92),
                                        child: Text('Add goal',
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white)),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18.0),
                                        ),
                                        onPressed: () => print('lol'),
                                      ),
                                    )
                                  ],
                                )),
                          )),
                    ],
                  ),
                  painter: CurvePainter(),
                ),
              ],
            ),
          ],
        ));
  }
}

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashScreen.navigate(
        name: 'assets/flare/MoneySaverLogoAnimation.flr',
        next: NoGoalHomePage(),
        until: () => Future.delayed(Duration(seconds: 5)),
        startAnimation: 'start',
      ),
    );
  }
}
