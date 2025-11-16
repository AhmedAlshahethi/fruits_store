import 'package:flutter/material.dart';
import 'package:fruits_store/features/home/presentation/views/widgets/bottom_navigation_bar/custom_bottom_navigation_bar.dart';
import 'package:fruits_store/features/home/presentation/views/widgets/home_view/home_view.dart';
import 'package:fruits_store/features/home/presentation/views/widgets/products_view/product_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});
  static const String routeName = 'home_view';

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int currentViewIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: currentViewIndex,
          children: [HomeView(), const ProductView()],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        onItemTapped: (index) {
          currentViewIndex = index;
          setState(() {});
        },
      ),
    );
  }
}
