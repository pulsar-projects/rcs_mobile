import 'package:flutter/material.dart';
import 'package:rcs_mobile/common/sign_in.dart';
import 'package:rcs_mobile/screens/login/login_screen.dart';

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
                color: Theme.of(context).colorScheme.secondaryVariant,
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
                color: Theme.of(context).colorScheme.onSecondary,
              ),
            ),
            onTap: () {
              //TODO: implement handler
            },
          ),
          ListTile(
            leading: Icon(
              Icons.exit_to_app,
              color: Theme.of(context).colorScheme.onSecondary,
            ),
            title: Text(
              'Log out',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w300,
                color: Theme.of(context).colorScheme.onSecondary,
              ),
            ),
            onTap: () {
              signOutGoogle();
              Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}