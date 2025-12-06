import 'package:flutter/material.dart';
import 'package:fruits_store/features/cart/presentation/views/widgets/cart_view_body.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});
  static const String routeName = 'cartView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: CartViewBody());
  }
}
