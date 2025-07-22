import 'package:flutter/material.dart';
import 'package:fruits_store/core/utils/app_colors.dart';
import 'package:fruits_store/core/utils/app_images.dart';
import 'package:fruits_store/core/utils/text_styles.dart';
import 'package:fruits_store/core/widgets/custom_button.dart';
import 'package:fruits_store/core/widgets/custom_text_form_field.dart';
import 'package:fruits_store/features/auth/presentation/views/login/widgets/do_not_have_acouunt.dart';
import 'package:fruits_store/features/auth/presentation/views/widgets/or_divider.dart';
import 'package:fruits_store/features/auth/presentation/views/widgets/social_login_button.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(height: 24),
            CustomTextFormField(
              hintText: 'البريد الإلكتروني',
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16),
            CustomTextFormField(
              hintText: 'كلمة المرور',
              keyboardType: TextInputType.visiblePassword,
              suffixIcon: IconButton(
                onPressed: () {},
                icon: Icon(Icons.remove_red_eye, color: Color(0xffC9CECF)),
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'نسيت كلمة المرور؟',
                  style: TextStyles.semiBold13.copyWith(
                    color: AppColors.lightPrimaryColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: 32),
            CustomButton(text: 'تسجيل دخول', onPressed: () {}),
            SizedBox(height: 32),
            DoNotHaveAccount(),
            SizedBox(height: 16),
            OrDivider(),
            SizedBox(height: 16),
            SocialLoginButton(
              icon: Assets.imagesGoogle,
              title: 'تسجيل بواسطة جوجل',
            ),
            SizedBox(height: 16),
            SocialLoginButton(
              icon: Assets.imagesApple,
              title: 'تسجيل بواسطة جوجل',
            ),
            SizedBox(height: 16),
            SocialLoginButton(
              icon: Assets.imagesFacebook,
              title: 'تسجيل بواسطة جوجل',
            ),
          ],
        ),
      ),
    );
  }
}
