import 'package:flutter/material.dart';
import 'package:fruits_store/core/utils/text_styles.dart';

class FeaturedItemButton extends StatelessWidget {
  const FeaturedItemButton({super.key, this.onPressed});
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Colors.white,

          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        ),
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: FittedBox(
            child: Text(
              'تسوق الآن',
              style: TextStyles.bold13.copyWith(color: Color(0xff1B5E37)),
            ),
          ),
        ),
      ),
    );
  }
}
