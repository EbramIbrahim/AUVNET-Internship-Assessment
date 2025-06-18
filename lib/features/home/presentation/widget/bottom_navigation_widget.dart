import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nawel/core/assets/image_assets.dart';

import '../../../../core/theme/app_color.dart';

Widget bottomNavigationBar() {
  return BottomNavigationBar(
    type: BottomNavigationBarType.fixed,
    backgroundColor: Colors.white,
    unselectedItemColor: Color(0xff484C52),
    selectedItemColor: AppColor.primaryColor,
    currentIndex: 0,
    onTap: (value) {

    },
    items: [
      BottomNavigationBarItem(
        icon: Image.asset(ImageAssets.homeIc, width: 24.w, height: 24.h,),
        label: "Home",
      ),
      BottomNavigationBarItem(
        icon: Image.asset(ImageAssets.categoriesIc, width: 24.w, height: 24.h,),
        label: "categories",
      ),
      BottomNavigationBarItem(
        icon: Image.asset(ImageAssets.deliverIc, width: 24.w, height: 24.h,),
        label: "deliver",
      ),
      BottomNavigationBarItem(
        icon: Image.asset(ImageAssets.cartIc, width: 24.w, height: 24.h,),
        label: "cart",
      ),
      BottomNavigationBarItem(
        icon: Image.asset(ImageAssets.profileIc, width: 24.w, height: 24.h,),
        label: "Profile",
      ),
    ],
  );
}