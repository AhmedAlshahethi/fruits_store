import 'package:flutter/material.dart';
import 'package:fruits_store/core/utils/text_styles.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(child: Divider(color: Color(0xffDDDFDF))),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Text('أو', style: TextStyles.semiBold16),
        ),
        Expanded(child: Divider(color: Color(0xffDDDFDF))),
      ],
    );
  }
}
