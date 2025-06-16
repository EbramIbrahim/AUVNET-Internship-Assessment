import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:nawel/core/assets/image_assets.dart';
import 'package:nawel/core/routing/app_router.dart';
import 'package:nawel/core/theme/app_color.dart';
import 'package:nawel/core/widget/primary_button_widget.dart';
import 'package:nawel/core/widget/primary_text_field_widget.dart';
import 'package:nawel/features/authentication/signup/presentation/bloc/signup_event.dart';
import 'package:nawel/features/authentication/signup/presentation/bloc/signup_state.dart';

import '../../../../../core/helpers/validator.dart';
import '../../../../../core/widget/custom_animated_snackbar.dart';
import '../../../../../core/widget/spacing_widget.dart';
import '../bloc/signup_bloc.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignupScreen> {
  final formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        height: double.infinity,
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                heightSpacing(83.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Image.asset(ImageAssets.logoImg),
                ),
                BlocConsumer<SignUpBloc, SignUpState>(
                  builder: (context, state) {
                    if (state.signUpStatus == SignUpStatus.loading) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: AppColor.primaryColor,
                        ),
                      );
                    }
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 37),
                      child: Column(
                        children: [
                          PrimaryTextFieldWidget(
                            preffixIcon: Image.asset(ImageAssets.emailImg),
                            hintText: "mail",
                            controller: emailController,
                            validator: (value) {
                              return emailValidator(value);
                            },
                          ),
                          heightSpacing(7.h),
                          PrimaryTextFieldWidget(
                            preffixIcon: Image.asset(ImageAssets.passwordImg),
                            hintText: "password",
                            controller: passwordController,
                            isPassword: true,
                          ),
                          heightSpacing(7.h),
                          PrimaryTextFieldWidget(
                            preffixIcon: Image.asset(ImageAssets.passwordImg),
                            hintText: "confirm password",
                            controller: confirmPasswordController,
                            isPassword: true,
                          ),
                        ],
                      ),
                    );
                  },
                  listener: (context, state) {
                    if (state.signUpStatus == SignUpStatus.failure) {
                      showAnimatedSnackDialog(
                        context,
                        message: state.errorMessage!,
                        type: AnimatedSnackBarType.error,
                      );
                    }
                    if (state.signUpStatus == SignUpStatus.success) {
                      showAnimatedSnackDialog(
                        context,
                        message: state.data!,
                        type: AnimatedSnackBarType.success,
                      );
                    }
                  },
                ),
                heightSpacing(18.h),
                PrimaryButtonWidget(
                  onPress: () {
                    if (formKey.currentState!.validate()) {
                      context.read<SignUpBloc>().add(
                        SignUpRequired(
                          emailController.text,
                          passwordController.text,
                        ),
                      );
                    }
                  },
                  buttonText: "Sign up",
                  width: 343.w,
                  fontSize: 14.sp,
                ),
                heightSpacing(16.h),
                InkWell(
                  onTap: () {
                    GoRouter.of(context).pushNamed(AppRouter.loginScreen);
                  },
                  child: Text(
                    "have an account, Log In",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff1877F2),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
