import 'package:flutter/material.dart';

class SecondRegistration extends StatefulWidget {
  String type;

  SecondRegistration(this.type);

  @override
  _SecondRegistrationState createState() => _SecondRegistrationState();
}

class _SecondRegistrationState extends State<SecondRegistration> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(widget.type),
    );
  }
}
