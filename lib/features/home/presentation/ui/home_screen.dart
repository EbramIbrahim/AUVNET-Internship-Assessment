import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:nawel/core/widget/spacing_widget.dart';
import 'package:nawel/features/home/data/model/promotions.dart';
import 'package:nawel/features/home/presentation/widget/section_title_text_widget.dart';
import 'package:nawel/features/home/presentation/widget/slider_restaurant_item_widget.dart';

import '../../../../core/theme/app_color.dart';
import '../widget/home_header_widget.dart';
import '../widget/popular_nearby_restaurant_section_widget.dart';
import '../widget/promotion_code_widget.dart';
import '../widget/services_card_item_widget.dart';
import '../widget/shortcuts_card_item_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CarouselSliderController controller = CarouselSliderController();
  double currentPage = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            homeHeader(),
            heightSpacing(6),
            sectionTitleText("Services:"),
            heightSpacing(19),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    servicesCardItem(),
                    servicesCardItem(),
                    servicesCardItem(),
                  ],
                ),
              ),
            ),
            heightSpacing(19),
            promotionCodeWidget(),
            heightSpacing(14),
            sectionTitleText("Shortcuts:"),

            heightSpacing(21),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    shortcutsCardItem(),
                    shortcutsCardItem(),
                    shortcutsCardItem(),
                    shortcutsCardItem(),
                    shortcutsCardItem(),
                  ],
                ),
              ),
            ),
            heightSpacing(32),
            sliderRestaurantItem(
                controller,
                [PromotionsModel(
                image:
                    "https://firebasestorage.googleapis.com/v0/b/spotify-baae4.appspot.com/o/promo%2Fpromo.png?alt=media&token=d43f85ca-88a8-422c-a4f1-a21cb214f518",
              ),
            ], currentPage
            ),
            heightSpacing(34),
            sectionTitleText("Popular restaurants nearby"),
            heightSpacing(16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    popularRestaurantNearby(),
                    popularRestaurantNearby(),
                    popularRestaurantNearby(),
                    popularRestaurantNearby(),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
