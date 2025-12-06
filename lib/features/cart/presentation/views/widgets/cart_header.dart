import 'package:flutter/material.dart';
import 'package:fruits_store/core/utils/text_styles.dart';

class CartHeader extends StatelessWidget {
  const CartHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10),
      color: Color(0xffEBF9F1),
      child: Center(
        child: Text(
          'لديك 3 منتجات في سله التسوق',
          style: TextStyles.regular13.copyWith(color: Color(0xff1B5E37)),
        ),
      ),
    );
  }
}
