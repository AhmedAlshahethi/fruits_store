import 'package:flutter/material.dart';
import 'package:fruits_store/core/utils/text_styles.dart';

AppBar buildAppBar(BuildContext context, {required String title}) {
  return AppBar(
    title: Text(title, style: TextStyles.bold19),
    centerTitle: true,
    backgroundColor: Colors.white,
    leading: GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Icon(Icons.arrow_back_ios_new),
    ),
  );
}
