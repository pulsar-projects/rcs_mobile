import 'package:flutter/material.dart';

class RcsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const RcsAppBar({
    Key key,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFF70b57c),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            //TODO: implement handler
          },
          child: CircleAvatar(
            backgroundImage: NetworkImage('https://via.placeholder.com/150'),
          ),
          shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
        ),
      ],
    );
  }
}
