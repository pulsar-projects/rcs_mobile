import 'package:flutter/material.dart';
import 'package:rcs_mobile/common/sign_in.dart';

class UserDetails extends StatelessWidget {
  const UserDetails({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String text = user.displayName == null ? 'Irene Ford' : user.displayName;

    return Text(
      text,
      style: TextStyle(
          color: Theme.of(context).colorScheme.secondaryVariant,
          fontWeight: FontWeight.bold,
          fontSize: 20),
    );
  }
}