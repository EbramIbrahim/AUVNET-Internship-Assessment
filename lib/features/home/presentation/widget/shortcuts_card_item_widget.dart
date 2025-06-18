import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nawel/core/theme/app_color.dart';
import 'package:nawel/core/theme/app_text_style.dart';
import 'package:nawel/core/widget/spacing_widget.dart';

import '../../../../core/assets/image_assets.dart';

Widget shortcutsCardItem() {
  return Column(
    children: [
      Container(
        padding: EdgeInsets.symmetric(horizontal: 8),
        width: 65.w,
        height: 65.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColor.shortcutCardColor,
          borderRadius: BorderRadius.circular(10.r)
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            CachedNetworkImage(
                imageUrl: "https://firebasestorage.googleapis.com/v0/b/spotify-baae4.appspot.com/o/shortcuts%2Fpast_orders.png?alt=media&token=759ad0d7-9839-461a-bda6-caf320749176"),
            containedImage(null)
          ],
        )
      ),
      heightSpacing(8),
      SizedBox(
        width: 38.w,
        height: 32.h,
        child: Text("Past orders",
          style: AppStyles.commonBoldBlackTextStyle.copyWith(
            fontSize: 12.sp
          ),
          textAlign: TextAlign.center,
        ),
      )
    ],
  );
}

Widget containedImage(String? containedImg) {
   if(containedImg != null) {
     return CachedNetworkImage(fit: BoxFit.cover,imageUrl: containedImg);
   } else {
     return SizedBox.shrink();
   }
}









