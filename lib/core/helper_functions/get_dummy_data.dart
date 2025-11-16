import 'package:fruits_store/core/entities/product_entity.dart';

ProductEntity getDummyProductEntity() {
  return ProductEntity(
    code: 'P001',
    name: 'Apple',
    description: 'Fresh and juicy apples.',
    price: 1.99,
    imageUrl: null,
    expirationMonths: 20,
    isFeatured: true,
    numberOfCalories: 20,
    isOrganic: true,
    reviews: [],
    unitAmount: 20,
  );
}

List<ProductEntity> getDummyProductEntities() {
  return [
    getDummyProductEntity(),
    getDummyProductEntity(),
    getDummyProductEntity(),
    getDummyProductEntity(),
  ];
}
