import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:surf_flutter_summer_school_24/data/controllers/photo_controller.dart';
import 'package:surf_flutter_summer_school_24/domain/models/items.dart';
import 'package:surf_flutter_summer_school_24/presentation/pages/image_slider.dart';
import 'package:surf_flutter_summer_school_24/data/controllers/theme_provider.dart';
import 'package:surf_flutter_summer_school_24/presentation/uikit/theme/context_x.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Items? photos;

  @override
  void initState() {
    super.initState();

    photos = context.read<PhotoController>().photos.value;
    context.read<PhotoController>().getPhotos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.surface,
      appBar: AppBar(
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
      body: RefreshIndicator(
        onRefresh: () => context.read<PhotoController>().getPhotos(),
        child: ValueListenableBuilder(
          valueListenable: context.read<PhotoController>().photos,
          builder: (context, photos, __) {
            if (photos == null) {
              return const _OfflineModeScreen();
            } else {
              // final List<Image>

              return _FutureImageGrid(
                photos: photos,
              );
            }
          },
        ),
      ),
    );
  }
}

class _OfflineModeScreen extends StatelessWidget {
  const _OfflineModeScreen();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            '😪',
            style: TextStyle(
              fontSize: 50,
            ),
          ),
          const Text(
            'Упс!',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Произошла ошибка.\nПопробуйте снова.',
            style: TextStyle(
              fontSize: 16,
              color: context.colorScheme.secondary,
            ),
            textAlign: TextAlign.center,
          ),
          MaterialButton(
            onPressed: () {
              context.read<PhotoController>().getPhotos();
            },
            color: const Color(0xFF80E7FF),
            child: const Text('Попробовать снова'),
          ),
        ],
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

class _FutureImageGrid extends StatelessWidget {
  final Items photos;

  const _FutureImageGrid({
    required this.photos,
  });

  void openImageSliderAnim(BuildContext context, int index, Items photos) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => ImageSlider(
          photos: photos,
          indexImage: index,
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.ease;

          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var offsetAnimation = animation.drive(tween);

          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const _BottomBar(),
      body: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return GridView.builder(
              itemCount: photos.items!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                child: GestureDetector(
                  onTap: () => openImageSliderAnim(context, index, photos),
                  child: CachedNetworkImage(
                    imageUrl: photos.items![index].file,
                    placeholder: (context, url) => Shimmer(
                      gradient: LinearGradient(
                        colors: [
                          context.colorScheme.tertiary,
                          context.colorScheme.onTertiary
                        ],
                      ),
                      child: Container(
                        width: constraints.maxWidth / 3 - 4,
                        height: constraints.maxWidth / 3 - 4,
                        color: context.colorScheme.tertiary,
                      ),
                    ),
                    fit: BoxFit.cover,
                  ),
                  // child: getImage(index, context),
                ),
              ),
            );
          },
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
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              imageSourceSelecter(context);
            },
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

  void imageSourceSelecter(context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text('Выберите источник изображения'),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () {
                  context
                      .read<PhotoController>()
                      .uploadPhoto(ImageSource.camera);

                  Navigator.pop(context);
                },
                child: const Text('Камера'),
              ),
              TextButton(
                onPressed: () {
                  context
                      .read<PhotoController>()
                      .uploadPhoto(ImageSource.gallery);

                  Navigator.pop(context);
                },
                child: const Text('Галерея'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
