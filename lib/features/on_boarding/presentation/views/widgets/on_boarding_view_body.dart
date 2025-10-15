import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fruits_store/constants.dart';
import 'package:fruits_store/core/services/shared_preferences_singleton.dart';
import 'package:fruits_store/core/utils/app_colors.dart';
import 'package:fruits_store/core/widgets/custom_button.dart';
import 'package:fruits_store/features/auth/presentation/views/signin/signin_view.dart';
import 'package:fruits_store/features/on_boarding/presentation/views/widgets/on_boarding_page_view.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  late PageController pageController;
  var currentPage = 0;
  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      currentPage = pageController.page!.round();
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: OnBoardingPageView(pageController: pageController)),
        DotsIndicator(
          dotsCount: 2,
          decorator: DotsDecorator(
            activeColor: AppColors.primaryColor,
            color: Color(0xff5DB957),
          ),
        ),
        SizedBox(height: 28),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
          child: CustomButton(
            text: 'ابدأ الآن',
            onPressed: () {
              Prefs.setBool(kIsOnBordingViewSeen, true);
              Navigator.of(context).pushReplacementNamed(SigninView.routeName);
            },
          ),
        ),
        SizedBox(height: 43),
      ],
    );
  }
}
