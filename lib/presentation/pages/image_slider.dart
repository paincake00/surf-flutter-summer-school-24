import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:surf_flutter_summer_school_24/data/controllers/photo_controller.dart';
import 'package:surf_flutter_summer_school_24/domain/models/items.dart';
import 'package:surf_flutter_summer_school_24/presentation/uikit/theme/context_x.dart';

class ImageSlider extends StatefulWidget {
  final Items photos;
  final int indexImage;

  const ImageSlider({
    super.key,
    required this.photos,
    required this.indexImage,
  });

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  late Items photos;
  late int indexImage;
  late String date;

  @override
  void initState() {
    super.initState();

    photos = widget.photos;
    indexImage = widget.indexImage;
    date = photos.items![indexImage].created;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Text(
            date,
            style: TextStyle(
              color: context.colorScheme.onSecondary,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Text(
                  '${indexImage + 1}',
                  style: TextStyle(
                    color: context.colorScheme.primary,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '/${photos.items!.length}',
                  style: TextStyle(
                    color: context.colorScheme.secondary,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: CarouselSlider.builder(
        itemCount: photos.items!.length,
        itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
            Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: LayoutBuilder(
              builder: (context, constraints) => CachedNetworkImage(
                imageUrl: photos.items![itemIndex].file,
                placeholder: (context, url) => Shimmer(
                  gradient: LinearGradient(
                    colors: [
                      context.colorScheme.tertiary,
                      context.colorScheme.onTertiary
                    ],
                  ),
                  child: Container(
                    width: constraints.maxWidth,
                    height: constraints.maxWidth,
                    color: context.colorScheme.tertiary,
                  ),
                ),
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
        ),
        options: CarouselOptions(
          initialPage: indexImage,
          height: MediaQuery.of(context).size.height * 0.8,
          enlargeCenterPage: true,
          enlargeFactor: 0.3,
          viewportFraction: 0.75,
          padEnds: true,
          onPageChanged: (index, reason) {
            setState(() {
              indexImage = index;
              date = photos.items![index].created;
            });
          },
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width / 2 - 40,
            vertical: 8),
        child: IconButton(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(Colors.red),
          ),
          icon: const Icon(Icons.delete, color: Colors.white),
          onPressed: () {
            context
                .read<PhotoController>()
                .deletePhoto(photos.items![indexImage].path);
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
