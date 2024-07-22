import 'package:flutter/material.dart';
import 'package:surf_flutter_summer_school_24/pages/image_slider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ImageSlider(),
    );
  }
}
