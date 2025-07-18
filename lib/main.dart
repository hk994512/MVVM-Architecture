import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mvvm/screens/splash_screen.dart';

import 'constants/my_theme_data.dart';
import 'service/init_getit.dart';
import 'service/navigation_service.dart';

Future<void> main() async {
  // Ensure all widgets and bindings are ready
  WidgetsFlutterBinding.ensureInitialized();

  // Lock screen orientation to portrait only
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  // Load environment variables from .env file
  await dotenv.load(fileName: ".env");

  // Setup service locator (GetIt)
  setupLocator();

  // Start the app
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: getIt<NavigationService>().navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Movies App',
      theme: MyThemeData.lightTheme,
      home: const SplashScreen(),
    );
  }
}
