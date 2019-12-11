import 'dart:async';

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:moneysaver/main.dart';
import 'package:moneysaver/models/goal.dart';
import 'package:moneysaver/screens/createNewGoal.dart';
import 'package:moneysaver/screens/newGoal/third.dart';
import 'package:moneysaver/widgets/curvePainter.dart';

class SecondRegistration extends StatefulWidget {
  final String type = newGoalModel.type;

  @override
  _SecondRegistrationState createState() => _SecondRegistrationState();
}

class _SecondRegistrationState extends State<SecondRegistration> {
  final _amountFormKey = GlobalKey<FormState>();

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
              MaterialPageRoute(builder: (context) => CreateNewGoal()),
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
        body: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                CustomPaint(
                  painter: CurvePainter(),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 36.0, vertical: 10.0),
                        child: Container(
                          width: double.infinity,
                          height: 265.0,
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
                                  'Add goal amount',
                                  style: Theme.of(context).textTheme.title,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 27),
                                child: Text(
                                  'How many dollars you need \n to save in TOTAL for this goal?',
                                  style: TextStyle(
                                      color: HexColor('CCCCCC'), fontSize: 18),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 56, right: 26, left: 27),
                                child: Form(
                                  key: _amountFormKey,
                                  child: TextFormField(
                                      keyboardType: TextInputType.number,
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
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.0)),
                                          borderSide:
                                              BorderSide(color: Colors.grey),
                                        ),
                                      ),
                                      validator: (value) {
                                        if (double.parse(value) > 0) {
                                          newGoalModel.goalAmount =
                                              int.parse(value);
                                          Timer(Duration(seconds: 1), () {});
                                          return null;
                                        }
                                        return 'This field must contain number';
                                      },
                                      onSaved: (String value) {}),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 36.0, vertical: 10.0),
                          child: Container(
                              width: double.infinity,
                              height: 316.0,
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
                              child: Column(children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 40, right: 38, left: 38, bottom: 7),
                                  child: Text(
                                    'Select save type',
                                    style: Theme.of(context).textTheme.title,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 27),
                                  child: Text(
                                    'How many dollars you need \n to save in TOTAL for this goal?',
                                    style: TextStyle(
                                        color: HexColor('CCCCCC'),
                                        fontSize: 18),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                SizedBox(height: 18.0),
                                ChoiceChipWidget(['Weekly', 'Monthy'],
                                    widget.type, _amountFormKey)
                              ]))),
                    ],
                  ),
                )
              ],
            )
          ],
        ));
  }
}

class ChoiceChipWidget extends StatefulWidget {
  final List<String> reportList;
  final String type;
  final _formKey;

  ChoiceChipWidget(this.reportList, this.type, this._formKey);

  @override
  _ChoiceChipWidgetState createState() => new _ChoiceChipWidgetState();
}

class _ChoiceChipWidgetState extends State<ChoiceChipWidget> {
  String saveType = "";

  List<Widget> _buildChoiceList() {
    List<Widget> choices = List();
    widget.reportList.forEach((item) {
      choices.add(Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Container(
                child: ChoiceChip(
                  label: Text(item),
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  labelStyle: TextStyle(
                    color: saveType == item
                        ? Colors.white
                        : Theme.of(context).primaryColor,
                    fontSize: 20.0,
                  ),
                  backgroundColor: HexColor('F3F3FF'),
                  selectedColor: Theme.of(context).primaryColor,
                  selected: saveType == item,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  onSelected: (selected) {
                    setState(() {
                      saveType = item;
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
      Container(
        width: double.infinity,
        child: Center(child: Wrap(children: _buildChoiceList())),
      ),
      Container(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 27),
        width: double.infinity,
        child: RaisedButton(
          color: Theme.of(context).primaryColor,
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 45),
          child:
              Text('Next', style: TextStyle(fontSize: 20, color: Colors.white)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          onPressed: () {
            if (widget._formKey.currentState.validate()) {
              newGoalModel.saveType = saveType.toLowerCase();
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ThirdRegistration()));
            }
          },
        ),
      ),
    ]));
  }
}
