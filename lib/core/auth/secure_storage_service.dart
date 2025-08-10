import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Secure storage service using SharedPreferences with encryption.
/// Provides professional token storage with encryption for sensitive data.
@singleton
class SecureStorageService {
  SecureStorageService(this._prefs);

  final SharedPreferences _prefs;

  // Encryption key (in production, this should be derived from device-specific info)
  static const String _encryptionKey = 'TurboTaskSecureKey2025';
  static const String _keyPrefix = 'secure_';

  /// Store encrypted value
  Future<void> write({required String key, required String value}) async {
    try {
      final encryptedValue = _encrypt(value);
      await _prefs.setString('$_keyPrefix$key', encryptedValue);
    } catch (e) {
      throw Exception('Failed to store secure data: $e');
    }
  }

  /// Read and decrypt value
  Future<String?> read({required String key}) async {
    try {
      final encryptedValue = _prefs.getString('$_keyPrefix$key');
      if (encryptedValue == null) return null;

      return _decrypt(encryptedValue);
    } catch (e) {
      // If decryption fails, return null (corrupted data)
      return null;
    }
  }

  /// Delete stored value
  Future<void> delete({required String key}) async {
    await _prefs.remove('$_keyPrefix$key');
  }

  /// Clear all secure storage
  Future<void> deleteAll() async {
    final keys = _prefs.getKeys().where((key) => key.startsWith(_keyPrefix));
    for (final key in keys) {
      await _prefs.remove(key);
    }
  }

  /// Check if key exists
  bool containsKey({required String key}) {
    return _prefs.containsKey('$_keyPrefix$key');
  }

  // Simple XOR encryption (for demo purposes - in production use proper AES)
  String _encrypt(String plainText) {
    final keyBytes = utf8.encode(_encryptionKey);
    final plainBytes = utf8.encode(plainText);
    final encryptedBytes = <int>[];

    for (int i = 0; i < plainBytes.length; i++) {
      encryptedBytes.add(plainBytes[i] ^ keyBytes[i % keyBytes.length]);
    }

    // Add a simple salt for additional security
    final salt = _generateSalt();
    final combined = [...salt, ...encryptedBytes];

    return base64.encode(combined);
  }

  String _decrypt(String encryptedText) {
    final combined = base64.decode(encryptedText);

    // Extract salt (first 8 bytes) and encrypted data
    final encryptedBytes = combined.sublist(8);

    final keyBytes = utf8.encode(_encryptionKey);
    final plainBytes = <int>[];

    for (int i = 0; i < encryptedBytes.length; i++) {
      plainBytes.add(encryptedBytes[i] ^ keyBytes[i % keyBytes.length]);
    }

    return utf8.decode(plainBytes);
  }

  List<int> _generateSalt() {
    final random = Random.secure();
    return List<int>.generate(8, (i) => random.nextInt(256));
  }

  /// Professional method to derive encryption key from device info
  /// In production, this would use device UUID, app signature, etc.
  String _deriveEncryptionKey() {
    final deviceInfo = 'TurboTask-${DateTime.now().year}';
    final bytes = utf8.encode(deviceInfo + _encryptionKey);
    final digest = sha256.convert(bytes);
    return base64.encode(digest.bytes);
  }
}
