import 'package:flutter/material.dart';
import './screens/noGoalHomePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Widget> screens = [
    NoGoalHomePage(),
  ];
  int currentScreen = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var violet = HexColor('7966FE');
    return MaterialApp(
      theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: violet,
          accentColor: violet,
          fontFamily: 'Avenir Next',
          textTheme: TextTheme(
            title: TextStyle(
                fontFamily: 'Avenir Next',
                fontSize: 28.0,
                fontWeight: FontWeight.w600,
                color: HexColor('404040')),
            headline: TextStyle(
                fontFamily: 'Avenir Next',
                fontSize: 22.0,
                fontWeight: FontWeight.w500,
                color: HexColor('404040')),
          )),
      home: Splash(),
    );
  }
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
