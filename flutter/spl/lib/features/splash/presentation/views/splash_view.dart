import 'package:flutter/material.dart';
import 'package:spl/features/splash/presentation/views/widgets/custom_splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: CustomSplashViewBody());
  }
}
