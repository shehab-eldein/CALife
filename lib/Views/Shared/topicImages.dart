import 'package:canadianslife/Helper/Constants.dart';
import 'package:canadianslife/Models/TopicImage.dart';
import 'package:flutter/material.dart';

class TopicImages extends StatefulWidget {
  const TopicImages({super.key, required this.images});
  final List<TopicImage> images;

  @override
  State<TopicImages> createState() => _TopicImagesState();
}

class _TopicImagesState extends State<TopicImages> {
  @override
  Widget build(BuildContext context) {
    List images = widget.images;
    return AspectRatio(
        aspectRatio: 3 / 2,
        child: PageView.builder(
          controller: PageController(viewportFraction: 1),
          itemCount: images.length,
          itemBuilder: (BuildContext context, int itemIndex) {
            return AspectRatio(
              aspectRatio: 3 / 2,
              child: FadeInImage.assetNetwork(
                image:
                    '${Constant.baseURL}imgtopics/${images[itemIndex].id}.jpg',
                placeholder: 'images/placeholder.png',
                imageErrorBuilder: (context, error, stackTrace) {
                  return Image.asset('images/placeholder.png',
                      fit: BoxFit.cover);
                },
                fit: BoxFit.cover,
              ),
            );
          },
        ));
  }
}
