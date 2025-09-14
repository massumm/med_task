import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:med_task/routes/app_routes.dart';

import 'routes/app_pages.dart';
import 'localization/app_translations.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
   GetStorage.init();

  runApp(
    GetMaterialApp(
      title: 'Flutter Assessment',
      translations: AppTranslations(),
      locale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),
      initialRoute: AppRoutes.HOME,
      getPages: AppPages.pages,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
    ),
  );
}



