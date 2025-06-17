
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nawel/features/home/data/model/promotions.dart';
import 'package:nawel/features/home/presentation/bloc/home_bloc.dart';
import 'package:nawel/features/home/presentation/bloc/home_state.dart';

import '../../../../core/theme/app_color.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: BlocListener<HomeBloc, HomeState>(
          listener: (context,state) {
            if(state.homeStatus == HomeStatus.failure) {
              log(state.errorMessage.toString());
            }
            if(state.homeStatus == HomeStatus.success) {
              List<PromotionsModel> list = state.data;
              for(var i in list) {
                print(i.image.toString());
              }
            }
          },
        child: const Text("Welcome Home"),
      ),
    );
  }
}
