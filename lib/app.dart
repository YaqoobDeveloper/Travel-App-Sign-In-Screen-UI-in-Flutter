import 'package:flutter/material.dart';

import 'screens/traverlo_login_screen.dart';
import 'theme/traverlo_colors.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Traverlo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: TraverloColors.blue,
          brightness: Brightness.dark,
        ),
        scaffoldBackgroundColor: TraverloColors.gradientBottom,
        // No Material ripple, highlight or hover anywhere in the app.
        splashFactory: NoSplash.splashFactory,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
      ),
      home: const TraverloLoginScreen(),
    );
  }
}
