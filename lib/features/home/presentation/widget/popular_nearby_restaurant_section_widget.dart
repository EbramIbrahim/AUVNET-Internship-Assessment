import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nawel/core/assets/image_assets.dart';
import 'package:nawel/core/theme/app_color.dart';
import 'package:nawel/core/theme/app_text_style.dart';
import 'package:nawel/core/widget/spacing_widget.dart';

Widget popularRestaurantNearby() {
  return Column(
    children: [
      Container(
        width: 80.w,
        height: 70.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColor.white,
          border: Border.all(width: 2, color: AppColor.lightGrayColor),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: CachedNetworkImage(
          imageUrl: "https://firebasestorage.googleapis.com/v0/b/spotify-baae4.appspot.com/o/popular%20restaurants%20nearby%2Fallo_beirut.png?alt=media&token=47afa395-2c84-4d5e-8a17-ae26d01a80dc",
        ),
      ),
      heightSpacing(8.h),
      Text(
        "Allo Beirut",
        style: AppStyles.commonBoldBlackTextStyle.copyWith(
          fontSize: 12.sp,
          fontWeight: FontWeight.w600
        ),
      ),
      Row(
        children: [
          Image.asset(ImageAssets.clockImg),
          Text(
            "32 mins",
            style: AppStyles.commonBoldBlackTextStyle.copyWith(
                fontSize: 12.sp,
                fontWeight: FontWeight.w600
            ),
          ),
        ],
      )
    ],
  );
}
