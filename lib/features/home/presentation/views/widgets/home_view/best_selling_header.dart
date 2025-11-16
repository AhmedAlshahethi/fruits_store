import 'package:flutter/material.dart';
import 'package:fruits_store/core/utils/text_styles.dart';
import 'package:fruits_store/features/best_selling_fruits/presentation/views/best_selling_view.dart';

class BestSellingHeader extends StatelessWidget {
  const BestSellingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, BestSellingView.routeName);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'الأكثر مبيعًا',
            style: TextStyles.bold16.copyWith(color: Color(0xff0C0D0D)),
          ),
          Text(
            'المزيد',
            style: TextStyles.regular13.copyWith(color: Color(0xff949D9E)),
          ),
        ],
      ),
    );
  }
}
