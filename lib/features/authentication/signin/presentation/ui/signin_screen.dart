import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:nawel/core/assets/image_assets.dart';
import 'package:nawel/core/theme/app_color.dart';
import 'package:nawel/core/widget/primary_button_widget.dart';
import 'package:nawel/core/widget/primary_text_field_widget.dart';
import 'package:nawel/features/authentication/signin/presentation/bloc/signin_bloc.dart';
import 'package:nawel/features/authentication/signin/presentation/bloc/signin_event.dart';
import 'package:nawel/features/authentication/signin/presentation/bloc/signin_state.dart';

import '../../../../../core/helpers/validator.dart';
import '../../../../../core/routing/app_router.dart';
import '../../../../../core/widget/custom_animated_snackbar.dart';
import '../../../../../core/widget/spacing_widget.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
                BlocConsumer<SignInBloc, SignInState>(
                  builder: (context, state) {
                    if (state.loginStatus == LoginStatus.loading) {
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
                          heightSpacing(18.h),
                          PrimaryTextFieldWidget(
                            preffixIcon: Image.asset(ImageAssets.passwordImg),
                            hintText: "password",
                            isPassword: true,
                            controller: passwordController,
                            validator: (value) {
                              return passwordValidator(value);
                            }
                          ),
                        ],
                      ),
                    );
                  },
                  listener: (context, state) {
                    if (state.loginStatus == LoginStatus.failure) {
                      showAnimatedSnackDialog(
                        context,
                        message: state.errorMessage!,
                        type: AnimatedSnackBarType.error,
                      );
                    }
                    if (state.loginStatus == LoginStatus.success) {
                      showAnimatedSnackDialog(
                        context,
                        message: state.data!,
                        type: AnimatedSnackBarType.success,
                      );
                      GoRouter.of(context).pushReplacementNamed(AppRouter.homeScreen);
                    }
                  },
                ),
                heightSpacing(18.h),
                PrimaryButtonWidget(
                  onPress: () {
                    if (formKey.currentState!.validate()) {
                      context.read<SignInBloc>().add(
                        SignInRequired(
                          emailController.text,
                          passwordController.text,
                        ),
                      );
                    }
                  },
                  buttonText: "Log in",
                  width: 343.w,
                  fontSize: 14.sp,
                ),
                heightSpacing(16.h),
                InkWell(
                  onTap: () {
                    GoRouter.of(context).pushNamed(AppRouter.registerScreen);
                  },
                  child: Text(
                    "Create an account",
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
