
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nawel/core/theme/app_text_style.dart';

Widget sectionTitleText(String title) {
  return  Padding(
    padding: EdgeInsets.only(left: 19.r),
    child: Text(
      title,
      style: AppStyles.commonBoldBlackTextStyle,
    ),
  );
}