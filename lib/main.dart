import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nawel/core/routing/router_generation.dart';
import 'package:nawel/features/home/data/local_service/home_local_data_source_impl.dart';

import 'core/di/service_locator.dart';
import 'core/services/hive_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveService().init();
  await HomeLocalDataSourceImpl().initDataBase();
  setupServiceLocator();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'NAWEL',
          routerConfig: RouterGeneration.goRouter,
        );
      },
    );
  }
}
