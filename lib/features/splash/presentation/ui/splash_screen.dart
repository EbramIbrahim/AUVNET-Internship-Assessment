import 'package:flutter/material.dart';
import 'package:nawel/core/assets/image_assets.dart';
import 'package:nawel/core/theme/app_color.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        color: AppColor.white,
      ),
      child: Center(
        child: Image.asset(ImageAssets.logoImg),
      ),
    );
  }
}
