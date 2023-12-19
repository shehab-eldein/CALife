import 'package:canadianslife/Helper/Constants.dart';
import 'package:canadianslife/Models/TopicImage.dart';
import 'package:flutter/material.dart';

class TopicImages extends StatefulWidget {
  const TopicImages({super.key, required this.images, this.initial = 0});
  final int initial;
  final List<TopicImage> images;

  @override
  State<TopicImages> createState() => _TopicImagesState();
}

class _TopicImagesState extends State<TopicImages> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateIndex(widget.initial.toString());
  }

  String currentIndex = "";
  updateIndex(String value) {
    setState(() {
      currentIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController(initialPage: widget.initial);
    List images = widget.images;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 300,
          child: PageView.builder(
            onPageChanged: (index) {
              updateIndex(index.toString());
            },
            scrollDirection: Axis.vertical,
            controller: controller,
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
          ),
        ),
        const SizedBox(height: 10),
        Text(
          "$currentIndex / ${images.length}",
          textDirection: TextDirection.ltr,
        ),
      ],
    );
  }
}
