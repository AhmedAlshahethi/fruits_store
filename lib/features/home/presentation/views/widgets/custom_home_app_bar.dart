import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_store/core/utils/app_images.dart';
import 'package:fruits_store/core/utils/text_styles.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(Assets.imagesProfileImage),
      trailing: Container(
        width: 34,
        height: 34,
        padding: const EdgeInsets.all(7),
        decoration: ShapeDecoration(
          shape: OvalBorder(),
          color: Color(0xffEEF8ED),
        ),
        child: SvgPicture.asset(Assets.imagesNotifications),
      ),
      title: Text(
        'صباح الخير !..',
        style: TextStyles.regular16.copyWith(color: Color(0xff949D9E)),
      ),
      subtitle: Text(
        'أحمد مصطفي',
        style: TextStyles.bold16.copyWith(color: Color(0xff0C0D0D)),
      ),
    );
  }
}
