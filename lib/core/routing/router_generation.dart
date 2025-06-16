import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nawel/features/authentication/signin/presentation/bloc/signin_bloc.dart';
import 'package:nawel/features/splash/presentation/ui/splash_screen.dart';

import '../../features/authentication/signin/presentation/ui/signin_screen.dart';
import '../../features/onboarding/presentation/ui/onboarding_screen.dart';
import '../di/service_locator.dart';
import 'app_router.dart';

class RouterGeneration {
  static GoRouter goRouter = GoRouter(
    initialLocation: AppRouter.loginScreen,
    routes: [
      GoRoute(
        path: AppRouter.splashScreen,
        name: AppRouter.splashScreen,
        builder: (context, state) => SplashScreen(),
      ),

      GoRoute(
        path: AppRouter.loginScreen,
        name: AppRouter.loginScreen,
        builder: (context, state) => BlocProvider(
            create: (context) => sl<SignInBloc>(),
          child: SignInScreen(),
        ),
      ),
    ],
  );
}
