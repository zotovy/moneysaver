import 'dart:async';

import 'package:flutter/material.dart';

import 'package:moneysaver/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './screens/noGoalHomePage.dart';
import './screens/registration.dart';

void main() async {
  loadUser();
  Timer(Duration(seconds: 1), () {
    user.name == '' ? isUserRegister = false : isUserRegister = true;
    runApp(MyApp());
  });
}

bool isUserRegister = true;

Future initUser(Map<String, dynamic> content) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  prefs.setString('name', content['name']);
  prefs.setDouble('salary', content['salary']);
  prefs.setInt('salaryDate', content['salaryDate']);
  prefs.setString('gender', content['gender']);
  prefs.setString('location', content['location']);
  prefs.setString('email', content['email']);
  prefs.setString('phone', content['phone']);
  prefs.setString('profession', content['profession']);
  prefs.setBool('hasAvatar', content['hasAvatar']);
  prefs.setString('avatarUrl', content['avatarUrl']);
  prefs.setBool('isRemind', content['isRemind']);
  prefs.setString('remindTime', content['remindTime']);
  prefs.setString('remindType', content['remindType']);
  prefs.setString('remindSound', content['remidSound']);
  prefs.setString('language', content['language']);

  user = User(
    name: content['name'],
    salary: content['salary'],
    salaryDate: content['salaryDate'],
    gender: content['gender'],
    location: content['location'],
    email: content['email'],
    phone: content['phone'],
    profession: content['profession'],
    hasAvatar: content['hasAvatar'],
    avatarUrl: content['avatarUrl'],
    isRemind: content['isRemind'],
    remindTime: content['remindTime'],
    remindType: content['remindType'],
    remindSound: content['remindSound'],
    language: content['language'],
  );

  return null;
}

Future loadUser() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  prefs.setString('name', 'panda');

  String name = prefs.getString('name');
  user.name = name;
  user.salary = prefs.getDouble('salary');
  user.salaryDate = prefs.getInt('salaryDate');
  user.gender = prefs.getString('gender');
  user.location = prefs.getString('location');
  user.email = prefs.getString('email');
  user.phone = prefs.getString('phone');
  user.profession = prefs.getString('profession');
  user.hasAvatar = prefs.getBool('hasAvatar');
  user.avatarUrl = prefs.getString('avatarUrl');
  user.isRemind = prefs.getBool('isRemind');
  user.remindTime = prefs.getString('remindTime');
  user.remindType = prefs.getString('remindType');
  user.remindSound = prefs.getString('remindSound');
  user.language = prefs.getString('language');

  if (name == 'panda') {
    user.hasAvatar = true;
    user.avatarUrl = 'panda.jpg';
    isUserRegister = false;
  }
}

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
        home: isUserRegister ? NoGoalHomePage() : Registration(currentPage: 1));
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
