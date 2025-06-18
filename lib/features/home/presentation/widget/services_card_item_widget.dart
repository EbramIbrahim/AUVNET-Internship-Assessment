import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nawel/core/assets/image_assets.dart';
import 'package:nawel/core/theme/app_color.dart';
import 'package:nawel/core/theme/app_text_style.dart';
import 'package:nawel/features/home/data/model/services.dart';

Widget servicesCardItem(ServicesModel services) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child: Column(
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
            imageUrl: services.offerImage.toString(),
            errorWidget: (context, url, error) => Image.asset(ImageAssets.placeholderImg),
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
            services.offer.toString(),
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: AppColor.white,
            ),
          ),
        ),
        Text(
          services.name.toString(),
          style: AppStyles.commonBoldBlackTextStyle.copyWith(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    ),
  );
}
