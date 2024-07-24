import 'package:abook/module/screens/auth/login.dart';
import 'package:abook/shared/themes/screen_ratio.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    if (!ScreenRatio.initialized) {
      ScreenRatio.setScreenRatio(MediaQuery.of(context));
    }
    ScreenRatio.setScreenRatio(MediaQuery.of(context));

    return FutureBuilder<AdaptiveThemeMode?>(
        future: AdaptiveTheme.getThemeMode(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (!ScreenRatio.initialized) {
            ScreenRatio.setScreenRatio(MediaQuery.of(context));
          }
          ScreenRatio.setScreenRatio(MediaQuery.of(context));
          return const LoginScreen();
        });
  }
}
