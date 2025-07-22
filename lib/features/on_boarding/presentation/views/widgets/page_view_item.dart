import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_store/constants.dart';
import 'package:fruits_store/core/services/shared_preferences_singleton.dart';
import 'package:fruits_store/core/utils/text_styles.dart';
import 'package:fruits_store/features/auth/presentation/views/login/login_view.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.image,
    required this.backgroundImage,
    required this.subtitle,
    required this.title,
    required this.isvisible,
  });
  final String image, backgroundImage, subtitle;
  final Widget title;
  final bool isvisible;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.5,
          child: Stack(
            children: [
              Positioned.fill(
                child: SvgPicture.asset(backgroundImage, fit: BoxFit.fill),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: SvgPicture.asset(image),
              ),
              Visibility(
                visible: isvisible,
                child: GestureDetector(
                  onTap: () {
                    Prefs.setBool(kIsOnBordingViewSeen, true);
                    Navigator.of(
                      context,
                    ).pushReplacementNamed(LoginView.routeName);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'تخط',
                      style: TextStyles.regular13.copyWith(
                        color: Color(0xff949D9E),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 64),
        title,
        SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 37),
          child: Text(
            subtitle,
            style: TextStyles.semiBold13.copyWith(color: Color(0xff4E5556)),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
