import 'package:flutter/material.dart';
import 'package:fruits_store/core/widgets/custom_app_bar.dart';
import 'package:fruits_store/features/cart/presentation/views/widgets/cart_header.dart';
import 'package:fruits_store/features/cart/presentation/views/widgets/cart_item.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              SizedBox(height: 16),
              buildAppBar(
                context,
                title: 'السلة',
                showBackButton: false,
                showNotificationIcon: false,
              ),
              SizedBox(height: 24),
              CartHeader(),
              SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: CartItem(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
