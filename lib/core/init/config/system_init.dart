import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class SystemInit {
  static SystemInit? _instance;

  static SystemInit get instance => _instance ??= SystemInit._();

  SystemInit._();

  Future<void> init() async {
    /// Needs to be called so that we can await for
    /// EasyLocalization.ensureInitialized();
    WidgetsFlutterBinding.ensureInitialized();
    // await Firebase.initializeApp(
    //     options: DefaultFirebaseOptions.currentPlatform);

    /// Set orientation to portrait
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
}
