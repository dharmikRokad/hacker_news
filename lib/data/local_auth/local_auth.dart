import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:get/get.dart';

class LocalAuth {
  static LocalAuthentication auth = LocalAuthentication();

  static Future<bool> hasBiometrics() async {
    try {
      return await auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      print(e);
      return false;
    }
  }

  static Future<List<BiometricType>> getAvailableBiometrics() async {
    late List<BiometricType> availableBiometrics;
    try {
      availableBiometrics = await auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      availableBiometrics = <BiometricType>[];
      print(e);
    }

    return availableBiometrics.obs;
  }

  static Future<bool> authenticate() async {
    final isAvailable = await hasBiometrics();
    if (!isAvailable) return false;

    try {
      return await auth.authenticate(
        localizedReason:
            'Authentication is required for continue using the app.',
        options: const AuthenticationOptions(
          stickyAuth: true,
          useErrorDialogs: true,
        ),
      );
    } on PlatformException catch (e) {
      print(e);
      return false;
    }
  }
}
