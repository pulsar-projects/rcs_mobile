import 'package:flutter/material.dart';

class OnboardingPageIndicator extends StatelessWidget {
  final int currentIndex, positionIndex;

  const OnboardingPageIndicator({this.currentIndex, this.positionIndex});

  @override
  Widget build(BuildContext context) {
    var isCurrent = positionIndex == currentIndex;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2),
      height: isCurrent ? 10 : 6,
      width: isCurrent ? 10 : 6,
      decoration: BoxDecoration(
          color: isCurrent ? Colors.grey : Colors.grey[300],
          borderRadius: BorderRadius.circular(12)),
    );
  }
}
