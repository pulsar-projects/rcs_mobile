import 'package:flutter/material.dart';
import 'package:rcs_mobile/common/sign_in.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: user.photoUrl != null
          ? CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(user.photoUrl),
            )
          : CircleAvatar(
              radius: 40,
              backgroundImage:
                  AssetImage('assets/sample/images/user-avatar.jpg'),
            ),
    );
  }
}
