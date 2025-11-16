import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_store/core/helper_functions/build_error_bar.dart';
import 'package:fruits_store/core/widgets/custom_progress_hud.dart';
import 'package:fruits_store/features/auth/presentation/cubits/signin_cubit/sigin_cubit.dart';
import 'package:fruits_store/features/auth/presentation/views/signin/widgets/signin_view_body.dart';
import 'package:fruits_store/features/home/presentation/views/main_view.dart';

class SigninViewBodyBlocConsumer extends StatelessWidget {
  const SigninViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SiginCubit, SiginState>(
      listener: (context, state) {
        if (state is SiginSuccess) {
          Navigator.pushNamed(context, MainView.routeName);
        }
        if (state is SiginFailure) {
          buildErrorBar(context, state.message);
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
          isLoading: state is SiginLoading,
          child: SigninViewBody(),
        );
      },
    );
  }
}
