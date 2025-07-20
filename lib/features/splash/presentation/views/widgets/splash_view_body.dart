import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_store/constants.dart';
import 'package:fruits_store/core/services/shared_preferences_singleton.dart';
import 'package:fruits_store/core/utils/app_images.dart';
import 'package:fruits_store/features/auth/presentation/views/login_view.dart';
import 'package:fruits_store/features/on_boarding/presentation/views/on_boarding_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    excuteNavigation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [SvgPicture.asset(Assets.imagesPlant)],
        ),
        SvgPicture.asset(Assets.imagesLogo),
        SvgPicture.asset(Assets.imagesSplashBottom, fit: BoxFit.fill),
      ],
    );
  }

  void excuteNavigation() {
    bool isOnBoardingViewSeen = Prefs.getBool(kIsOnBordingViewSeen);
    Future.delayed(const Duration(seconds: 3), () {
      if (isOnBoardingViewSeen) {
        // ignore: use_build_context_synchronously
        Navigator.of(context).pushReplacementNamed(LoginView.routeName);
      } else {
        // ignore: use_build_context_synchronously
        Navigator.of(context).pushReplacementNamed(OnBoardingView.routeName);
      }
    });
  }
}
