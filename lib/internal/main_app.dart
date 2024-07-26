import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surf_flutter_summer_school_24/data/controllers/theme_provider.dart';
import 'package:surf_flutter_summer_school_24/presentation/pages/main_page.dart';
import 'package:surf_flutter_summer_school_24/presentation/uikit/theme/app_theme_data.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemeData.lightTheme,
      darkTheme: AppThemeData.darkTheme,
      themeMode: context.watch<ThemeProvider>().themeMode.value,
      home: const MainPage(),
    );
  }
}
