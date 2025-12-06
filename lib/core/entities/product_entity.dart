import 'package:equatable/equatable.dart';
import 'package:fruits_store/core/entities/review_entity.dart';

// ignore: must_be_immutable
class ProductEntity extends Equatable {
  final String name;
  final String code;
  final String description;
  final num price;
  final bool isFeatured;
  String? imageUrl;
  final int expirationMonths;
  final bool isOrganic;
  final int numberOfCalories;
  final int unitAmount;
  final num avgRating = 0;
  final num ratingsCount = 0;
  final List<ReviewEntity> reviews;

  ProductEntity({
    required this.name,
    required this.code,
    required this.description,
    required this.price,
    required this.isFeatured,
    this.imageUrl,
    required this.expirationMonths,
    this.isOrganic = false,
    required this.numberOfCalories,
    required this.unitAmount,
    required this.reviews,
  });

  @override
  List<Object?> get props => [code];
}
