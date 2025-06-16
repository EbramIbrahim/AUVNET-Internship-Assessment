import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nawel/core/theme/app_color.dart';
import 'package:nawel/core/theme/app_text_style.dart';
import 'package:nawel/core/widget/spacing_widget.dart';
import 'package:nawel/features/onboarding/data/model/onboarding_items.dart';
import '../../../../core/widget/primary_button_widget.dart';
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
      body: Column(
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
                    return
                       Column(
                        children: [
                          onboardingText(
                              onboardingItems[currentIndex].title,
                              AppStyles.primaryTextStyle
                          ),
                          heightSpacing(11),
                          onboardingText(
                              onboardingItems[currentIndex].description,
                              AppStyles.secondaryTextStyle.copyWith(fontSize: 14.sp,)
                          )
                        ],
                    );
                  },

              ),
            ),
          ),
          heightSpacing(52),
          Expanded(
            child: Stack(
              children: [
                // Container(
                //   width: 216,
                //   decoration: BoxDecoration(
                //     gradient: LinearGradient(
                //       begin: Alignment.bottomRight,
                //       colors: [
                //          AppColor.lightGreen,
                //         AppColor.lightGreen.withValues(alpha: 0.3),
                //
                //       ],
                //     ),
                //   ),
                // ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    PrimaryButtonWidget(
                      onPress: (){},
                      buttonText: "Get Started",
                    ),
                    heightSpacing(14),
                    InkWell(
                      onTap: () {
                        setState(() {
                          currentIndex != onboardingItems.length -1? currentIndex++ : null;
                        });
                      },
                        child: onboardingText("next", AppStyles.secondaryTextStyle.copyWith(fontSize: 14.sp,))
                    )
                  ],
                ),

              ],
            ),
          )
        ],
      ),
    );
  }
}
