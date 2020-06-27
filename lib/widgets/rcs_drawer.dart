import 'package:flutter/material.dart';

class RcsDrawer extends StatelessWidget {
  const RcsDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text(
              'User settings',
              style: TextStyle(
                fontSize: 18,
                color: Theme.of(context).primaryColor,
              ),
            ),
            automaticallyImplyLeading: false,
            backgroundColor: Theme.of(context).backgroundColor,
          ),
          //TODO: define user settings
          ListTile(
            leading: Icon(
              Icons.call,
              color: Theme.of(context).colorScheme.onSecondary,
            ),
            title: Text(
              'Contact',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w300,
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
            onTap: () {
              //TODO: implement handler
            },
          ),
        ],
      ),
    );
  }
}