import 'package:throw_user/core/exports/exception_exports.dart';
import 'package:throw_user/core/storage/app_storage_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppStorageFunctions {
  static Future<void> disableIntroScreen() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool(AppStorageKeys.isFirstLaunch, false);
    } catch (e) {
      throw StorageException(
        message: 'Failed to disable intro screen in storage',
        details: e.toString(),
      );
    }
  }

  static Future<bool> getIntroScreenStatus() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      bool? isFirstLaunchString = prefs.getBool(AppStorageKeys.isFirstLaunch);
      return isFirstLaunchString ?? true;
    } catch (e) {
      throw StorageException(
        message: 'Failed to get intro screen status from storage',
        details: e.toString(),
      );
    }
  }
}
