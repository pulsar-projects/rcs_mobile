import 'package:flutter/material.dart';

class AvatarFlatButton extends StatelessWidget {
  const AvatarFlatButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {
        //TODO: impl handler
      },
      child: CircleAvatar(
        backgroundImage: AssetImage(
            'assets/sample/images/user-avatar.jpg'),
      ),
      shape: CircleBorder(
          side: BorderSide(color: Colors.transparent)),
    );
  }
}