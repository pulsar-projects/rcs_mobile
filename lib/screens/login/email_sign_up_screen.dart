import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EmailSignUpScreen extends StatelessWidget {
  static const routeName = '/emailRegistration';

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFF70b57c).withOpacity(0.5),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Sign Up with Email",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        TextFormField(
                          cursorColor: Colors.green,
                          decoration: const InputDecoration(
                              labelText: "Enter your email",
                              labelStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green))),
                          validator: (value) {
                            value.isEmpty
                                ? "Please enter an email" //TODO: add email validation
                                : null;
                          },
                        ),
                        TextFormField(
                          cursorColor: Colors.green,
                          obscureText: true,
                          decoration: const InputDecoration(
                              labelText: "Enter a password",
                              labelStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green))),
                          validator: (value) {
                            value.isEmpty
                                ? "Please enter a password" //TODO: add email validation
                                : null;
                          },
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            child: FlatButton(
                              onPressed: () {
                                if (_formKey.currentState.validate()) {
                                  //do something
                                }
                              },
                              child: Text("Submit"),
                              splashColor: Color(0xFFbbedc4),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(3)),
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
