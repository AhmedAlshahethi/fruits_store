import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_store/core/utils/app_colors.dart';
import 'package:fruits_store/core/utils/text_styles.dart';
import 'package:fruits_store/features/cart/domain/entities/cart_item_entity.dart';
import 'package:fruits_store/features/cart/presentation/cubits/cart_item_cubit.dart/cubit/cart_item_cubit.dart';

class CartItemActionButtons extends StatelessWidget {
  const CartItemActionButtons({super.key, required this.cartItemEntity});
  final CartItemEntity cartItemEntity;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ActionButton(
          color: AppColors.primaryColor,
          onTap: () {
            cartItemEntity.incrementCount();
            context.read<CartItemCubit>().updateCartItem(cartItemEntity);
          },
          icon: Icons.add,
          iconColor: Colors.white,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            cartItemEntity.count.toString(),
            style: TextStyles.bold16.copyWith(color: Color(0xff06140C)),
          ),
        ),
        ActionButton(
          color: Color(0xffF3F5F7),
          onTap: () {
            cartItemEntity.decrementCount();
            context.read<CartItemCubit>().updateCartItem(cartItemEntity);
          },
          icon: Icons.remove,
          iconColor: Colors.grey,
        ),
      ],
    );
  }
}

class ActionButton extends StatelessWidget {
  const ActionButton({
    super.key,
    required this.color,
    required this.onTap,
    required this.icon,
    required this.iconColor,
  });
  final Color color;
  final VoidCallback onTap;
  final IconData icon;
  final Color iconColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        width: 24,
        height: 24,
        padding: EdgeInsets.all(2),
        decoration: BoxDecoration(shape: BoxShape.circle, color: color),
        child: FittedBox(child: Icon(icon, color: iconColor)),
      ),
    );
  }
}
