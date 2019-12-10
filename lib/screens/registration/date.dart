import 'package:flutter/material.dart';
import 'package:moneysaver/main.dart';
import 'package:moneysaver/screens/registration/name.dart';
import 'package:moneysaver/screens/doneRegistrationSplash.dart';
import 'package:moneysaver/models/user.dart';

class DateRegistrationScreen extends StatefulWidget {
  @override
  _DateRegistrationScreenState createState() => _DateRegistrationScreenState();
}

class _DateRegistrationScreenState extends State<DateRegistrationScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        centerTitle: true,
        leading: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NameRegistrationScreen(),
                ),
              );
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.grey,
            )),
        title: Text(
          'Step 3/3',
          style: TextStyle(fontSize: 20, color: HexColor('404040')),
        ),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 90.0),
          Container(
            height: 150.0,
            child: Image(
              image: AssetImage('assets/image/reg-${3}.png'),
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
            'Set your salary.',
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
                      key: this._formKey,
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            style: TextStyle(
                              fontSize: 20.0,
                              color: HexColor('404040'),
                            ),
                            decoration: InputDecoration(
                              hintText: '11',
                              prefixIcon: Icon(
                                Icons.calendar_today,
                                color: HexColor('404040'),
                              ),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                            ),
                            validator: (value) {
                              try {
                                var tmp = double.parse(value);
                                if (0 < tmp && tmp < 32) {
                                  user.salaryDate = tmp.round();
                                  initUser({
                                    'name': user.name,
                                    'salary': user.salary,
                                    'salaryDate': user.salaryDate,
                                    'gender': '',
                                    'location': '',
                                    'email': '',
                                    'phone': '',
                                    'profession': '',
                                    'hasAvatar': false,
                                    'avatarUrl': '',
                                    'isRemind': false,
                                    'remindTime': '',
                                    'remindType': '',
                                    'remindSound': '',
                                    'language': '',
                                  });
                                  print(
                                      '${user.name}, ${user.salary}, ${user.salaryDate}');
                                  return null;
                                } else {
                                  return 'This field contains wrong value';
                                }
                              } on FormatException {
                                return 'This field contains only numbers';
                              }
                            },
                            onSaved: (String value) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Splash(),
                                ),
                              );
                            },
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
                                        builder: (context) => Splash(),
                                      ),
                                    );
                                  }
                                },
                                child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    'Next',
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
