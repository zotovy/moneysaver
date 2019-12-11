import 'package:flutter/material.dart';
import 'package:moneysaver/models/goal.dart';
import 'package:moneysaver/models/user.dart';
import 'package:moneysaver/screens/newGoal/second.dart';
import 'package:moneysaver/widgets/curvePainter.dart';

import '../../main.dart';

class ThirdRegistration extends StatefulWidget {
  final String type = newGoalModel.type;
  final String saveType = newGoalModel.saveType;
  final int goalAmount = newGoalModel.goalAmount;

  @override
  _ThirdRegistrationState createState() => _ThirdRegistrationState();
}

class _ThirdRegistrationState extends State<ThirdRegistration> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          bottomOpacity: 0.0,
          elevation: 0.0,
          backgroundColor: Theme.of(context).primaryColor,
          leading: GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecondRegistration()),
            ),
            child: Icon(Icons.arrow_back_ios),
          ),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 15.0),
              child: Icon(
                Icons.cancel,
              ),
            )
          ],
        ),
        body: ListView(children: <Widget>[
          Column(children: <Widget>[
            CustomPaint(
                painter: CurvePainter(),
                child: Column(children: <Widget>[
                  Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 36.0, vertical: 10.0),
                      child: Container(
                          width: double.infinity,
                          height: 699.0,
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
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 40, right: 38, left: 38, bottom: 7),
                                child: Text(
                                  'Select amount',
                                  style: Theme.of(context).textTheme.title,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 27),
                                child: Text(
                                  'How much can you save\nEACH MONTH for this goal?',
                                  style: TextStyle(
                                      color: HexColor('CCCCCC'), fontSize: 18),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              ChoiceChipWidget([
                                ['Fair', '5%'],
                                ['Good', '10%'],
                                ['Great', '15%']
                              ]),
                            ],
                          )))
                ]))
          ])
        ]));
  }
}

class ChoiceChipWidget extends StatefulWidget {
  final List<List<String>> reportList;

  ChoiceChipWidget(this.reportList);

  @override
  _ChoiceChipWidgetState createState() => new _ChoiceChipWidgetState();
}

class _ChoiceChipWidgetState extends State<ChoiceChipWidget> {
  String saveAmount = "";
  final _formKey = GlobalKey<FormState>();
  final inputController = TextEditingController();

  List<Widget> _buildChoiceList() {
    List<Widget> choices = List();
    Color color;
    int percentage;
    double money;

    widget.reportList.forEach((item) {
      if (item[0] == 'Fair') {
        color = HexColor('FF4555');
        percentage = 5;
        money = (user.salary / 100) * percentage;
      }
      if (item[0] == 'Good') {
        color = Theme.of(context).primaryColor;
        percentage = 10;
        money = (user.salary / 100) * percentage;
      }
      if (item[0] == 'Great') {
        color = HexColor('32D74B');
        percentage = 15;
        money = (user.salary / 100) * percentage;
      }
      choices.add(Padding(
          padding: EdgeInsets.symmetric(horizontal: 27, vertical: 10),
          child: Column(
            children: <Widget>[
              Container(
                child: ChoiceChip(
                  label: RichText(
                      text: TextSpan(
                    children: [
                      TextSpan(
                          text: item[0],
                          style: TextStyle(
                              color:
                                  saveAmount == item[0] ? Colors.white : color,
                              fontSize: 20)),
                      TextSpan(
                          text: ' - $money\$ ($percentage%)',
                          style: TextStyle(
                              color: saveAmount == item[0]
                                  ? Colors.white
                                  : Theme.of(context).primaryColor,
                              fontSize: 20)),
                    ],
                  )),
                  padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 27),
                  labelStyle: TextStyle(
                    color: saveAmount == item[0]
                        ? Colors.white
                        : Theme.of(context).primaryColor,
                    fontSize: 20.0,
                  ),
                  backgroundColor: Colors.white,
                  selectedColor: Theme.of(context).primaryColor,
                  selected: saveAmount == item[0],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      side: BorderSide(color: Theme.of(context).primaryColor)),
                  onSelected: (selected) {
                    setState(() {
                      saveAmount = item[0];
                    });
                  },
                ),
              ),
              SizedBox(height: 5.0),
            ],
          )));
    });
    return choices;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(children: [
      SizedBox(height: 30.0),
      Text(
        "Here's some suggestions".toUpperCase(),
        style: TextStyle(color: HexColor('404040'), fontSize: 16.0),
      ),
      Container(
        width: double.infinity,
        child: Center(child: Column(children: _buildChoiceList())),
      ),
      SizedBox(height: 10.0),
      Text(
        'or'.toUpperCase(),
        style: TextStyle(color: HexColor('404040'), fontSize: 16.0),
      ),
      SizedBox(height: 25.0),
      Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 27.0),
        child: Form(
          key: _formKey,
          child: TextFormField(
              controller: inputController,
              keyboardType: TextInputType.number,
              style: TextStyle(
                fontSize: 20.0,
                color: HexColor('404040'),
              ),
              decoration: InputDecoration(
                hintText: 'Enter your own',
                prefixIcon: Icon(
                  Icons.attach_money,
                  color: HexColor('404040'),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
              validator: (value) {
                if (double.parse(value) > user.salary) {
                  return "Save per month amoun can't be more than your salary";
                }
                newGoalModel.saveAmount = double.parse(value);
                newGoalModel.savePercentage =
                    (user.salary / double.parse(value)).round();
                print(newGoalModel.saveAmount);
                print(newGoalModel.savePercentage);
                MaterialPageRoute(builder: (context) => ThirdRegistration());
              },
              onSaved: (String value) {}),
        ),
      ),
      SizedBox(height: 10.0),
      Container(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 27),
        width: double.infinity,
        child: RaisedButton(
            color: Theme.of(context).primaryColor,
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 45),
            child: Text('Next',
                style: TextStyle(fontSize: 20, color: Colors.white)),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            onPressed: () {
              if (inputController.text.replaceAll(' ', '') != '') {
                if (_formKey.currentState.validate()) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ThirdRegistration()));
                }
              } else {
                if (saveAmount == 'Fair') {
                  newGoalModel.saveAmount = user.salary * 0.05;
                  newGoalModel.savePercentage = 5;
                } else if (saveAmount == 'Good') {
                  newGoalModel.saveAmount = user.salary * 0.1;
                  newGoalModel.savePercentage = 10;
                } else if (saveAmount == 'Great') {
                  newGoalModel.saveAmount = user.salary * 0.15;
                  newGoalModel.savePercentage = 15;
                }
                print(newGoalModel.saveAmount);
                print(newGoalModel.savePercentage);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ThirdRegistration()));
              }
            }),
      ),
    ]));
  }
}
