import 'package:flutter/material.dart';
import 'package:fruits_store/features/cart/domain/entities/cart_item_entity.dart';
import 'package:fruits_store/features/cart/presentation/views/widgets/cart_item.dart';

class CartItemList extends StatelessWidget {
  const CartItemList({super.key, required this.cartItemEntity});
  final List<CartItemEntity> cartItemEntity;
  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemCount: cartItemEntity.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CartItem(cartItemEntity: cartItemEntity[index]),
        );
      },
      separatorBuilder: (context, index) {
        return Divider(height: 12, color: Color(0xffF1F1F5));
      },
    );
  }
}
