import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_store/core/entities/product_entity.dart';
import 'package:fruits_store/features/cart/domain/entities/cart_entity.dart';
import 'package:fruits_store/features/cart/domain/entities/cart_item_entity.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartCubitInitial());
  CartEntity cartEntity = CartEntity(cartItems: []);
  void addProduct(ProductEntity productEntity) {
    bool isExsits = cartEntity.isExsits(productEntity);
    var cartItemEntity = cartEntity.getCartItem(productEntity);
    if (isExsits) {
      cartItemEntity.incrementCount();
    } else {
      cartEntity.addCartItem(cartItemEntity);
    }

    emit(CartItemAdded());
  }

  void deleteCartItem(CartItemEntity cartItemEntity) {
    cartEntity.removeCartItem(cartItemEntity);
    emit(CartItemRemoved());
  }
}
