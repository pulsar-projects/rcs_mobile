import 'package:flutter/material.dart';

class OnboardingTile extends StatelessWidget {
  String imageAssetPath, title, description;

  OnboardingTile({this.imageAssetPath, this.title, this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(imageAssetPath),
          Text(title, style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),),
          SizedBox(
            height: 12,
          ),
          Text(description, textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400
          ),)
        ],
      ),
    );
  }
}
