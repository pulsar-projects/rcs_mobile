import 'package:flutter/material.dart';

class EmailSignUpScreen extends StatelessWidget {
  static const routeName = '/emailRegistration';

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
              Text("Sign Up with Email", style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
