import 'package:flutter/material.dart';
import 'package:saral_urja/config/app_config.dart';
import 'package:saral_urja/constants/app_constants.dart';
import 'package:saral_urja/utils/file_handler.dart';
import 'package:saral_urja/view/auth/login_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setConfigParams(assetJsonConfig);
  runApp(const SaralUrjaApp());
}

Future<void> setConfigParams(String assetPath) async {
  final Map<String, dynamic>? map =
      await FileHandler().parseJsonFromAssets(assetPath);
  AppConfig().fromJson(map!);
}

class SaralUrjaApp extends StatelessWidget {
  const SaralUrjaApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConfig().appName!,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    );
  }
}
