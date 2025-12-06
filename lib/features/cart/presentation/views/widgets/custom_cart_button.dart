import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_store/core/widgets/custom_button.dart';
import 'package:fruits_store/features/cart/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:fruits_store/features/cart/presentation/cubits/cart_item_cubit.dart/cubit/cart_item_cubit.dart';

class CustomCartButton extends StatelessWidget {
  const CustomCartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit, CartItemState>(
      builder: (context, state) {
        return CustomButton(
          text:
              'الدفع ${context.watch<CartCubit>().cartEntity.calculateTotalPrice()} ريال  ',
        );
      },
    );
  }
}
