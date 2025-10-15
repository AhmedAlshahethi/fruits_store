import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_store/core/utils/app_colors.dart';
import 'package:fruits_store/core/utils/app_images.dart';
import 'package:fruits_store/core/utils/text_styles.dart';
import 'package:fruits_store/core/widgets/custom_button.dart';
import 'package:fruits_store/core/widgets/custom_password_field.dart';
import 'package:fruits_store/core/widgets/custom_text_form_field.dart';
import 'package:fruits_store/features/auth/presentation/cubits/signin_cubit/sigin_cubit.dart';
import 'package:fruits_store/features/auth/presentation/views/signin/widgets/do_not_have_acouunt.dart';
import 'package:fruits_store/features/auth/presentation/views/widgets/or_divider.dart';
import 'package:fruits_store/features/auth/presentation/views/widgets/social_login_button.dart';

class SigninViewBody extends StatefulWidget {
  const SigninViewBody({super.key});

  @override
  State<SigninViewBody> createState() => _SigninViewBodyState();
}

class _SigninViewBodyState extends State<SigninViewBody> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String email, password;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              SizedBox(height: 24),
              CustomTextFormField(
                onSaved: (value) {
                  email = value!;
                },
                hintText: 'البريد الإلكتروني',
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 16),
              CustomPasswordField(
                onSaved: (value) {
                  password = value!;
                },
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
              CustomButton(
                text: 'تسجيل دخول',
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    context.read<SiginCubit>().signInWithEmailAndPassword(
                      email: email,
                      password: password,
                    );
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              ),
              SizedBox(height: 32),
              DoNotHaveAccount(),
              SizedBox(height: 16),
              OrDivider(),
              SizedBox(height: 16),
              SocialLoginButton(
                onPressed: () {
                  context.read<SiginCubit>().signinwithGoogle();
                },
                icon: Assets.imagesGoogle,
                title: 'تسجيل بواسطة جوجل',
              ),
              SizedBox(height: 16),
              Platform.isIOS
                  ? Column(
                      children: [
                        SocialLoginButton(
                          icon: Assets.imagesApple,
                          title: 'تسجيل بواسطة ابل',
                        ),
                        SizedBox(height: 16),
                      ],
                    )
                  : SizedBox(),
              SocialLoginButton(
                onPressed: () {
                  context.read<SiginCubit>().signinWithFacebook();
                },
                icon: Assets.imagesFacebook,
                title: 'تسجيل بواسطة فيسبوك',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
