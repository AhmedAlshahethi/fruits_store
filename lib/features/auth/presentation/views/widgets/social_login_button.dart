import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_store/core/utils/text_styles.dart';

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton({
    super.key,
    this.onPressed,
    required this.icon,
    required this.title,
  });
  final VoidCallback? onPressed;
  final String icon, title;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,

      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 18, horizontal: 18),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(width: 1, color: Color(0xffDDDFDF)),
          ),
        ),
        onPressed: onPressed,
        child: ListTile(
          visualDensity: VisualDensity(vertical: VisualDensity.minimumDensity),
          leading: SvgPicture.asset(icon),
          title: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyles.semiBold16,
          ),
        ),
      ),
    );
  }
}
