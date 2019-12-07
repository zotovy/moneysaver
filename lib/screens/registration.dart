import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_splash_screen/flare_splash_screen.dart';
import 'package:flutter/material.dart';
import '../main.dart';
import '../screens/noGoalHomePage.dart';

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

  @override
  void initState() {
    super.initState();
    currentPage = widget.currentPage;
  }

  dynamic _validateData(value, step) {
    if (step == 1) {
      if (value.isEmpty) {
        return 'This field is required';
      }
      return null;
    }
    if (step == 2) {
      try {
        var tmp = double.parse(value);
        return null;
      } on FormatException {
        return 'This field contains only numbers';
      }
    }
    if (step == 3) {
      var data;
      try {
        var data = double.parse(value);
        if (0 < data && 32 > data) {
          return null;
        } else {
          return 'Invalid number';
        }
      } on FormatException {
        return 'This field contains only numbers';
      }
    }
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
                              builder: (context) => Registration(
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
    } else if (4 <= currentPage && 6 >= currentPage) {
      int currentStep = currentPage - 3;
      int i = currentStep - 1;
      List<String> texts = [
        'Lets start! Enter your name,\nso will know how to call you :)',
        'Set your salary.',
        'Set your salary date.',
      ];
      List<Widget> icons = [
        Icon(
          Icons.person,
          color: HexColor('404040'),
        ),
        Icon(
          Icons.attach_money,
          color: HexColor('404040'),
        ),
        Icon(
          Icons.calendar_today,
          color: HexColor('404040'),
        )
      ];
      List<String> placeholders = [
        'John Rock',
        '1000',
        '21',
      ];
      List<String> buttonText = [
        'Next',
        'Next',
        'Finish',
      ];
      TextEditingController controller = new TextEditingController();

      appbar = AppBar(
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        centerTitle: true,
        leading: GestureDetector(
            onTap: () {
              setState(() {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Registration(
                      currentPage: currentPage -= 1,
                    ),
                  ),
                );
              });
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.grey,
            )),
        title: Text(
          'Step ${currentStep}/3',
          style: TextStyle(fontSize: 20, color: HexColor('404040')),
        ),
      );
      children = [
        SizedBox(height: 90.0),
        Container(
          height: 150.0,
          child: Image(
            image: AssetImage('assets/image/reg-${currentStep}.png'),
          ),
        ),
        SizedBox(height: 20.0),
        Text(
          'Registration',
          style: Theme.of(context).textTheme.title,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 10.0),
        Text(
          texts[i],
          style: TextStyle(
            fontSize: 22.0,
            color: HexColor('404040'),
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 32.0),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 36),
          child: Container(
            height: 196.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(9, 161, 161, 161),
                  blurRadius: 18.0,
                  spreadRadius: 0.0,
                  offset: Offset(0.0, 3.0),
                )
              ],
            ),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Form(
                    key: _formKey,
                    child: TextFormField(
                      controller: controller,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: HexColor('404040'),
                      ),
                      decoration: InputDecoration(
                        hintText: placeholders[i],
                        prefixIcon: icons[i],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Colors.redAccent),
                        ),
                      ),
                      validator: (value) {
                        return _validateData(value, currentStep);
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Container(
                    width: double.infinity,
                    child: RaisedButton(
                      color: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Registration(
                                currentPage: currentPage += 1,
                              ),
                            ),
                          );
                        }
                      },
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          buttonText[i],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ];
    } else if (currentPage == 7) {
      children = [
        Center(
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
      ];
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
