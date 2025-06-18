import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nawel/features/home/data/model/promotions.dart';

import '../../../../core/assets/image_assets.dart';
import '../../../../core/theme/app_color.dart';

Widget sliderRestaurantItem(
    CarouselSliderController? carouselController,
    List<PromotionsModel> promotions,
    double currentPosition
    ) {
  return Column(
    children: [
      CarouselSlider(
          carouselController: carouselController,
          options: CarouselOptions(
            onPageChanged: (index, reason) {

            },
height: 180.h,
            viewportFraction: 0.9,
            enlargeCenterPage: true,
          ),

        items: promotions.map((restaurant) {
          return CachedNetworkImage(
              imageUrl: restaurant.image.toString(),
            errorWidget: (context, url, error) => Image.asset(ImageAssets.placeholderImg),
          );
        }).toList(),
      ),
      DotsIndicator(
          dotsCount: promotions.length,
        position: currentPosition,
        decorator: DotsDecorator(
          size: Size(8.w, 8.h),
          activeSize: Size(8.w, 8.h),
          color: AppColor.lightGrayColor, // Inactive color
          activeColor: AppColor.primaryColor,
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0.r),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0.r),
          ),
        ),
      )
    ],
  );
}