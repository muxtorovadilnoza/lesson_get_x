import 'dart:ui';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LocaleController extends GetxController {
  var _locale = Get.deviceLocale!.obs;
  GetStorage box = GetStorage();

  Rx<Locale> get locale => _locale;

  changeLanguage(Locale locale) {
    // "uz_UZ"
    Get.updateLocale(locale);
    box.write("locale", "${locale.languageCode}_${locale.countryCode}");
    this._locale.value = locale;
  }

  @override
  void onInit() {
    if (box.read("locale") != null) {
      print(box.read("locale"));
      String locale = box.read("locale");
      _locale.value = Locale(locale.split("_")[0], locale.split("_")[1]);
    } else {
      _locale.value = Get.deviceLocale!;
    }
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
