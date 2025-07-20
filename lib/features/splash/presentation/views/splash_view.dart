import 'package:flutter/material.dart';
import 'package:fruits_store/features/splash/presentation/views/widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});
  static const routeName = 'splah';
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SplashViewBody());
  }
}
