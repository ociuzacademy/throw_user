import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:throw_user/core/models/auth_response.dart';
import 'package:throw_user/core/storage/auth_storage_keys.dart';

class AuthStorageFunctions {
  Future<void> saveUser(AuthResponse authResponse) async {
    final prefs = await SharedPreferences.getInstance();

    // Handle different AuthResponse types
    authResponse.when(
      success: (user, token) async {
        // Create a map with user data and token
        final Map<String, dynamic> data = {
          'user': user.toJson(),
          'token': token,
          'type': 'success',
        };
        await prefs.setString(AuthStorageKeys.userKey, jsonEncode(data));
      },
      error: (code, message, details) {
        // Don't save error responses
        return;
      },
      cancelled: () {
        // Don't save cancelled responses
        return;
      },
    );
  }

  Future<AuthResponse?> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(AuthStorageKeys.userKey);

    if (data == null) return null;

    try {
      final Map<String, dynamic> json = jsonDecode(data);
      final String type = json['type'];

      if (type == 'success') {
        final user = UserProfile.fromJson(json['user']);
        final token = json['token'] as String;
        return AuthResponse.success(user: user, token: token);
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error parsing stored user: $e');
      }
    }

    return null;
  }

  Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(AuthStorageKeys.userKey);
  }
}
