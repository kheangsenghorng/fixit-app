import 'package:fixit/Auth/login_sheet.dart';
import 'package:fixit/Auth/sign_up_sheet.dart';
import 'package:fixit/Home/main_screen.dart';
import 'package:fixit/OnboardingScreen/onboarding_screen.dart';
import 'package:fixit/Search/search_result_screen.dart';
import 'package:fixit/SplashScreen/splash_screen_widget.dart';
import 'package:fixit/unsupported_screen.dart';
import 'package:flutter/material.dart';
import 'app_routes.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {

      case AppRoutes.splash:
        return MaterialPageRoute(
          builder: (_) => const SplashScreenWidget(),
        );

      case AppRoutes.onboarding:
        return MaterialPageRoute(
          builder: (_) => const OnboardingScreen(),
        );

      case AppRoutes.login:
        return MaterialPageRoute(
          builder: (_) => const LoginSheet(),
        );

      case AppRoutes.signup:
        return MaterialPageRoute(
          builder: (_) => const SignUpSheet(),
        );
      // case AppRoutes.home:
      //   return MaterialPageRoute(
      //     builder: (_) => const HomeScreen(),
      //   );
        case AppRoutes.main:
        return MaterialPageRoute(
          builder: (_) => const MainScreen(),
        );

      case AppRoutes.unsupported:
        return MaterialPageRoute(
          builder: (_) => const UnsupportedScreen(),
        );

      case AppRoutes.search:
      return MaterialPageRoute(
        builder: (_) => const SearchResultScreen(),
      );

      case AppRoutes.searchResult:
      return MaterialPageRoute(
        builder: (_) => const MainScreen(),
      );

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Route not found')),
          ),
        );
    }
  }
}
