import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_store/features/cart/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:fruits_store/features/home/presentation/views/widgets/bottom_navigation_bar/custom_bottom_navigation_bar.dart';
import 'package:fruits_store/features/home/presentation/views/widgets/main_view_body_listener.dart';

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
    return BlocProvider(
      create: (context) => CartCubit(),
      child: Scaffold(
        body: SafeArea(
          child: MainViewBodyListener(currentViewIndex: currentViewIndex),
        ),
        bottomNavigationBar: CustomBottomNavigationBar(
          onItemTapped: (index) {
            currentViewIndex = index;
            setState(() {});
          },
        ),
      ),
    );
  }
}
