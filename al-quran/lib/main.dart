import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shirahsoft_muslim/core/common/providers/language_provider.dart';
import 'package:shirahsoft_muslim/core/common/providers/theme_provider.dart';
import 'package:shirahsoft_muslim/core/constants/routes.dart';
import 'package:shirahsoft_muslim/core/l10n/app_localizations.dart';
import 'package:shirahsoft_muslim/features/quran/presentation/pages/quran_pages.dart';
import 'package:shirahsoft_muslim/features/quran/presentation/pages/quran_settings_page.dart';
import 'package:shirahsoft_muslim/features/quran/presentation/pages/select_surah_page.dart';
import 'package:shirahsoft_muslim/features/quran_moratal/presentation/pages/quran_moratal_page.dart';
import 'package:shirahsoft_muslim/features/tafsser/presentation/pages/tafseer_page.dart';
import 'bootstrap.dart';

final GlobalKey<NavigatorState> quranNavigatorKey = GlobalKey<NavigatorState>();

void main() async {
  await QuranModuleBootstrap.initBeforeRunApp();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  final container = ProviderContainer();
  await QuranModuleBootstrap.initAfterRunApp(container);

  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const AlQuranApp(),
    ),
  );
}

class AlQuranApp extends ConsumerWidget {
  const AlQuranApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScreenUtilInit(
      minTextAdapt: true,
      designSize: const Size(392.72727272727275, 800.7272727272727),
      builder: (context, child) {
        final botToastBuilder = BotToastInit();
        final currentThemeMode = ref.watch(themeProvider);
        final currentLocale = ref.watch(languageProvider);

        return MaterialApp(
          navigatorKey: quranNavigatorKey,
          debugShowCheckedModeBanner: false,
          title: 'Al-Quran',
          locale: Locale(currentLocale.name),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          themeMode: currentThemeMode,
          theme: ThemeData(
            useMaterial3: true,
            brightness: Brightness.light,
            colorSchemeSeed: const Color(0xFF0F766E),
          ),
          darkTheme: ThemeData(
            useMaterial3: true,
            brightness: Brightness.dark,
            colorSchemeSeed: const Color(0xFF0F766E),
          ),
          initialRoute: Routes.selectSurahPage,
          routes: {
            Routes.selectSurahPage: (_) => const SelectSurahPage(),
            Routes.quranPages: (_) => const QuranPages(),
            Routes.quranSettingsPage: (_) => const QuranSettingsPage(),
            Routes.tafseerPage: (_) => const TafseerPage(),
            Routes.quranMoratal: (_) => const QuranMoratalPage(),
          },
          builder: (context, widget) {
            return botToastBuilder(context, widget);
          },
          navigatorObservers: [BotToastNavigatorObserver()],
        );
      },
    );
  }
}
