import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_store/core/helper_functions/build_error_bar.dart';
import 'package:fruits_store/features/cart/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:fruits_store/features/home/presentation/views/widgets/main_view_body.dart';

class MainViewBodyListener extends StatelessWidget {
  const MainViewBodyListener({super.key, required this.currentViewIndex});

  final int currentViewIndex;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
      listener: (context, state) {
        if (state is CartItemAdded) {
          buildErrorBar(context, 'تم إضافة المنتج إلى السلة بنجاح');
        }

        if (state is CartItemRemoved) {
          buildErrorBar(context, 'تم إزالة المنتج من السلة بنجاح');
        }
      },
      child: MainViewBody(currentViewIndex: currentViewIndex),
    );
  }
}
