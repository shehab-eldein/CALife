import 'package:canadianslife/Helper/Constants.dart';
import 'package:canadianslife/Models/TopicImage.dart';
import 'package:canadianslife/Extinsions/extensions.dart';
import 'package:canadianslife/Views/Shared/topicImages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class StaggeredGridImages extends StatefulWidget {
  const StaggeredGridImages({super.key, required this.images});
  final List<TopicImage> images;

  @override
  State<StaggeredGridImages> createState() => _StaggeredGridImagesState();
}

class _StaggeredGridImagesState extends State<StaggeredGridImages> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        // height: 300,
        width: double.infinity,
        child: widget.images.length == 1
            ? AspectRatio(
                aspectRatio: 3 / 2,
                child: FadeInImage.assetNetwork(
                  image:
                      '${Constant.baseURL}imgtopics/${widget.images[0].id}.jpg',
                  placeholder: 'images/placeholder.png',
                  imageErrorBuilder: (context, error, stackTrace) {
                    return Image.asset('images/placeholder.png',
                        fit: BoxFit.cover);
                  },
                  fit: BoxFit.cover,
                ),
              )
            : widget.images.length == 2
                ? StaggeredGrid.count(
                    crossAxisCount: 4,
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 2,
                    children: [
                      StaggeredGridTile.count(
                        crossAxisCellCount: 4,
                        mainAxisCellCount: 2,
                        child: GestureDetector(
                          child: AspectRatio(
                            aspectRatio: 3 / 2,
                            child: FadeInImage.assetNetwork(
                              image:
                                  '${Constant.baseURL}imgtopics/${widget.images[0].id}.jpg',
                              placeholder: 'images/placeholder.png',
                              imageErrorBuilder: (context, error, stackTrace) {
                                return Image.asset('images/placeholder.png',
                                    fit: BoxFit.cover);
                              },
                              fit: BoxFit.cover,
                            ),
                          ),
                          onTap: () {
                            context.navigateTo(TopicImages(
                              images: widget.images,
                              initial: 0,
                            ));
                          },
                        ),
                      ),
                      StaggeredGridTile.count(
                        crossAxisCellCount: 4,
                        mainAxisCellCount: 2,
                        child: GestureDetector(
                          child: AspectRatio(
                            aspectRatio: 3 / 2,
                            child: FadeInImage.assetNetwork(
                              image:
                                  '${Constant.baseURL}imgtopics/${widget.images[1].id}.jpg',
                              placeholder: 'images/placeholder.png',
                              imageErrorBuilder: (context, error, stackTrace) {
                                return Image.asset('images/placeholder.png',
                                    fit: BoxFit.cover);
                              },
                              fit: BoxFit.cover,
                            ),
                          ),
                          onTap: () {
                            context.navigateTo(TopicImages(
                              images: widget.images,
                              initial: 1,
                            ));
                          },
                        ),
                      ),
                    ],
                  )
                : widget.images.length == 3
                    ? StaggeredGrid.count(
                        crossAxisCount: 4,
                        mainAxisSpacing: 4,
                        crossAxisSpacing: 2,
                        children: [
                          StaggeredGridTile.count(
                            crossAxisCellCount: 4,
                            mainAxisCellCount: 2,
                            child: GestureDetector(
                              child: FadeInImage.assetNetwork(
                                image:
                                    '${Constant.baseURL}imgtopics/${widget.images[0].id}.jpg',
                                placeholder: 'images/placeholder.png',
                                imageErrorBuilder:
                                    (context, error, stackTrace) {
                                  return Image.asset('images/placeholder.png',
                                      fit: BoxFit.fill);
                                },
                                fit: BoxFit.fill,
                              ),
                              onTap: () {
                                context.navigateTo(TopicImages(
                                  images: widget.images,
                                  initial: 0,
                                ));
                              },
                            ),
                          ),
                          StaggeredGridTile.count(
                            crossAxisCellCount: 2,
                            mainAxisCellCount: 2,
                            child: GestureDetector(
                              child: FadeInImage.assetNetwork(
                                image:
                                    '${Constant.baseURL}imgtopics/${widget.images[1].id}.jpg',
                                placeholder: 'images/placeholder.png',
                                imageErrorBuilder:
                                    (context, error, stackTrace) {
                                  return Image.asset('images/placeholder.png',
                                      fit: BoxFit.fill);
                                },
                                fit: BoxFit.fill,
                              ),
                              onTap: () {
                                context.navigateTo(TopicImages(
                                  images: widget.images,
                                  initial: 1,
                                ));
                              },
                            ),
                          ),
                          StaggeredGridTile.count(
                            crossAxisCellCount: 2,
                            mainAxisCellCount: 2,
                            child: GestureDetector(
                              child: FadeInImage.assetNetwork(
                                image:
                                    '${Constant.baseURL}imgtopics/${widget.images[2].id}.jpg',
                                placeholder: 'images/placeholder.png',
                                imageErrorBuilder:
                                    (context, error, stackTrace) {
                                  return Image.asset('images/placeholder.png',
                                      fit: BoxFit.fill);
                                },
                                fit: BoxFit.fill,
                              ),
                              onTap: () {
                                context.navigateTo(TopicImages(
                                  images: widget.images,
                                  initial: 2,
                                ));
                              },
                            ),
                          ),
                        ],
                      )
                    : widget.images.length >= 4
                        ? StaggeredGrid.count(
                            crossAxisCount: 3,
                            mainAxisSpacing: 4,
                            crossAxisSpacing: 2,
                            children: [
                              StaggeredGridTile.count(
                                crossAxisCellCount: 4,
                                mainAxisCellCount: 2,
                                child: GestureDetector(
                                  child: FadeInImage.assetNetwork(
                                    image:
                                        '${Constant.baseURL}imgtopics/${widget.images[0].id}.jpg',
                                    placeholder: 'images/placeholder.png',
                                    imageErrorBuilder:
                                        (context, error, stackTrace) {
                                      return Image.asset(
                                          'images/placeholder.png',
                                          fit: BoxFit.fill);
                                    },
                                    fit: BoxFit.fill,
                                  ),
                                  onTap: () {
                                    context.navigateTo(TopicImages(
                                      images: widget.images,
                                      initial: 0,
                                    ));
                                  },
                                ),
                              ),
                              StaggeredGridTile.count(
                                crossAxisCellCount: 1,
                                mainAxisCellCount: 1,
                                child: GestureDetector(
                                  child: FadeInImage.assetNetwork(
                                    image:
                                        '${Constant.baseURL}imgtopics/${widget.images[1].id}.jpg',
                                    placeholder: 'images/placeholder.png',
                                    imageErrorBuilder:
                                        (context, error, stackTrace) {
                                      return Image.asset(
                                          'images/placeholder.png',
                                          fit: BoxFit.cover);
                                    },
                                    fit: BoxFit.cover,
                                  ),
                                  onTap: () {
                                    context.navigateTo(TopicImages(
                                      images: widget.images,
                                      initial: 1,
                                    ));
                                  },
                                ),
                              ),
                              StaggeredGridTile.count(
                                crossAxisCellCount: 1,
                                mainAxisCellCount: 1,
                                child: GestureDetector(
                                  child: FadeInImage.assetNetwork(
                                    image:
                                        '${Constant.baseURL}imgtopics/${widget.images[2].id}.jpg',
                                    placeholder: 'images/placeholder.png',
                                    imageErrorBuilder:
                                        (context, error, stackTrace) {
                                      return Image.asset(
                                          'images/placeholder.png',
                                          fit: BoxFit.cover);
                                    },
                                    fit: BoxFit.cover,
                                  ),
                                  onTap: () {
                                    context.navigateTo(TopicImages(
                                      images: widget.images,
                                      initial: 2,
                                    ));
                                  },
                                ),
                              ),
                              StaggeredGridTile.count(
                                crossAxisCellCount: 1,
                                mainAxisCellCount: 1,
                                child: GestureDetector(
                                  child: Stack(
                                    fit: StackFit.expand,
                                    children: [
                                      Positioned(
                                        child: FadeInImage.assetNetwork(
                                          image:
                                              '${Constant.baseURL}imgtopics/${widget.images[3].id}.jpg',
                                          placeholder: 'images/placeholder.png',
                                          imageErrorBuilder:
                                              (context, error, stackTrace) {
                                            return Image.asset(
                                                'images/placeholder.png',
                                                fit: BoxFit.cover);
                                          },
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      widget.images.length > 4
                                          ? Container(
                                              height: double.infinity,
                                              width: double.infinity,
                                              color: Colors.black54,
                                              child: Center(
                                                child: Text(
                                                  '+${widget.images.length - 3}',
                                                  style: const TextStyle(
                                                      fontSize: 30,
                                                      color: Colors.white),
                                                ),
                                              ))
                                          : const SizedBox()
                                    ],
                                  ),
                                  onTap: () {
                                    context.navigateTo(TopicImages(
                                      images: widget.images,
                                      initial: 3,
                                    ));
                                  },
                                ),
                              ),
                            ],
                          )
                        : const SizedBox());
  }
}
