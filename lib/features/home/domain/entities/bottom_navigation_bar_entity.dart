import 'package:fruits_store/core/utils/app_images.dart';

class BottomNavigationBarEntity {
  final String activeImage, inactiveImage, name;

  BottomNavigationBarEntity({
    required this.activeImage,
    required this.inactiveImage,
    required this.name,
  });
}

List<BottomNavigationBarEntity> bottomNavigationBarItems = [
  BottomNavigationBarEntity(
    activeImage: Assets.imagesHomeBold,
    inactiveImage: Assets.imagesHomeOutline,
    name: 'الرئيسية',
  ),

  BottomNavigationBarEntity(
    activeImage: Assets.imagesProductsBold,
    inactiveImage: Assets.imagesProductsOutline,
    name: 'المنتجات',
  ),
  BottomNavigationBarEntity(
    activeImage: Assets.imagesShoppingCartBold,
    inactiveImage: Assets.imagesShoppingCartOuline,
    name: 'سلة التسوق',
  ),
  BottomNavigationBarEntity(
    activeImage: Assets.imagesUserBold,
    inactiveImage: Assets.imagesUserOutline,
    name: 'حسابي',
  ),
];
