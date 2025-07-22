import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruits_store/core/utils/app_colors.dart';
import 'package:fruits_store/core/utils/text_styles.dart';

class HaveAcouunt extends StatelessWidget {
  const HaveAcouunt({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'تمتلك حساب بالفعل؟',
            style: TextStyles.semiBold16.copyWith(color: Color(0xff949D9E)),
          ),
          TextSpan(
            text: 'تسجيل الدخول',
            style: TextStyles.semiBold16.copyWith(
              color: AppColors.lightPrimaryColor,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pop(context);
              },
          ),
        ],
      ),
    );
  }
}
