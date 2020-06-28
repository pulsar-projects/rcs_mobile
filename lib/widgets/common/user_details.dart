import 'package:flutter/material.dart';

class UserDetails extends StatelessWidget {
  const UserDetails({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Irene Ford',
      style: TextStyle(
          color: Theme.of(context).colorScheme.secondaryVariant,
          fontWeight: FontWeight.bold,
          fontSize: 20),
    );
  }
}