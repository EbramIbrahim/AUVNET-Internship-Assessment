import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nawel/core/assets/image_assets.dart';
import 'package:nawel/core/theme/app_color.dart';
import 'package:nawel/core/theme/app_text_style.dart';
import 'package:nawel/core/widget/spacing_widget.dart';
import 'package:nawel/features/home/data/model/restaurants.dart';

Widget popularRestaurantNearby(RestaurantsModel restaurants) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child: Column(
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
            imageUrl: restaurants.restaurantsImage.toString(),
            errorWidget: (context, url, error) => Image.asset(ImageAssets.placeholderImg),
          ),
        ),
        heightSpacing(8.h),
        Text(
          restaurants.name.toString(),
          style: AppStyles.commonBoldBlackTextStyle.copyWith(
            fontSize: 12.sp,
            fontWeight: FontWeight.w600
          ),
        ),
        Row(
          children: [
            Image.asset(ImageAssets.clockImg),
            Text(
              " ${restaurants.time}",
              style: AppStyles.commonBoldBlackTextStyle.copyWith(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600
              ),
            ),
          ],
        )
      ],
    ),
  );
}
