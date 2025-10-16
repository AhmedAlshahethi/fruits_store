import 'package:flutter/material.dart';
import 'package:fruits_store/features/home/domain/entities/bottom_navigation_bar_entity.dart';
import 'package:fruits_store/features/home/presentation/views/widgets/bottom_navigation_bar/active_bottom_navigation_iteam.dart';
import 'package:fruits_store/features/home/presentation/views/widgets/bottom_navigation_bar/inactive_bottom_navigation_iteam.dart';

class NavigationBarItem extends StatelessWidget {
  const NavigationBarItem({
    super.key,
    required this.bottomNavigationBarEntity,
    required this.isSelected,
  });
  final BottomNavigationBarEntity bottomNavigationBarEntity;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return isSelected
        ? ActiveItem(
            image: bottomNavigationBarEntity.activeImage,
            name: bottomNavigationBarEntity.name,
          )
        : InActiveItem(image: bottomNavigationBarEntity.inactiveImage);
  }
}
