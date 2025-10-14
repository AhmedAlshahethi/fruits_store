import 'package:flutter/material.dart';
import 'package:fruits_store/core/widgets/custom_text_form_field.dart';

class CustomPasswordField extends StatefulWidget {
  const CustomPasswordField({super.key, this.onSaved});
  final void Function(String?)? onSaved;

  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      obscureText: obscureText,
      hintText: 'كلمة المرور',
      keyboardType: TextInputType.visiblePassword,
      onSaved: widget.onSaved,
      suffixIcon: GestureDetector(
        onTap: () {
          obscureText = !obscureText;
          setState(() {});
        },
        child: obscureText
            ? const Icon(color: Color(0xffC9CECF), Icons.remove_red_eye)
            : const Icon(color: Color(0xffC9CECF), Icons.visibility_off),
      ),
    );
  }
}
