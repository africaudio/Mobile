import 'dart:io';

import 'package:abook/data/providers/personalize_provider.dart';
import 'package:abook/index.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'module/screens/onboarding/views/screens/onboarding_home.dart';

Future<void> main() async {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PersonalizeProvide()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ScreenRatio.setScreenRatio(MediaQuery.of(context));
    return Sizer(builder: (context, orientation, deviceType) {
      return AdaptiveTheme(
        builder: (theme, darkTheme) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'AudioBook',
            theme: theme,
            darkTheme: darkTheme,
            home: const OnboardingHome(),
          );
        },
        initial: AdaptiveThemeMode.light,
        light: lightTheme,
        dark: darkTheme,
      );
    });
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
