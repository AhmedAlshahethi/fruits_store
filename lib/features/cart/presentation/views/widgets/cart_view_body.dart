import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_store/core/widgets/custom_app_bar.dart';
import 'package:fruits_store/features/cart/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:fruits_store/features/cart/presentation/views/widgets/cart_header.dart';
import 'package:fruits_store/features/cart/presentation/views/widgets/cart_item_list.dart';
import 'package:fruits_store/features/cart/presentation/views/widgets/custom_cart_button.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: context.read<CartCubit>().cartEntity.cartItems.isEmpty
                  ? SizedBox()
                  : Divider(height: 22, color: Color(0xffF1F1F5)),
            ),
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
                ],
              ),
            ),
            CartItemList(
              cartItemEntity: context.watch<CartCubit>().cartEntity.cartItems,
            ),
            SliverToBoxAdapter(
              child: context.read<CartCubit>().cartEntity.cartItems.isEmpty
                  ? SizedBox()
                  : Divider(height: 22, color: Color(0xffF1F1F5)),
            ),
          ],
        ),
        Positioned(
          bottom: MediaQuery.sizeOf(context).height * 0.04,
          left: 16,
          right: 16,
          child: context.read<CartCubit>().cartEntity.cartItems.isEmpty
              ? SizedBox()
              : (CustomCartButton()),
        ),
      ],
    );
  }
}
