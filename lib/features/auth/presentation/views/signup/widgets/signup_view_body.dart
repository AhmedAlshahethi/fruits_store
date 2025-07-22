import 'package:flutter/material.dart';
import 'package:fruits_store/core/widgets/custom_button.dart';
import 'package:fruits_store/core/widgets/custom_text_form_field.dart';
import 'package:fruits_store/features/auth/presentation/views/signup/widgets/have_acouunt.dart';
import 'package:fruits_store/features/auth/presentation/views/signup/widgets/terms_and_conditions.dart';

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(height: 24),
            CustomTextFormField(
              hintText: 'الاسم كامل',
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16),
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
            TermsAndConditions(),
            SizedBox(height: 30),
            CustomButton(text: 'إنشاء حساب جديد', onPressed: () {}),
            SizedBox(height: 30),
            HaveAcouunt(),
          ],
        ),
      ),
    );
  }
}
