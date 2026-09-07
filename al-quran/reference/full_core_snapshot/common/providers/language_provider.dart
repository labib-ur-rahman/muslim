import 'package:flutter_riverpod/legacy.dart';
import 'package:shirahsoft_muslim/core/constants/enums/my_enums.dart';
import 'package:shirahsoft_muslim/core/utils/log/app_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider extends StateNotifier<AppLocale> {
  LanguageProvider() : super(AppLocale.bn);

  // change lang
  Future<void> changeLanguage({required AppLocale appLocal}) async {
    state = appLocal;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("lang", appLocal.name);
  }

  // load current lang
  Future<void> loadlang() async {
    final prefs = await SharedPreferences.getInstance();
    final String? currentLang = prefs.getString("lang");
    if (currentLang != null) {
      state = AppLocale.values.firstWhere(
        (locale) => locale.name == currentLang,
        orElse: () => AppLocale.bn,
      );
    }
    AppLogger.logger.i("تم تحميل اللغة");
  }
}

final languageProvider = StateNotifierProvider<LanguageProvider, AppLocale>((
  ref,
) {
  return LanguageProvider();
});
