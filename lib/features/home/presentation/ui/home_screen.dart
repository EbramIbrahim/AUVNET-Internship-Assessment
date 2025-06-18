import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:nawel/core/widget/spacing_widget.dart';
import 'package:nawel/features/home/presentation/bloc/home_bloc.dart';
import 'package:nawel/features/home/presentation/bloc/home_event.dart';
import 'package:nawel/features/home/presentation/bloc/home_state.dart';
import 'package:nawel/features/home/presentation/widget/section_title_text_widget.dart';
import 'package:nawel/features/home/presentation/widget/slider_restaurant_item_widget.dart';

import '../../../../core/theme/app_color.dart';
import '../widget/bottom_navigation_widget.dart';
import '../widget/error_item_widget.dart';
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
      bottomNavigationBar: bottomNavigationBar(),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state.homeStatus == HomeStatus.failure) {
            return ErrorItemWidget(
              isForNetwork: true,
              description: state.errorMessage ?? "Something went wrong!",
              onRetry: () {
                context.read<HomeBloc>().add(HomeFeaturesEvent());
              },
            );
          }
          if (state.homeStatus == HomeStatus.loading) {
            return Center(
              child: CircularProgressIndicator(color: AppColor.primaryColor),
            );
          }
          if(state.homeStatus == HomeStatus.success) {
            return LiquidPullToRefresh(
              color: AppColor.primaryColor,
              showChildOpacityTransition: true,
              onRefresh: () async{
                context.read<HomeBloc>().add(HomeFeaturesEvent());
              },
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    homeHeader(),
                    heightSpacing(6),
                    sectionTitleText("Services:"),
                    heightSpacing(19),

                    SizedBox(
                      height: 140.h,
                      child: ListView.builder(
                        itemCount: state.servicesModel?.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          var services = state.servicesModel?[index];
                          return servicesCardItem(services!);
                        },
                      ),
                    ),

                    heightSpacing(19),
                    promotionCodeWidget(),

                    heightSpacing(14),
                    sectionTitleText("Shortcuts:"),

                    heightSpacing(21),
                    SizedBox(
                      height: 140.h,
                      child: ListView.builder(
                        itemCount: state.shortcutsModel?.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          var shortcuts = state.shortcutsModel?[index];
                          return shortcutsCardItem(shortcuts!);
                        },
                      ),
                    ),
                    heightSpacing(32),
                    Builder(
                      builder: (context) {
                        var promotions = state.promotionsModel;
                        return sliderRestaurantItem(
                          controller,
                          promotions!,
                          currentPage,
                        );
                      },
                    ),
                    heightSpacing(34),
                    sectionTitleText("Popular restaurants nearby"),
                    heightSpacing(16),
                    SizedBox(
                      height: 140.h,
                      child: ListView.builder(
                        itemCount: state.restaurantsModel?.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          var restaurants = state.restaurantsModel?[index];
                          return popularRestaurantNearby(restaurants!);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
