import 'package:flutter/material.dart';
import 'package:fruits_store/core/utils/text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.keyboardType,
    this.suffixIcon,
  });
  final String hintText;
  final TextInputType keyboardType;
  final Widget? suffixIcon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      decoration: InputDecoration(
        border: buildOutlineBorder(),
        enabledBorder: buildOutlineBorder(),
        focusedBorder: buildOutlineBorder(),
        hint: Text(hintText),
        hintStyle: TextStyles.bold13.copyWith(color: Color(0xff949D9E)),
        fillColor: Color(0xffF9FAFA),
        filled: true,
        suffixIcon: suffixIcon,
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      ),
    );
  }

  OutlineInputBorder buildOutlineBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: Color(0xffE6E9EA), width: 1),
    );
  }
}
