part of 'cart_cubit.dart';

sealed class CartState {}

final class CartCubitInitial extends CartState {}

final class CartItemAdded extends CartState {}

final class CartItemRemoved extends CartState {}
