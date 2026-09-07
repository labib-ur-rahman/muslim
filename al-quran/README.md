# Al-Quran Portable Module

This folder is a portable bundle of the Quran reader from the current app.
It keeps the same feature structure so it can be copied into another Flutter
project with minimal rework.

## What is Included

- `lib/features/quran`: Mushaf reader, vertical reader, ayah actions, search,
  bookmarks, reading progress state, Quran settings, ayah-by-ayah audio.
- `lib/features/quran_moratal`: full-surah recitation, offline download state,
  shared player integration.
- `lib/features/tafsser`: local Jalalayn tafsir loading, tafsir lookup,
  tafsir download screen/providers.
- `lib/core`: the Quran module's required shared helpers only: DI, Isar DB,
  l10n, theme providers, constants, extensions, notification helpers, network
  helper, logger, and settings widgets.
- `assets`: Quran JSON, tafsir JSON, Quran/audio images, icons, and fonts used
  by the copied code.
- `integration`: bootstrap and route snippets to paste into a host app.
- `reference/full_core_snapshot`: original full core snapshot from this app for
  reference. Do not copy it wholesale unless the host app also needs those
  non-Quran systems.

## Migration Checklist

1. Copy `al-quran/lib/features/quran`, `quran_moratal`, and `tafsser` into the
   host project's `lib/features`.
2. Copy or merge `al-quran/lib/core` into the host project's `lib/core`.
3. Copy `al-quran/assets` into the host project's `assets`.
4. Add the dependencies and asset/font declarations from
   `pubspec_quran_snippet.yaml` to the host `pubspec.yaml`.
5. Replace package imports:
   `package:shirahsoft_muslim/` -> `package:<host_package_name>/`.
6. Register the Quran routes from `integration/quran_routes.md`.
7. Add the bootstrap calls from `integration/quran_module_bootstrap.dart`.
8. Run:

```sh
flutter pub get
dart run build_runner build --delete-conflicting-outputs
```

9. Start from `SelectSurahPage` or `QuranPages(pageNumber: 1)`.

## Important Notes

- The reader uses `qcf_quran` for Quran text, page mapping, verse count, and
  Mushaf rendering.
- Bookmarks and reading progress are stored in Isar through `Mark`.
- Home progress is page-based: `latest saved page / 604`.
- Background audio needs `JustAudioBackground.init` before playback.
- Daily Quran reminder defaults to 05:00 in this standalone bundle. If the host
  app has prayer times, replace that fallback with Fajr + 30 minutes.
- The copied code still uses the original package import prefix by design, so
  import replacement is a required migration step.
