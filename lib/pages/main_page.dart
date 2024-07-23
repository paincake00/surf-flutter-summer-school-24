import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:surf_flutter_summer_school_24/pages/image_slider.dart';
import 'package:surf_flutter_summer_school_24/theme/theme_provider.dart';
import 'package:surf_flutter_summer_school_24/uikit/theme/context_x.dart';

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
      backgroundColor: context.colorScheme.surface,
      appBar: AppBar(
        // title: SizedBox(
        //   width: 140,
        //   height: 34,
        //   child: Image.asset('assets/logo/postogram_logo.png'),
        //   // child: Consumer<ThemeProvider>(
        //   //   builder: (_, provider, __) => provider.isDarkMode
        //   //       ? Image.asset('assets/logo/postogram_logo_light.png')
        //   //       : Image.asset('assets/logo/postogram_logo.png'),
        //   // ),
        // ),
        title: _LogoBuilder(),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_vert_outlined,
              color: context.colorScheme.onSecondary,
            ),
          ),
        ],
      ),
      // body: buildImageGrid(),
      body: _ImageGrid(
        imagePaths: imagePaths,
        openImageSlider: openImageSlider,
      ),
      // bottomNavigationBar: buildBottomBar(),
      bottomNavigationBar: const _BottomBar(),
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

class _LogoBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      height: 34,
      child: Consumer<ThemeProvider>(
        builder: (_, provider, __) => provider.isDarkMode
            ? SvgPicture.asset('assets/logo/postogram_logo_light.svg')
            : SvgPicture.asset('assets/logo/postogram_logo.svg'),
      ),
    );
  }
}

class _ImageGrid extends StatelessWidget {
  final List<String> imagePaths;
  final void Function(int) openImageSlider;

  const _ImageGrid({
    required this.imagePaths,
    required this.openImageSlider,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: GridView.builder(
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
}

class _BottomBar extends StatelessWidget {
  const _BottomBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 161,
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
              context.read<ThemeProvider>().toggleThemeMode();
            },
            child: Row(
              children: [
                Icon(
                  Icons.wb_sunny_outlined,
                  color: context.colorScheme.secondary,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    'Тема',
                    style: TextStyle(
                      color: context.colorScheme.onSecondary,
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
                      color: context.colorScheme.secondary,
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Row(
              children: [
                Icon(
                  Icons.cloud_upload_outlined,
                  color: context.colorScheme.secondary,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    'Загрузить фото...',
                    style: TextStyle(
                      color: context.colorScheme.onSecondary,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
