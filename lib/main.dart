import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:surf_flutter_summer_school_24/data/controllers/photo_controller.dart';
import 'package:surf_flutter_summer_school_24/data/repositories/mock_photo_repository.dart';
import 'package:surf_flutter_summer_school_24/internal/main_app.dart';
import 'package:surf_flutter_summer_school_24/data/repositories/theme_storage.dart';
import 'package:surf_flutter_summer_school_24/data/controllers/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final themeStorage = ThemeStorage(
    sharedPreferences: prefs,
  );
  final photoRepository = MockPhotoRepository();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(
            themeStorage: themeStorage,
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => PhotoController(
            photoRepository: photoRepository,
          ),
        )
      ],
      child: const MainApp(),
    ),
  );
}
