import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nawel/core/theme/app_color.dart';

class PrimaryButtonWidget extends StatelessWidget {
  final Color? buttonColor;
  final double? width;
  final double? height;
  final double? fontSize;
  final String? buttonText;
  final Color? textColor;
  final double? borderRadius;
  final void Function()? onPress;

  const PrimaryButtonWidget({
    super.key,
    this.buttonColor,
    this.buttonText,
    this.textColor,
    this.borderRadius,
    this.onPress,
    this.width,
    this.height,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor ?? AppColor.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 10),
        ),
        fixedSize: Size(width ?? 295.w, height ?? 54.h),
      ),
      child: Text(
        buttonText ?? "",
        style: TextStyle(color: textColor ?? Colors.white, fontSize: fontSize ?? 18.sp),
      ),
    );
  }
}