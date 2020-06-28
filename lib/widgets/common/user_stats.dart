import 'package:flutter/material.dart';

class UserStats extends StatelessWidget {
  const UserStats({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: Color(0xFF499763).withOpacity(0.5),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          alignment: Alignment.centerRight,
          child: Padding(
              padding: EdgeInsets.only(right: 10),
              child: Text(
                '102 points',
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              )),
          height: 35,
          width: 210,
        ),
        Container(
          decoration: BoxDecoration(
            color: Color(0xFF499763),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.only(right: 10),
            child: Text(
              '34 recycled',
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          height: 35,
          width: 120,
        )
      ],
    );
  }
}