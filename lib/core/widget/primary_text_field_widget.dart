import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nawel/core/theme/app_color.dart';
import 'package:nawel/core/theme/app_text_style.dart';

class PrimaryTextFieldWidget extends StatelessWidget {
  final String? hintText;
  final double? width;
  final Widget? suffixIcon;
  final Widget? preffixIcon;
  final bool? isPassword;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const PrimaryTextFieldWidget({
    super.key,
    this.hintText,
    this.width,
    this.suffixIcon,
    this.preffixIcon,
    this.isPassword,
    this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 300.w,
      child: TextFormField(
        controller: controller,
        validator: validator,
        autofocus: false,
        cursorColor: AppColor.primaryColor,
        obscureText: isPassword ?? false,
        decoration: InputDecoration(
          hintText: hintText ?? "",
          hintStyle: AppStyles.secondaryTextStyle.copyWith(
            fontSize: 14.sp,
            color: Color(0xff000000),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 17.w),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(color: AppColor.textFieldStroke, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(color: AppColor.textFieldFill, width: 1),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(color: Colors.red, width: 1),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(color: Colors.red, width: 1),
          ),
          filled: true,
          fillColor: AppColor.textFieldFill,
          suffixIcon: suffixIcon,
          prefixIcon: preffixIcon,
        ),
      ),
    );
  }
}
