import 'package:flutter/material.dart';
import 'package:fruits_store/core/utils/text_styles.dart';
import 'package:fruits_store/core/widgets/notification_widget.dart';

AppBar buildAppBar(
  BuildContext context, {
  required String title,
  bool showBackButton = true,
  bool showNotificationIcon = true,
}) {
  return AppBar(
    title: Text(title, style: TextStyles.bold19),
    centerTitle: true,
    backgroundColor: Colors.white,

    actions: [
      Visibility(
        visible: showNotificationIcon,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: NotificationWidget(),
        ),
      ),
    ],
    leading: Visibility(
      visible: showBackButton,
      child: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Icon(Icons.arrow_back_ios_new),
      ),
    ),
  );
}
