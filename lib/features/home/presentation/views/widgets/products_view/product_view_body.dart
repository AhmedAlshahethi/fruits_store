import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_store/core/cubits/products_cubit/products_cubit.dart';
import 'package:fruits_store/core/widgets/custom_app_bar.dart';
import 'package:fruits_store/core/widgets/search_text_field.dart';
import 'package:fruits_store/features/home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:fruits_store/features/home/presentation/views/widgets/products_grid_view_builder.dart';
import 'package:fruits_store/features/home/presentation/views/widgets/products_view/products_header.dart';

class ProductViewBody extends StatefulWidget {
  const ProductViewBody({super.key});

  @override
  State<ProductViewBody> createState() => _ProductViewBodyState();
}

class _ProductViewBodyState extends State<ProductViewBody> {
  @override
  void initState() {
    context.read<ProductsCubit>().getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(height: 16),
                buildAppBar(context, title: 'المنتجات', showBackButton: false),
                SizedBox(height: 16),
                CustomSearchField(),

                SizedBox(height: 12),
                ProductsHeader(
                  productsLenght: context.read<ProductsCubit>().productsLength,
                ),
                SizedBox(height: 8),
              ],
            ),
          ),
          ProductsGridViewBlocBuilder(),
        ],
      ),
    );
  }
}
