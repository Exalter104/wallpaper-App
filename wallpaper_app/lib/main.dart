import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper_app/views/components/getx_localization.dart/language.dart';
import 'package:wallpaper_app/views/screens/home.dart';

import 'views/components/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        translations: Languages(),
        locale: const Locale(
            'en', 'US'), // translations will be displayed in that locale
        fallbackLocale: const Locale('en', 'UK'),
        title: 'Exarth Wallpaper',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 0, 0, 0)),
          useMaterial3: true,
        ),
        home: const HomeScreen(),
        getPages: AppRoutes.appRoutes());
  }
}
