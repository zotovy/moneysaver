import 'package:flutter/material.dart';
import '../CustomDrawer.dart';

class MyCustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final GlobalKey<ScaffoldState> scaffold_key;

  const MyCustomAppBar({
    Key key,
    @required this.height,
    this.scaffold_key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      height: height,
      child: Padding(
          padding: EdgeInsets.only(top: 36.0, left: 18.0, right: 18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.menu),
                    color: Colors.white,
                    onPressed: () => Scaffold.of(context).openDrawer(),
                    iconSize: 36.0,
                  ),
                  IconButton(
                    icon: Icon(Icons.notifications),
                    color: Colors.white,
                    onPressed: null,
                    iconSize: 36.0,
                  ),
                ],
              ),
            ],
          )),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
