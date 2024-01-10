import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class StaggeredGridTopicCreate extends StatefulWidget {
  const StaggeredGridTopicCreate({super.key, required this.images});
  final List<String> images;

  @override
  State<StaggeredGridTopicCreate> createState() =>
      _StaggeredGridTopicCreateState();
}

class _StaggeredGridTopicCreateState extends State<StaggeredGridTopicCreate> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        // height: 400,
        width: double.infinity,
        child: widget.images.length == 1
            ? Image.memory(
                base64Decode(widget.images[0]),
                fit: BoxFit.contain,
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
                            child: Image.memory(
                              base64Decode(widget.images[0]),
                              fit: BoxFit.cover,
                            ),
                          ),
                          onTap: () {},
                        ),
                      ),
                      StaggeredGridTile.count(
                        crossAxisCellCount: 4,
                        mainAxisCellCount: 2,
                        child: GestureDetector(
                          child: AspectRatio(
                            aspectRatio: 3 / 2,
                            child: Image.memory(
                              base64Decode(widget.images[1]),
                              fit: BoxFit.cover,
                            ),
                          ),
                          onTap: () {},
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
                              child: Image.memory(
                                base64Decode(widget.images[0]),
                                fit: BoxFit.cover,
                              ),
                              onTap: () {},
                            ),
                          ),
                          StaggeredGridTile.count(
                            crossAxisCellCount: 2,
                            mainAxisCellCount: 2,
                            child: GestureDetector(
                              child: Image.memory(
                                base64Decode(widget.images[1]),
                                fit: BoxFit.cover,
                              ),
                              onTap: () {},
                            ),
                          ),
                          StaggeredGridTile.count(
                            crossAxisCellCount: 2,
                            mainAxisCellCount: 2,
                            child: GestureDetector(
                              child: Image.memory(
                                base64Decode(widget.images[2]),
                                fit: BoxFit.cover,
                              ),
                              onTap: () {},
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
                                  child: Image.memory(
                                    base64Decode(widget.images[0]),
                                    fit: BoxFit.cover,
                                  ),
                                  onTap: () {},
                                ),
                              ),
                              StaggeredGridTile.count(
                                crossAxisCellCount: 1,
                                mainAxisCellCount: 1,
                                child: GestureDetector(
                                  child: Image.memory(
                                    base64Decode(widget.images[1]),
                                    fit: BoxFit.cover,
                                  ),
                                  onTap: () {},
                                ),
                              ),
                              StaggeredGridTile.count(
                                crossAxisCellCount: 1,
                                mainAxisCellCount: 1,
                                child: GestureDetector(
                                  child: Image.memory(
                                    base64Decode(widget.images[2]),
                                    fit: BoxFit.cover,
                                  ),
                                  onTap: () {},
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
                                        child: Image.memory(
                                          base64Decode(widget.images[3]),
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
                                  onTap: () {},
                                ),
                              ),
                            ],
                          )
                        : const SizedBox());
  }
}
