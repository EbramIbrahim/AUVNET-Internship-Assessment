import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:nawel/core/assets/image_assets.dart';
import 'package:nawel/core/routing/app_router.dart';
import 'package:nawel/core/theme/app_color.dart';
import 'package:nawel/core/theme/app_text_style.dart';
import 'package:nawel/core/widget/spacing_widget.dart';
import 'package:nawel/features/onboarding/data/model/onboarding_items.dart';
import 'package:nawel/features/onboarding/presentation/bloc/onboarding_bloc.dart';
import 'package:nawel/features/onboarding/presentation/bloc/onboarding_state.dart';
import '../../../../core/widget/custom_animated_snackbar.dart';
import '../../../../core/widget/primary_button_widget.dart';
import '../bloc/onboarding_event.dart';
import '../widget/onboarding_widget.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final pageController = PageController();

  final onboardingItems = OnBoardingItems.getItems();

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: BlocListener<OnboardingBloc, OnboardingState>(
        listener: (_, state) {
          if (state.onboardingStatus == OnboardingStatus.failure) {
            showAnimatedSnackDialog(
              context,
              message: state.errorMessage!,
              type: AnimatedSnackBarType.error,
            );
          }
          if (state.onboardingStatus == OnboardingStatus.success) {
            showAnimatedSnackDialog(
              context,
              message: state.errorMessage!,
              type: AnimatedSnackBarType.success,
            );
            GoRouter.of(
              context,
            ).pushReplacementNamed(AppRouter.loginScreen);
          }
        },
        child: Column(
          children: [
            onboardingTopSection(context),
            heightSpacing(85),
            Expanded(
              child: SizedBox(
                width: 289.w,
                child: PageView.builder(
                  onPageChanged: (value) {
                    setState(() {
                      currentIndex = value;
                    });
                  },
                  itemCount: onboardingItems.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        onboardingText(
                          onboardingItems[currentIndex].title,
                          AppStyles.primaryTextStyle,
                        ),
                        heightSpacing(11),
                        onboardingText(
                          onboardingItems[currentIndex].description,
                          AppStyles.secondaryTextStyle.copyWith(fontSize: 14.sp),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
            heightSpacing(38),
            Expanded(
              child: Stack(
                children:[Container(
                  alignment: Alignment.topRight,
                  decoration: BoxDecoration(
                  ), child: Image.asset(ImageAssets.bgImg,)
                ),
                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        PrimaryButtonWidget(
                          onPress: () {
                            context.read<OnboardingBloc>().add(
                              CompleteOnboarding(),
                            );
                          },
                          buttonText: "Get Started",
                        ),
                        heightSpacing(14),
                        InkWell(
                          onTap: () {
                            setState(() {
                              currentIndex != onboardingItems.length - 1
                                  ? currentIndex++
                                  : null;
                            });
                          },
                          child: onboardingText(
                            "next",
                            AppStyles.secondaryTextStyle.copyWith(fontSize: 14.sp),
                          ),
                        ),
                      ],
                    ),
                  ),
              ]
              ),
            ),
          ],
        ),
      ),
    );
  }
}
