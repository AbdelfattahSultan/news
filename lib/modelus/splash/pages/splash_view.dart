import 'package:flutter/material.dart';
import 'package:news/core/routes/page_routes.dart';
import 'package:news/gen/assets.gen.dart';
import 'package:news/main.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2)).then(
      (value) => navigatorKey.currentState!.pushNamedAndRemoveUntil(
        PageRoutesName.home,
        (route) => false,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Image.asset(Assets.images.group3.path),
    );
  }
}
