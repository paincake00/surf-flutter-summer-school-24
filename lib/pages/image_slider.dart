import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:surf_flutter_summer_school_24/uikit/theme/context_x.dart';

class ImageSlider extends StatefulWidget {
  final List<String> imagePaths;
  final int indexImage;

  const ImageSlider({
    super.key,
    required this.imagePaths,
    required this.indexImage,
  });

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  late List<String> imagePaths;
  late int indexImage;

  @override
  void initState() {
    imagePaths = widget.imagePaths;
    indexImage = widget.indexImage;

    super.initState();
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
            '21.05.2023',
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
                  '/${imagePaths.length}',
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
        itemCount: imagePaths.length,
        itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
            Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.asset(imagePaths[itemIndex], fit: BoxFit.fitHeight)),
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
            });
          },
        ),
      ),
    );
  }
}
