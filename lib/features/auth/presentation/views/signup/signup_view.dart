import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_store/core/services/get_it_service.dart';
import 'package:fruits_store/core/widgets/custom_app_bar.dart';
import 'package:fruits_store/features/auth/domain/repos/auth_repor.dart';
import 'package:fruits_store/features/auth/presentation/cubits/signup_cubit/signup_cubit.dart';
import 'package:fruits_store/features/auth/presentation/views/signup/widgets/signup_view_body_bloc_consumer.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});
  static const String routeName = 'signup';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(getIt<AuthRepo>()),
      child: Scaffold(
        appBar: buildAppBar(context, title: 'حساب جديد'),
        body: SignupViewBodyBlocConsumer(),
      ),
    );
  }
}
