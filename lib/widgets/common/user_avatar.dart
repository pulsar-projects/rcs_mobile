import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CircleAvatar(
        radius: 40,
        backgroundImage: AssetImage(
            'assets/sample/images/user-avatar.jpg'),
      ),
    );
  }
}