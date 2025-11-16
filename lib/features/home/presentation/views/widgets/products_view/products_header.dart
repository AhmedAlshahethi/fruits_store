import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_store/core/utils/app_images.dart';
import 'package:fruits_store/core/utils/text_styles.dart';

class ProductsHeader extends StatelessWidget {
  const ProductsHeader({super.key, required this.productsLenght});
  final int productsLenght;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '$productsLenght نتائج',
          style: TextStyles.bold16.copyWith(color: Color(0xff0C0D0D)),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
              side: BorderSide(width: 1, color: Color(0xffE2E2E2)),
            ),
            color: Color(0xffF5F6FA),
          ),
          child: SvgPicture.asset(Assets.imagesSetting),
        ),
      ],
    );
  }
}
