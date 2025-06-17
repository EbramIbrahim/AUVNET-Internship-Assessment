import 'dart:developer';

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nawel/core/assets/image_assets.dart';
import 'package:nawel/core/routing/app_router.dart';
import 'package:nawel/core/theme/app_color.dart';
import 'package:nawel/features/authentication/splash/presentation/bloc/splash_bloc.dart';
import 'package:nawel/features/authentication/splash/presentation/bloc/splash_state.dart';

import '../../../../../core/widget/custom_animated_snackbar.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBloc, SplashState>(
      listener: (context, state) {
        if(state.splashStatus == SplashStatus.unAuthenticated) {
          log(state.splashStatus.toString());
          GoRouter.of(context).pushReplacementNamed(AppRouter.loginScreen);
        }
        if(state.splashStatus == SplashStatus.authenticated) {
          log(state.splashStatus.toString());
          GoRouter.of(context).pushReplacementNamed(AppRouter.homeScreen);
        }
        if(state.splashStatus == SplashStatus.isFirstTime) {
          log(state.splashStatus.toString());
          GoRouter.of(context).pushReplacementNamed(AppRouter.onBoardingScreen);
        }
        if(state.splashStatus == SplashStatus.failure) {
          showAnimatedSnackDialog(
            context,
            message: state.errorMessage!,
            type: AnimatedSnackBarType.error,
          );
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColor.white,
        ),
        child: Center(
          child: Image.asset(ImageAssets.logoImg),
        ),
      ),
    );
  }
}
