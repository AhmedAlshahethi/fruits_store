import 'package:flutter/material.dart';
import 'package:fruits_store/core/widgets/custom_app_bar.dart';
import 'package:fruits_store/features/auth/presentation/views/signup/widgets/signup_view_body.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});
  static const String routeName = 'signup';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: 'حساب جديد'),
      body: SignupViewBody(),
    );
  }
}
