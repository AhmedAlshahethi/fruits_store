import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_store/core/helper_functions/build_error_bar.dart';
import 'package:fruits_store/core/widgets/custom_button.dart';
import 'package:fruits_store/core/widgets/custom_password_field.dart';
import 'package:fruits_store/core/widgets/custom_text_form_field.dart';
import 'package:fruits_store/features/auth/presentation/cubits/signup_cubit/signup_cubit.dart';
import 'package:fruits_store/features/auth/presentation/views/signup/widgets/have_acouunt.dart';
import 'package:fruits_store/features/auth/presentation/views/signup/widgets/terms_and_conditions.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String email, password, name;
  late bool isTermsAccepted = false;
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
                hintText: 'الاسم كامل',
                keyboardType: TextInputType.emailAddress,
                onSaved: (value) {
                  name = value!;
                },
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                hintText: 'البريد الإلكتروني',
                keyboardType: TextInputType.emailAddress,
                onSaved: (value) {
                  email = value!;
                },
              ),
              SizedBox(height: 16),
              CustomPasswordField(
                onSaved: (value) {
                  password = value!;
                },
              ),
              SizedBox(height: 16),
              TermsAndConditions(
                onChanged: (value) {
                  isTermsAccepted = value;
                },
              ),
              const SizedBox(height: 30),
              CustomButton(
                text: 'إنشاء حساب جديد',
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    if (isTermsAccepted) {
                      context
                          .read<SignupCubit>()
                          .createUserWithEmailAndPassword(
                            email: email,
                            password: password,
                            name: name,
                          );
                    } else {
                      buildErrorBar(
                        context,
                        'يجب الموافقة على الشروط والأحكام',
                      );
                    }
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
              ),
              SizedBox(height: 30),
              HaveAcouunt(),
            ],
          ),
        ),
      ),
    );
  }
}
