import 'package:flutter/material.dart';
import 'package:news/core/routes/page_routes.dart';
import 'package:news/modelus/home/pages/home.dart';
import 'package:news/modelus/splash/pages/splash_view.dart';

abstract class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PageRoutesName.initial:
        return MaterialPageRoute(builder: (_) => SplashView());
      case PageRoutesName.home:
        return MaterialPageRoute(builder: (_) => Home());

      default:
        return MaterialPageRoute(builder: (_) => SplashView());
    }
  }
}
