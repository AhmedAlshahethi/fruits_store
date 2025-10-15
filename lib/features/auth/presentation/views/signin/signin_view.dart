import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_store/core/services/get_it_service.dart';
import 'package:fruits_store/core/widgets/custom_app_bar.dart';
import 'package:fruits_store/features/auth/domain/repos/auth_repor.dart';
import 'package:fruits_store/features/auth/presentation/cubits/signin_cubit/sigin_cubit.dart';
import 'package:fruits_store/features/auth/presentation/views/signin/widgets/signin_view_body_bloc_consumer.dart';

class SigninView extends StatelessWidget {
  const SigninView({super.key});
  static const String routeName = 'signin';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SiginCubit(getIt<AuthRepo>()),
      child: Scaffold(
        appBar: buildAppBar(context, title: 'تسجيل دخول'),
        body: SigninViewBodyBlocConsumer(),
      ),
    );
  }
}
