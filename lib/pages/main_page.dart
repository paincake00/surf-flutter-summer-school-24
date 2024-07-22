import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surf_flutter_summer_school_24/pages/image_slider.dart';
import 'package:surf_flutter_summer_school_24/theme/theme_provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<String> imagePaths = [
    'assets/images/4022.jpg',
    'assets/images/4025.jpg',
    'assets/images/4020.jpg',
    'assets/images/4042.jpg',
    'assets/images/4045.jpg',
    'assets/images/5040.jpg',
    'assets/images/5042.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: SizedBox(
          width: 140,
          height: 34,
          child: Image.asset('assets/logo/postogram_logo.png'),
          // child: Consumer<ThemeProvider>(
          //   builder: (_, provider, __) => provider.isDarkMode
          //       ? Image.asset('assets/logo/postogram_logo_white.png')
          //       : Image.asset('assets/logo/postogram_logo.png'),
          // ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert_outlined),
          ),
        ],
      ),
      body: buildImageGrid(),
      bottomNavigationBar: buildBottomBar(),
    );
  }

  Widget buildBottomBar() {
    return Container(
      height: 161,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                context.read<ThemeProvider>().toggleTheme();
              },
              child: Row(
                children: [
                  const Icon(
                    Icons.wb_sunny_outlined,
                    color: Colors.grey,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      'Тема',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Consumer<ThemeProvider>(
                    builder: (_, provider, __) => Text(
                      provider.isDarkMode ? 'Темная' : 'Светлая',
                      style: TextStyle(
                        fontSize: 16,
                        color: provider.isDarkMode ? Colors.white : Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // const SizedBox(height: 10),
            GestureDetector(
              onTap: () {},
              child: const Row(
                children: [
                  Icon(
                    Icons.cloud_upload_outlined,
                    color: Colors.grey,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      'Загрузить фото...',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildImageGrid() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: GridView.builder(
        // physics: const BouncingScrollPhysics(
        //   decelerationRate: ScrollDecelerationRate.normal,
        // ),
        itemCount: imagePaths.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
          child: GestureDetector(
            onTap: () => openImageSlider(index),
            child: Image.asset(
              imagePaths[index],
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  void openImageSlider(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ImageSlider(
          imagePaths: imagePaths,
          indexImage: index,
        ),
      ),
    );
  }
}
