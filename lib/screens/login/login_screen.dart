import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rcs_mobile/screens/dashboard_screen.dart';
import 'package:rcs_mobile/common/sign_in.dart';
import 'package:rcs_mobile/screens/onboarding/onboarding_screen.dart';
import 'package:rcs_mobile/widgets/sign_in_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'email_sign_up_screen.dart';

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
        color: const Color(0xFF70b57c).withOpacity(0.5),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/onboarding/onboarding-1.png'),
              SignInButton(
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
              SignInButton(
                context: context,
                onPressedFunction: () {
                  Navigator.of(context).pushNamed(EmailSignUpScreen.routeName);
                },
                iconImage: Icon(
                  Icons.mail,
                  size: 35,
                  color: Colors.black54,
                ),
                text: "Sign in with Email",
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
              )
            ],
          ),
        ),
      ),
    );
  }
}