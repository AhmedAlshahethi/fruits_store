import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:fruits_store/core/entities/product_entity.dart';
import 'package:fruits_store/core/errors/failures.dart';
import 'package:fruits_store/core/models/product_model.dart';
import 'package:fruits_store/core/repos/product_repo.dart';
import 'package:fruits_store/core/services/data_service.dart';
import 'package:fruits_store/core/utils/bakend_endpoints.dart';

class ProductRepoImpl implements ProductRepo {
  final DataService dataService;

  ProductRepoImpl({required this.dataService});
  @override
  Future<Either<Failures, List<ProductEntity>>> getProducts() async {
    try {
      var data =
          await dataService.getData(path: BakendEndpoints.products)
              as List<Map<String, dynamic>>;

      List<ProductEntity> products = data
          .map((e) => ProductModel.fromJson(e).toEntity())
          .toList();
      return right(products);
    } catch (e) {
      log("Excpetion in ProductRepoImpl - getProducts : ${e.toString()}");
      return left(ServerFailure(message: 'Failed to get Products'));
    }
  }

  @override
  Future<Either<Failures, List<ProductEntity>>> getBestSellingProducts() async {
    try {
      var data =
          await dataService.getData(
                path: BakendEndpoints.products,
                query: {
                  'limit': 10,
                  'orderBy': 'sellingCount',
                  'descending': true,
                },
              )
              as List<Map<String, dynamic>>;

      List<ProductEntity> products = data
          .map((e) => ProductModel.fromJson(e).toEntity())
          .toList();
      return right(products);
    } catch (e) {
      log(
        "Excpetion in ProductRepoImpl - getBestSellingProducts : ${e.toString()}",
      );
      return left(ServerFailure(message: 'Failed to get Products'));
    }
  }
}
