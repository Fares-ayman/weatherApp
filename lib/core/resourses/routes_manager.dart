import 'package:flutter/material.dart';
import 'package:weather_app_gst/modules/home/presentation/pages/home_screen.dart';

class AppRoutesName {
  static const String home = "/home";
}

class AppRoute {
  // ignore: body_might_complete_normally_nullable
  static Route<dynamic>? generate(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutesName.home:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => const HomeScreen(),
          transitionDuration: const Duration(milliseconds: 300),
          transitionsBuilder: (_, animation, __, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );
    }
  }
}
