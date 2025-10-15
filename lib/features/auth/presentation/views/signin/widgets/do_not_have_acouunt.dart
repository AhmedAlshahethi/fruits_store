import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruits_store/core/utils/text_styles.dart';
import 'package:fruits_store/features/auth/presentation/views/signup/signup_view.dart';

class DoNotHaveAccount extends StatelessWidget {
  const DoNotHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'لا تمتلك حساب؟ ',
            style: TextStyles.semiBold16.copyWith(color: Color(0xff949D9E)),
          ),
          TextSpan(
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pushNamed(context, SignupView.routeName);
              },
            text: 'قم بانشاء حساب',
            style: TextStyles.semiBold16.copyWith(color: Color(0xff1B5E37)),
          ),
        ],
      ),
    );
  }
}
