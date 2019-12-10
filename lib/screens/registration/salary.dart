import 'package:flutter/material.dart';
import 'package:moneysaver/main.dart';
import 'package:moneysaver/screens/registration/date.dart';
import 'package:moneysaver/models/user.dart';

class SalaryRegistrationScreen extends StatefulWidget {
  @override
  _SalaryRegistrationScreenState createState() =>
      _SalaryRegistrationScreenState();
}

class _SalaryRegistrationScreenState extends State<SalaryRegistrationScreen> {
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
                  builder: (context) => DateRegistrationScreen(),
                ),
              );
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.grey,
            )),
        title: Text(
          'Step 2/3',
          style: TextStyle(fontSize: 20, color: HexColor('404040')),
        ),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 90.0),
          Container(
            height: 150.0,
            child: Image(
              image: AssetImage('assets/image/reg-${2}.png'),
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
                              hintText: '1000',
                              prefixIcon: Icon(
                                Icons.attach_money,
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
                                user.salary = tmp;
                                return null;
                              } on FormatException {
                                return 'This field contains only numbers';
                              }
                            },
                            onSaved: (String value) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      DateRegistrationScreen(),
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
                                          builder: (context) =>
                                              DateRegistrationScreen()),
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
