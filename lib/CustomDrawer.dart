import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './models/user.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<IconData> icons = [
      CupertinoIcons.bookmark,
      CupertinoIcons.time,
      CupertinoIcons.settings,
      CupertinoIcons.person,
    ];

    List<String> text = ['My goal', 'Timer', 'Settings', 'Help Center'];

    return Drawer(
      child: ListView(children: <Widget>[
        _createHeader(context),
        _createDrawerItem(icons[0], text[0], () => print(text[0])),
        _createDrawerItem(icons[1], text[1], () => print(text[1])),
        _createDrawerItem(icons[2], text[2], () => print(text[2])),
        _createDrawerItem(icons[3], text[3], () => print(text[3])),
      ]),
    );
  }

  Widget _createHeader(BuildContext context) {
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
        ),
        child: Stack(children: <Widget>[
          Positioned(
              bottom: 12.0,
              left: 16.0,
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                      radius: 50.0,
                      backgroundImage: user.hasAvatar
                          ? AssetImage("assets/user/" + user.avatarUrl)
                          : AssetImage("assets/user/default.png")),
                  SizedBox(width: 10.0),
                  Text(
                    user.name,
                    style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ],
              ))
        ]));
  }

  Widget _createDrawerItem(IconData icon, String text, Function onTap) {
    return Padding(
        padding: EdgeInsets.all(10),
        child: ListTile(
          title: Row(
            children: <Widget>[
              Icon(
                icon,
                size: 36.0,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
              ),
            ],
          ),
          onTap: onTap,
          trailing: Icon(CupertinoIcons.right_chevron),
        ));
  }
}
