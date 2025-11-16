import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_store/core/cubits/products_cubit/products_cubit.dart';
import 'package:fruits_store/core/repos/product_repo.dart';
import 'package:fruits_store/core/services/get_it_service.dart';
import 'package:fruits_store/features/home/presentation/views/widgets/products_view/product_view_body.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});
  static const String routeName = 'product_view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => ProductsCubit(getIt.get<ProductRepo>()),
        child: const ProductViewBody(),
      ),
    );
  }
}
