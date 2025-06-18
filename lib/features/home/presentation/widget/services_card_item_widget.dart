import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nawel/core/theme/app_color.dart';
import 'package:nawel/core/theme/app_text_style.dart';

Widget servicesCardItem() {
  return Column(
    children: [
      Container(
        width: 105.w,
        height: 70.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColor.cardColor,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: CachedNetworkImage(
          imageUrl:
              "https://firebasestorage.googleapis.com/v0/b/spotify-baae4.appspot.com/o/services%2Fburger.png?alt=media&token=11f991d6-e1f1-429d-81cc-1c2fa5e81bfe",
        ),
      ),
      Container(
        width: 64.w,
        height: 16.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColor.primaryColor,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Text(
          "Up to 50%",
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            color: AppColor.white,
          ),
        ),
      ),
      Text(
        "Food",
        style: AppStyles.commonBoldBlackTextStyle.copyWith(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
    ],
  );
}
