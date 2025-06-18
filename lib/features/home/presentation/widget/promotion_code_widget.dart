import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nawel/core/assets/image_assets.dart';
import 'package:nawel/core/theme/app_color.dart';
import 'package:nawel/core/theme/app_text_style.dart';
import 'package:nawel/core/widget/spacing_widget.dart';

Widget promotionCodeWidget() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 19.0),
    child: Container(
      width: double.infinity,
      height: 89.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.blueGrey.withValues(alpha: 0.2),
            blurRadius: 12,
            spreadRadius: 3,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          widthSpacing(15),
          Container(
            width: 80.w,
            height: 80.h,
            alignment: Alignment.center,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CachedNetworkImage(
                    imageUrl: "https://firebasestorage.googleapis.com/v0/b/spotify-baae4.appspot.com/o/shortcuts%2Fsuper_saver.png?alt=media&token=fa79f06d-74ae-4f79-aadf-ba6920f47fb5"),
                Image.asset(ImageAssets.nImg)
              ],
            ),
          ),
          widthSpacing(5),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Got a code !",
                style: AppStyles.commonBoldBlackTextStyle.copyWith(
                  fontSize: 14.sp,
                ),
              ),
              Text(
                "Add your code and save on your\norder",
                style: TextStyle(
                  fontSize: 10.sp,
                  color: AppColor.lightGrayColor,
                  fontWeight: FontWeight.w400
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
