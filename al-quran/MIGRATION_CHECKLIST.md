# Migration Checklist

## Copy

- `al-quran/lib/features/quran` -> `lib/features/quran`
- `al-quran/lib/features/quran_moratal` -> `lib/features/quran_moratal`
- `al-quran/lib/features/tafsser` -> `lib/features/tafsser`
- `al-quran/lib/core` -> merge into `lib/core`
- `al-quran/assets` -> merge into `assets`

## Replace Imports

Run a project-wide replace after copying:

```text
package:shirahsoft_muslim/
package:<host_package_name>/
```

## Initialize

- Call `await init()` from `core/di/injection_container.dart` before `runApp`.
- Call `insertQuranPagesToIsar()` and `loadTafsserFromAssest()` once at app
  startup or first install.
- Call `JustAudioBackground.init(...)` before audio playback.
- Call `marksProvder.notifier.loadMarks()` after `ProviderScope` is available.
- Start `QuranSearchIndexer.initialize()` after UI starts.

## Routes

Add routes for:

- `Routes.selectSurahPage` -> `SelectSurahPage`
- `Routes.quranPages` -> `QuranPages`
- `Routes.quranSettingsPage` -> `QuranSettingsPage`
- `Routes.tafseerPage` -> `TafseerPage`
- `Routes.quranMoratal` -> `QuranMoratalPage`

## Generated Files

This bundle includes current `.g.dart` files, but regenerate after moving:

```sh
dart run build_runner build --delete-conflicting-outputs
```

## Android/iOS

- Configure notification permission prompts in the host app.
- Keep an Android launcher icon named `@mipmap/ic_launcher`, or change
  `NotificationService` / scheduler icon names.
- Background audio requires the normal `just_audio_background` setup in the
  host app.
