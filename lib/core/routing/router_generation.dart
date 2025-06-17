import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nawel/features/authentication/signin/presentation/bloc/signin_bloc.dart';
import 'package:nawel/features/authentication/signup/presentation/bloc/signup_bloc.dart';
import 'package:nawel/features/authentication/signup/presentation/ui/signup_screen.dart';
import 'package:nawel/features/authentication/splash/presentation/bloc/splash_bloc.dart';
import 'package:nawel/features/home/presentation/bloc/home_bloc.dart';
import 'package:nawel/features/home/presentation/bloc/home_event.dart';
import 'package:nawel/features/onboarding/presentation/bloc/onboarding_bloc.dart';
import 'package:nawel/features/onboarding/presentation/ui/onboarding_screen.dart';
import '../../features/authentication/signin/presentation/ui/signin_screen.dart';
import '../../features/authentication/splash/presentation/bloc/splash_event.dart';
import '../../features/authentication/splash/presentation/ui/splash_screen.dart';
import '../../features/home/presentation/ui/home_screen.dart';
import '../di/service_locator.dart';
import 'app_router.dart';

class RouterGeneration {
  static GoRouter goRouter = GoRouter(
    initialLocation: AppRouter.homeScreen,
    routes: [
      GoRoute(
        path: AppRouter.splashScreen,
        name: AppRouter.splashScreen,
        builder: (context, state) => BlocProvider(
          create: (context) => sl<SplashBloc>()..add(CheckAuthentication()),
          child: SplashScreen(),
        ),
      ),

      GoRoute(
        path: AppRouter.onBoardingScreen,
        name: AppRouter.onBoardingScreen,
        builder: (context, state) => BlocProvider(
          create: (context) => sl<OnboardingBloc>(),
          child: OnboardingScreen(),
        ),
      ),

      GoRoute(
        path: AppRouter.loginScreen,
        name: AppRouter.loginScreen,
        builder: (context, state) => BlocProvider(
            create: (context) => sl<SignInBloc>(),
          child: SignInScreen(),
        ),
      ),
      GoRoute(
        path: AppRouter.registerScreen,
        name: AppRouter.registerScreen,
        builder: (context, state) => BlocProvider(
          create: (context) => sl<SignUpBloc>(),
          child: SignupScreen(),
        ),
      ),
      GoRoute(
        path: AppRouter.homeScreen,
        name: AppRouter.homeScreen,
        builder: (context, state) => BlocProvider(
          create: (context) => sl<HomeBloc>()..add(HomeFeaturesEvent()),
          child: HomeScreen(),
        ),
      ),
    ],
  );
}
