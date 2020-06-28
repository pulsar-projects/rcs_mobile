import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EmailSignScreen extends StatelessWidget {
  static const routeName = '/emailRegistration';
  final _formKey = GlobalKey<FormState>();

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
                          cursorColor: cursorColor,
                          decoration: const InputDecoration(
                              labelText: "Enter your email",
                              labelStyle: textFormFieldStyle,
                              focusedBorder: underlineBorder),
                          validator: (value) {
                            value.isEmpty
                                ? "Please enter an email" //TODO: add email validation
                                : null;
                          },
                        ),
                        TextFormField(
                          cursorColor: cursorColor,
                          obscureText: true,
                          decoration: const InputDecoration(
                              labelText: "Enter a password",
                              labelStyle: textFormFieldStyle,
                              focusedBorder: underlineBorder),
                          validator: (value) {
                            value.isEmpty
                                ? "Please enter a password" //TODO: add password validation
                                : null;
                          },
                        ),
                        isSignIn
                            ? Container()
                            : TextFormField(
                                cursorColor: cursorColor,
                                obscureText: true,
                                decoration: const InputDecoration(
                                    labelText: "Confirm your password",
                                    labelStyle: textFormFieldStyle,
                                    focusedBorder: underlineBorder),
                                validator: (value) {
                                  value.isEmpty
                                      ? "Please confirm your password" //TODO: add password validation
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
}
