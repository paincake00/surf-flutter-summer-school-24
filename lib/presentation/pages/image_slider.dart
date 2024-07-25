import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
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
            child: Image.network(
              photos.items![itemIndex].file,
              fit: BoxFit.fitHeight,
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
    );
  }
}
