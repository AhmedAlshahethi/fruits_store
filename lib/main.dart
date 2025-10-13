import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fruits_store/core/helper_functions/on_genrate_routes.dart';
import 'package:fruits_store/core/services/shared_preferences_singleton.dart';
import 'package:fruits_store/core/utils/app_colors.dart';
import 'package:fruits_store/features/splash/presentation/views/splash_view.dart';
import 'package:fruits_store/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Prefs.getInstance();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('ar')],
      path: 'assets/lang',
      fallbackLocale: Locale('ar'),
      startLocale: Locale('ar'),
      child: FruitsStore(),
    ),
  );
}

class FruitsStore extends StatelessWidget {
  const FruitsStore({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Cairo',
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
      ),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      onGenerateRoute: onGenrateRoute,
      initialRoute: SplashView.routeName,
    );
  }
}
