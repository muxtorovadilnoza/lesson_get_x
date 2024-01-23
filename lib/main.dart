import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:lesson_get_x/ui/pages/home_page.dart';
import 'package:lesson_get_x/ui/utils/utils.dart';

import 'data/language_controll/language_controll.dart';


void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
 MyApp({super.key});
  LocaleController controller = Get.put(LocaleController());
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: Messages(),
      locale: controller.locale.value,
      fallbackLocale: Locale("uz", "UZ"),
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  HomePage(),
    );
  }
}



