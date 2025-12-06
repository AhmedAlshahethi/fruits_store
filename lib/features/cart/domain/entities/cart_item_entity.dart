import 'package:equatable/equatable.dart';
import 'package:fruits_store/core/entities/product_entity.dart';

// ignore: must_be_immutable
class CartItemEntity extends Equatable {
  final ProductEntity productEntity;
  int count;

  CartItemEntity({required this.productEntity, this.count = 0});

  num calculateTotalPrice() {
    return productEntity.price * count;
  }

  num calculateTotalWeight() {
    return productEntity.unitAmount * count;
  }

  void incrementCount() {
    count++;
  }

  void decrementCount() {
    count--;
  }

  @override
  List<Object?> get props => [productEntity];
}
