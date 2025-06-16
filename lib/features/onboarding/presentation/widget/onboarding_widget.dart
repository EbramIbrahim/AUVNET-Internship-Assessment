import 'package:flutter/material.dart';
import 'package:nawel/core/assets/image_assets.dart';

Widget onboardingTopSection(BuildContext context) {
  return SizedBox(
    width: double.maxFinite,
    height: MediaQuery.of(context).size.height * 0.5,
    child: Stack(
      children: [
        Image.asset(ImageAssets.ellipseImg),
        Positioned(top: 91, left:20, right: 20, child: Image.asset(ImageAssets.logoImg))
      ],
    ),
  );
}

Widget onboardingText(String text, TextStyle style) {
  return Text(text, style: style, textAlign: TextAlign.center,);
}



