import 'package:flutter/material.dart';
import 'package:fruits_store/features/cart/presentation/views/cart_view.dart';
import 'package:fruits_store/features/home/presentation/views/widgets/home_view/home_view.dart';
import 'package:fruits_store/features/home/presentation/views/widgets/products_view/product_view.dart';

class MainViewBody extends StatelessWidget {
  const MainViewBody({super.key, required this.currentViewIndex});

  final int currentViewIndex;

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: currentViewIndex,
      children: [const HomeView(), const ProductView(), const CartView()],
    );
  }
}
