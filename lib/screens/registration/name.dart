import 'package:flutter/material.dart';
import 'package:moneysaver/screens/registration.dart';
import 'package:moneysaver/main.dart';
import 'package:moneysaver/screens/registration/salary.dart';
import 'package:moneysaver/models/user.dart';

class NameRegistrationScreen extends StatefulWidget {
  @override
  _NameRegistrationScreenState createState() => _NameRegistrationScreenState();
}

class _NameRegistrationScreenState extends State<NameRegistrationScreen> {
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
                  builder: (context) => Registration(currentPage: 3),
                ),
              );
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.grey,
            )),
        title: Text(
          'Step 1/3',
          style: TextStyle(fontSize: 20, color: HexColor('404040')),
        ),
      ),
      body: ListView(
        children: [
          SizedBox(height: 90.0),
          Container(
            height: 150.0,
            child: Image(
              image: AssetImage('assets/image/reg-${1}.png'),
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
            'Lets start! Enter your name,\nso will know how to call you :)',
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
                              hintText: 'John Rock',
                              prefixIcon: Icon(
                                Icons.person,
                                color: HexColor('404040'),
                              ),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'This field is required';
                              }
                              user.name = value;
                              return null;
                            },
                            onSaved: (String value) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      NameRegistrationScreen(),
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
                                            SalaryRegistrationScreen(),
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
