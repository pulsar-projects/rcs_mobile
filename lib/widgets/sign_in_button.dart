import 'package:flutter/material.dart';

class SignInButton extends StatelessWidget {
  final Function onPressedFunction;
  final Widget iconImage;
  final String text;

  const SignInButton(
      {Key key,
        @required this.context,
        @required this.onPressedFunction,
        this.iconImage,
        this.text})
      : super(key: key);

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      splashColor: Color(0xFFbbedc4),
      onPressed: onPressedFunction,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
      color: Colors.white,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.5,
        height: MediaQuery.of(context).size.height * 0.07,
        child: FittedBox(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                iconImage,
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    text,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
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
