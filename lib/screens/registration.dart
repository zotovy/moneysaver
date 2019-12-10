import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:moneysaver/screens/registration/name.dart';
import '../main.dart';
import './doneRegistrationSplash.dart';

class Registration extends StatefulWidget {
  final int currentPage;
  const Registration({Key key, this.currentPage}) : super(key: key);

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  int currentPage;
  List<String> firstTexts = [
    'MoneySaver help you\nsave your money.',
    'Set goals and achieve',
    'Make your dream\ncome true!'
  ];
  List firstIcons = [
    Icon(Icons.arrow_forward),
    Icon(Icons.arrow_forward),
    Text(
      'Start',
      style: TextStyle(
        color: HexColor('7966FE'),
        fontSize: 18,
      ),
      textAlign: TextAlign.center,
    )
  ];

  final _formKey = GlobalKey<FormState>();
  String name;
  int salary;
  DateTime date;
  List data = [];

  @override
  void initState() {
    super.initState();
    currentPage = widget.currentPage;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    var appbar;
    if (1 <= currentPage && 3 >= currentPage) {
      List<Color> buttonsColor = [
        Colors.grey,
        Colors.grey,
        Colors.grey,
      ];
      buttonsColor[currentPage - 1] = HexColor('7966FE');
      children = [
        Container(
            height: 618.0,
            child: Column(
              children: <Widget>[
                Container(
                  height: 500.0,
                  width: double.infinity,
                  child: FlareActor(
                    'assets/flare/Money${currentPage}.flr',
                    alignment: Alignment.center,
                    fit: BoxFit.contain,
                    animation: 'play',
                  ),
                ),
                Text(
                  firstTexts[currentPage - 1],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.w600,
                    color: HexColor('404040'),
                  ),
                ),
                SizedBox(height: 50),
              ],
            )),
        Container(
            child: Padding(
                padding: EdgeInsets.only(bottom: 56.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 25,
                      child: GestureDetector(
                        onTap: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => currentPage == 3
                                  ? NameRegistrationScreen()
                                  : Registration(
                                      currentPage: currentPage += 1,
                                    ),
                            ),
                          )
                        },
                        child: firstIcons[currentPage - 1],
                      ),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Registration(
                                  currentPage: 1,
                                ),
                              ),
                            )
                          },
                          child: ClipOval(
                            child: Container(
                              color: buttonsColor[0],
                              height: 25.0,
                              width: 25.0,
                            ),
                          ),
                        ),
                        SizedBox(width: 16),
                        GestureDetector(
                          onTap: () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Registration(
                                  currentPage: 2,
                                ),
                              ),
                            )
                          },
                          child: ClipOval(
                            child: Container(
                              color: buttonsColor[1],
                              height: 25.0,
                              width: 25.0,
                            ),
                          ),
                        ),
                        SizedBox(width: 16),
                        GestureDetector(
                          onTap: () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Registration(
                                  currentPage: 3,
                                ),
                              ),
                            )
                          },
                          child: ClipOval(
                            child: Container(
                              color: buttonsColor[2],
                              height: 25.0,
                              width: 25.0,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                )))
      ];
      appbar = null;
    }
    return Scaffold(
      backgroundColor: HexColor('FCFCFE'),
      appBar: appbar,
      body: ListView(
        children: children,
      ),
    );
  }
}
