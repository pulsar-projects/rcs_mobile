import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rcs_mobile/common/sign_in.dart';
import 'package:rcs_mobile/screens/login/login_screen.dart';

import '../dashboard_screen.dart';

class EmailSignScreen extends StatefulWidget {
  static const routeName = '/emailRegistration';

  @override
  _EmailSignScreenState createState() => _EmailSignScreenState();
}

class _EmailSignScreenState extends State<EmailSignScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String email = '';

  String password = '';

  String passwordConfirmation = '';

  String error = '';

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    final title = args['title'];
    final isSignIn = args['isSignIn'];
    const textFormFieldStyle =
        TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF50AE72));
    const underlineBorder =
        UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFF50AE72)));
    const cursorColor = Color(0xFF50AE72);

    return Scaffold(
      body: Container(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.width,
                  decoration: ShapeDecoration(
                      color: Theme.of(context).colorScheme.primaryVariant,
                      shape: RoundedRectangleBorder(
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              topRight: Radius.circular(20)))),
                  child: Center(
                    child: Text(
                      title,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
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
                            keyboardType: TextInputType.emailAddress,
                            cursorColor: cursorColor,
                            decoration: const InputDecoration(
                                labelText: "Enter your email",
                                labelStyle: textFormFieldStyle,
                                focusedBorder: underlineBorder),
                            validator: (value) => value.isEmpty
                                ? "Please enter an email"
                                : validateEmail(value),
                            onChanged: (val) {
                              setState(() => email = val);
                            }),
                        TextFormField(
                            cursorColor: cursorColor,
                            obscureText: true,
                            decoration: const InputDecoration(
                                labelText: "Enter a password",
                                labelStyle: textFormFieldStyle,
                                focusedBorder: underlineBorder),
                            validator: (value) => value.length < 6
                                ? "Please enter a password with 6+ characters"
                                : null,
                            onChanged: (val) {
                              setState(() => password = val);
                            }),
                        isSignIn
                            ? Container()
                            : TextFormField(
                                cursorColor: cursorColor,
                                obscureText: true,
                                decoration: const InputDecoration(
                                    labelText: "Confirm your password",
                                    labelStyle: textFormFieldStyle,
                                    focusedBorder: underlineBorder),
                                validator: (value) => value.isEmpty
                                    ? "Please enter a password with 6+ characters"
                                    : value != password
                                        ? "The passwords don't match"
                                        : null,
                                onChanged: (val) {
                                  setState(() => passwordConfirmation = val);
                                },
                              ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            child: FlatButton(
                              onPressed: () async {
                                if (isSignIn) {
                                  if (_formKey.currentState.validate()) {
                                    dynamic result =
                                    await signInWithEmailAndPassword(
                                        email, password);
                                    if (result == null) {
                                      setState(() {
                                        error = 'There have been a problem with those credentials.';
                                      });
                                    }
                                    else {
                                      Navigator.of(context).pushReplacementNamed(DashboardScreen.routeName);
                                    }
                                    FocusScope.of(context).unfocus();
                                  }
                                }
                                else {
                                  if (_formKey.currentState.validate()) {
                                    dynamic result =
                                    await registerWithEmailAndPassword(
                                        email, password);
                                    if (result == null) {
                                      setState(() {
                                        error = 'The email address is already in use by another account.';
                                      });
                                    }
                                    else {
                                      Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
                                    }
                                    FocusScope.of(context).unfocus();
                                  }
                                }
                              },
                              child: isSignIn
                                  ? submitButtonText("Sign In")
                                  : submitButtonText("Sign Up"),
                              splashColor: Color(0xFFbbedc4),
                              shape: RoundedRectangleBorder(
                                  borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(20),
                                      topRight: Radius.circular(20))),
                              color:
                                  Theme.of(context).colorScheme.primaryVariant,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(error, style: TextStyle(color: Colors.red),)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Text submitButtonText(text) {
    return Text(
      text,
      style: TextStyle(color: Colors.white),
    );
  }

  validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }
}
