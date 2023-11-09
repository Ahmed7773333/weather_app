import 'package:flutter/material.dart';
import 'package:weather_app/features/splach/presentation/pages/splach_screen.dart';

import '../core/utils/app_strings.dart';
import '../core/utils/app_styles.dart';
import '../features/home/presentation/pages/home.dart';

class Routes {
  static const String splach = '/';
  static const String home = 'home';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splach:
        return MaterialPageRoute(builder: (_) => const SplachScreen());
      case Routes.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        return unDefinedScreen();
    }
  }

  static Route<dynamic> unDefinedScreen() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: Text(
                  AppStrings.noRoute,
                  style: AppStyles.dropDownStyle,
                ),
              ),
              body: Center(
                child: Text(
                  AppStrings.noRoute,
                  style: AppStyles.dropDownStyle,
                ),
              ),
            ));
  }
}
