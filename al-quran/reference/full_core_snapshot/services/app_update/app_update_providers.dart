import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shirahsoft_muslim/core/services/app_update/app_update_model.dart';
import 'package:shirahsoft_muslim/core/services/app_update/app_update_service.dart';
import 'package:shirahsoft_muslim/core/services/app_update/play_store_update_service.dart';

final remoteConfigProvider = Provider<FirebaseRemoteConfig?>(
  (ref) => Firebase.apps.isEmpty ? null : FirebaseRemoteConfig.instance,
);

final appUpdateServiceProvider = Provider<AppUpdateService>(
  (ref) => AppUpdateService(ref.watch(remoteConfigProvider)),
);

final playStoreUpdateServiceProvider = Provider<PlayStoreUpdateService>(
  (ref) => PlayStoreUpdateService(),
);

final appUpdateProvider =
    AsyncNotifierProvider<AppUpdateNotifier, AppUpdateModel>(
      AppUpdateNotifier.new,
    );

class AppUpdateNotifier extends AsyncNotifier<AppUpdateModel> {
  Future<AppUpdateModel>? _activeCheck;

  @override
  Future<AppUpdateModel> build() => _check();

  Future<AppUpdateModel> _check() {
    return _activeCheck ??= ref
        .read(appUpdateServiceProvider)
        .checkForUpdate()
        .whenComplete(() => _activeCheck = null);
  }

  Future<void> recheck() async {
    state = const AsyncLoading<AppUpdateModel>();
    state = await AsyncValue.guard(_check);
  }
}
