import 'package:flutter/material.dart';
import 'package:fruits_store/features/auth/presentation/views/signin/signin_view.dart';
import 'package:fruits_store/features/auth/presentation/views/signup/signup_view.dart';
import 'package:fruits_store/features/best_selling_fruits/presentation/views/best_selling_view.dart';
import 'package:fruits_store/features/home/presentation/views/main_view.dart';
import 'package:fruits_store/features/home/presentation/views/widgets/products_view/product_view.dart';
import 'package:fruits_store/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:fruits_store/features/splash/presentation/views/splash_view.dart';

Route<dynamic> onGenrateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => SplashView());
    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (context) => OnBoardingView());
    case SigninView.routeName:
      return MaterialPageRoute(builder: (context) => SigninView());
    case SignupView.routeName:
      return MaterialPageRoute(builder: (context) => SignupView());
    case MainView.routeName:
      return MaterialPageRoute(builder: (context) => MainView());
    case BestSellingView.routeName:
      return MaterialPageRoute(builder: (context) => BestSellingView());
    case ProductView.routeName:
      return MaterialPageRoute(builder: (context) => ProductView());
    default:
      return MaterialPageRoute(builder: (context) => Scaffold());
  }
}
