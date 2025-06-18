import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nawel/core/assets/image_assets.dart';
import 'package:nawel/core/theme/app_color.dart';
import 'package:nawel/core/theme/app_text_style.dart';
import 'package:nawel/core/widget/spacing_widget.dart';

Widget homeHeader() {
  return Container(
    width: double.infinity,
    height: 156.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(20.r),
        bottomRight: Radius.circular(20.r),
      ),
      gradient: LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [Color(0xff8900FE), Color(0xffFFDE59)],
      ),
    ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              heightSpacing(35),
              Text(
                "Delivering to",
                style: AppStyles.commonBoldBlackTextStyle.copyWith(
                  fontSize: 12.sp,
                ),
              ),
              Text(
                "Al Satwa, 81A Street",
                style: AppStyles.commonBoldBlackTextStyle.copyWith(
                  fontSize: 16.sp,
                ),
              ),
              heightSpacing(4),
              Text(
                "Hi hepa!",
                style: AppStyles.commonBoldBlackTextStyle.copyWith(
                  fontSize: 30.sp,
                  color: AppColor.white
                )
              ),
            ],
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(120),
            child: Image.asset(
              ImageAssets.avatarImg,
              fit: BoxFit.cover,
              width: 60,
              height: 60,
            ),
          ),
        ],
      ),
  );
}
