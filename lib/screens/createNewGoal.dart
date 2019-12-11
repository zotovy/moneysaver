import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:moneysaver/models/goal.dart';

import './noGoalHomePage.dart';
import '../widgets/curvePainter.dart';
import '../main.dart';
import './newGoal/second.dart';

class CreateNewGoal extends StatefulWidget {
  @override
  CreateNewGoalState createState() => CreateNewGoalState();
}

class CreateNewGoalState extends State<CreateNewGoal> {
  @override
  Widget build(BuildContext context) {
    int pressedIcon = null;

    void setPressedIcon(int index) {
      setState(() {
        pressedIcon = index;
      });
    }

    return Scaffold(
        appBar: AppBar(
          bottomOpacity: 0.0,
          elevation: 0.0,
          backgroundColor: Theme.of(context).primaryColor,
          leading: GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NoGoalHomePage()),
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
                          height: 650.0,
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
                            SizedBox(height: 20.0),
                            Text(
                              'Select goal type',
                              style: Theme.of(context).textTheme.title,
                            ),
                            SizedBox(height: 20.0),
                            ChoiceChipWidget([
                              'home-city',
                              'cellphone',
                              'basket',
                              'car',
                              'bike',
                              'hospital',
                            ])
                          ])))
                ]))
          ])
        ]));
  }
}

class ChoiceChipWidget extends StatefulWidget {
  final List<String> reportList;

  ChoiceChipWidget(this.reportList);

  @override
  _ChoiceChipWidgetState createState() => new _ChoiceChipWidgetState();
}

class _ChoiceChipWidgetState extends State<ChoiceChipWidget> {
  String selectedChoice = "";
  Map<String, String> _text = {
    'home-city': 'House',
    'cellphone': 'Phone',
    'basket': 'Vacation',
    'car': 'Car',
    'bike': 'Bike',
    'hospital': 'Emergency',
  };

  List<Widget> _buildChoiceList() {
    List<Widget> choices = List();
    widget.reportList.forEach((item) {
      choices.add(Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Container(
                child: ChoiceChip(
                  label: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    width: 100.0,
                    height: 100.0,
                    child: Icon(
                      MdiIcons.fromString(item),
                      color: selectedChoice == item
                          ? Colors.white
                          : Theme.of(context).primaryColor,
                      size: 50.0,
                    ),
                  ),
                  padding: EdgeInsets.all(0.0),
                  labelStyle: TextStyle(
                      color: Colors.transparent,
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold),
                  backgroundColor: HexColor('F3F3FF'),
                  selectedColor: Theme.of(context).primaryColor,
                  selected: selectedChoice == item,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  onSelected: (selected) {
                    setState(() {
                      selectedChoice = item;
                    });
                  },
                ),
              ),
              SizedBox(height: 5.0),
              Text(_text[item]),
            ],
          )));
    });
    return choices;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        Wrap(
          children: _buildChoiceList(),
        ),
        Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(10.0),
              child: RaisedButton(
                splashColor: HexColor('F3F3FF'),
                color: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 45),
                child: Text('Create my own goal',
                    style: TextStyle(
                        fontSize: 20, color: Theme.of(context).primaryColor)),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(
                      color: Theme.of(context).primaryColor,
                    )),
                onPressed: () => print('Create own goal'),
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(10.0),
              child: RaisedButton(
                  color: Theme.of(context).primaryColor,
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 45),
                  child: Text('Next',
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  onPressed: () {
                    newGoalModel.type = selectedChoice.toString();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SecondRegistration()));
                  }),
            ),
          ],
        )
      ]),
    );
  }
}
