import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rcs_mobile/screens/dashboard_screen.dart';
import 'package:rcs_mobile/common/sign_in.dart';
import 'package:rcs_mobile/screens/onboarding/onboarding_screen.dart';
import 'package:rcs_mobile/widgets/common/sign_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'email_sign_screen.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
//        color: Theme.of(context).colorScheme.surface,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/logo.png'),
              SignButton(
                context: context,
                onPressedFunction: () {
                  signInWithGoogle().whenComplete(() {
                    Navigator.of(context)
                        .pushReplacementNamed(DashboardScreen.routeName);
                  });
                },
                iconImage: Image(
                    image: AssetImage("assets/google_logo.png"), height: 35.0),
                text: 'Sign in with Google',
              ),
              SignButton(
                context: context,
                onPressedFunction: () {
                  Navigator.of(context).pushNamed(EmailSignScreen.routeName, arguments: {'title': "Sign In with Email", 'isSignIn': true});
                },
                iconImage: Icon(
                  Icons.mail,
                  size: 35,
                  color: Colors.black54,
                ),
                text: "Sign in with Email",
              ),
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(EmailSignScreen.routeName, arguments: {'title': "Sign Up with Email", 'isSignIn': false});
                },
                child: Text("Sign Up with Email",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black54,
                ),),
              ),
              RaisedButton(
                child: Text("View onboarding again (JUST FOR DEV)"),
                onPressed: () async {
//                  SharedPreferences preferences =
//                      await SharedPreferences.getInstance();
//                  await preferences.setBool('seen', false);
                  Navigator.pushReplacementNamed(
                      context, OnboardingScreen.routeName);
                },
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Image.asset('assets/leafs.png',),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}