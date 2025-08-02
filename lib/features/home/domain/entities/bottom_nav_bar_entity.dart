import 'package:fruit_e_commerce/core/utils/app_images.dart';

class BottomNavBarEntity {
  final String activeImage, inActiveImage;
  final String name;

  BottomNavBarEntity({
    required this.activeImage,
    required this.inActiveImage,
    required this.name,
  });
}

List<BottomNavBarEntity> get bottomNavBarEntityItems => [
  BottomNavBarEntity(
    activeImage: Assets.assetsImagesBoldHomeBold,
    inActiveImage: Assets.assetsImagesOutlineHomeOutline,
    name: 'الرئيسية',
  ),
  BottomNavBarEntity(
    activeImage: Assets.assetsImagesBoldProductsBold,
    inActiveImage: Assets.assetsImagesOutlineProductsOutline,
    name: 'المنتجات',
  ),
  BottomNavBarEntity(
    activeImage: Assets.assetsImagesBoldShoppingCartBold,
    inActiveImage: Assets.assetsImagesOutlineShoppingCartOutline,
    name: 'السلة',
  ),
  BottomNavBarEntity(
    activeImage: Assets.assetsImagesBoldProfileBold,
    inActiveImage: Assets.assetsImagesOutlineProfileOutline,
    name: 'الملف الشخصي',
  ),
];
