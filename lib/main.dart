import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:surf_flutter_summer_school_24/data/api/service/api_service.dart';
import 'package:surf_flutter_summer_school_24/data/controllers/photo_controller.dart';
import 'package:surf_flutter_summer_school_24/data/repositories/api_photo_repository.dart';
import 'package:surf_flutter_summer_school_24/internal/main_app.dart';
import 'package:surf_flutter_summer_school_24/data/repositories/theme_storage.dart';
import 'package:surf_flutter_summer_school_24/data/controllers/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: '.env');

  final apiServise = ApiService(
    token: dotenv.env['OAUTH_TOKEN'],
  );

  final dio = apiServise.dioInit(
    apiUrl: dotenv.env['API_URL'],
  );

  final prefs = await SharedPreferences.getInstance();
  final themeStorage = ThemeStorage(
    sharedPreferences: prefs,
  );
  final photoRepository = ApiPhotoRepository(
    apiService: apiServise,
    dio: dio,
  );

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
