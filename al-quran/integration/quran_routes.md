# Quran Routes

Add these to the host app's `MaterialApp.routes` or route generator after
replacing the package import prefix.

```dart
Routes.selectSurahPage: (_) => const SelectSurahPage(),
Routes.quranPages: (_) => const QuranPages(),
Routes.quranSettingsPage: (_) => const QuranSettingsPage(),
Routes.tafseerPage: (_) => const TafseerPage(),
Routes.quranMoratal: (_) => const QuranMoratalPage(),
```

For notification deep links, set:

```dart
navigatorKey: quranModuleNavigatorKey,
```

or merge `quranModuleNavigatorKey` with the host app's existing navigator key.
