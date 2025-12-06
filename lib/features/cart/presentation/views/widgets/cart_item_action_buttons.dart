import 'package:flutter/material.dart';
import 'package:fruits_store/core/utils/app_colors.dart';

class CartItemActionButtons extends StatelessWidget {
  const CartItemActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ActionButton(
          color: AppColors.primaryColor,
          onTap: () {},
          icon: Icons.add,
          iconColor: Colors.white,
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
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
      child: Icon(icon, color: iconColor),
    );
  }
}
