import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_store/core/entities/product_entity.dart';
import 'package:fruits_store/core/repos/product_repo.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.productRepo) : super(ProductsInitial());
  final ProductRepo productRepo;
  int productsLength = 0;
  Future<void> getProducts() async {
    emit(ProductsLoading());
    final result = await productRepo.getProducts();
    result.fold(
      (failure) => emit(ProductsFailure(message: failure.message)),
      (products) => emit(ProductsSuccess(products: products)),
    );
  }

  Future<void> getBestSellingProducts() async {
    emit(ProductsLoading());
    final result = await productRepo.getBestSellingProducts();
    result.fold((failure) => emit(ProductsFailure(message: failure.message)), (
      products,
    ) {
      productsLength = products.length;
      emit(ProductsSuccess(products: products));
    });
  }
}
