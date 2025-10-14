import 'package:flutter/material.dart';
import 'package:fruits_store/constants.dart';
import 'package:fruits_store/core/utils/app_colors.dart';
import 'package:fruits_store/core/utils/text_styles.dart';
import 'package:fruits_store/features/auth/presentation/views/widgets/custom_check_box.dart';

class TermsAndConditions extends StatefulWidget {
  const TermsAndConditions({super.key, required this.onChanged});
  final ValueChanged<bool> onChanged;
  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  bool isTermsAccepted = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCheckBox(
          onChanged: (value) {
            isTermsAccepted = value;
            widget.onChanged(value);
            setState(() {});
          },
          isChecked: isTermsAccepted,
        ),
        SizedBox(width: 16),
        SizedBox(
          width:
              MediaQuery.of(context).size.width - (kHorizontalPadding * 2) - 48,
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'من خلال إنشاء حساب ، فإنك توافق على',
                  style: TextStyles.semiBold13.copyWith(
                    color: Color(0xff949D9E),
                  ),
                ),
                TextSpan(
                  text: ' الشروط والأحكام الخاصة بنا',
                  style: TextStyles.semiBold13.copyWith(
                    color: AppColors.lightPrimaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
