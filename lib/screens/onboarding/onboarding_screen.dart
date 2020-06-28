import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:rcs_mobile/model/onboarding_tile_model.dart';
import 'package:rcs_mobile/screens/login/login_screen.dart';
import 'package:rcs_mobile/widgets/onboarding_widgets/onboarding_page_indicator.dart';
import 'package:rcs_mobile/widgets/onboarding_widgets/onboarding_tile.dart';

class OnboardingScreen extends StatefulWidget {
  static const routeName = '/onboarding';

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController _pageController;
  int currentIndex = 0;
  static const _kDuration = const Duration(milliseconds: 300);
  static const _kCurve = Curves.ease;
  List<OnboardingTileModel> onboardingTiles;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    onboardingTiles = getOnboardingTiles();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  onChangedFunction(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  nextFunction() {
    _pageController.nextPage(duration: _kDuration, curve: _kCurve);
  }

  skipFunction() {
    _pageController.animateToPage(onboardingTiles.length - 1,
        duration: _kDuration, curve: _kCurve);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        itemCount: onboardingTiles.length,
        itemBuilder: (ctx, index) {
          return OnboardingTile(
            imageAssetPath: onboardingTiles[index].imagePath,
            title: onboardingTiles[index].title,
            description: onboardingTiles[index].description,
          );
        },
        onPageChanged: (value) {
          setState(() {
            currentIndex = value;
          });
        },
      ),
      bottomSheet: currentIndex != onboardingTiles.length - 1
          ? Container(
              height: Platform.isIOS ? 70 : 60,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    onTap: () => skipFunction(),
                    child: Text("SKIP"),
                  ),
                  Row(
                    children: <Widget>[
                      for (int i = 0; i < onboardingTiles.length; i++)
                        OnboardingPageIndicator(
                            currentIndex: currentIndex, positionIndex: i)
                    ],
                  ),
                  GestureDetector(
                    onTap: () => nextFunction(),
                    child: Text("NEXT"),
                  ),
                ],
              ),
            )
          : GestureDetector(
              onTap: () => Navigator.pushReplacementNamed(
                  context, LoginScreen.routeName),
              child: Container(
                height: Platform.isIOS ? 70 : 60,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                color: Colors.green,
                child: Text(
                  "GET STARTED!",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w600),
                ),
              ),
            ),

//      Stack(children: <Widget>[
//        PageView(
//          onPageChanged: onChangedFunction,
//          controller: _pageController,
//          children: <Widget>[
//            Container(
//              child: Text("First Screen"),
//            ),
//            Container(
//              child: Text("Second Screen"),
//            ),
//            Container(
//              child: Text("Third Screen"),
//            ),
//          ],
//        ),
//        Padding(
//          padding: const EdgeInsets.all(20.0),
//          child: Column(
//            crossAxisAlignment: CrossAxisAlignment.center,
//            mainAxisSize: MainAxisSize.max,
//            mainAxisAlignment: MainAxisAlignment.end,
//            children: <Widget>[
//              Row(
//                crossAxisAlignment: CrossAxisAlignment.center,
//                mainAxisAlignment: MainAxisAlignment.center,
//                children: <Widget>[
//                  OnboardingPageIndicator(
//                    positionIndex: 0,
//                    currentIndex: currentIndex,
//                  ),
//                  SizedBox(
//                    width: 10,
//                  ),
//                  OnboardingPageIndicator(
//                    positionIndex: 1,
//                    currentIndex: currentIndex,
//                  ),
//                  SizedBox(
//                    width: 10,
//                  ),
//                  OnboardingPageIndicator(
//                    positionIndex: 2,
//                    currentIndex: currentIndex,
//                  ),
//                ],
//              ),
////              Container(
////                child: Row(
////                  mainAxisSize: MainAxisSize.max,
////                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
////                  children: <Widget>[
////                    IconButton(
////                      onPressed: () => previousFunction(),
////                      icon: Icon(Icons.keyboard_arrow_left),
////                    ),
////                    IconButton(
////                      onPressed: () => nextFunction(),
////                      icon: Icon(Icons.keyboard_arrow_right),
////                    )
////                  ],
////                ),
////              ),
//            ],
//          ),
//        ),
//      ]),
    );
  }
}
