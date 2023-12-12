import 'package:canadianslife/Controllers/TopicController.dart';
import 'package:canadianslife/Extinsions/extensions.dart';
import 'package:canadianslife/Models/Topic.dart';
import 'package:canadianslife/Views/GroupDetailsView.dart';
import 'package:canadianslife/Views/topicView.dart';
import 'package:flutter/material.dart';
import 'package:canadianslife/Helper/Constants.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class Post extends StatefulWidget {
  final Topic topicInfo;
  Post({
    Key? key,
    required this.topicInfo,
  }) : super(key: key);

  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    topicInfo = widget.topicInfo;
  }

  late Topic topicInfo;
  toggleLike() async {
    topicInfo.isUserLikedTopic == false
        ? await TopicController()
            .topicLikeAdd(topicInfo.id,
                Provider.of<UserData>(context, listen: false).userInfo.id)
            .then((value) {
            if (value == true) {
              setState(() {
                topicInfo.isUserLikedTopic = true;
                topicInfo.likesNo = (topicInfo.likesNo! + 1);
              });
            }
          })
        : await TopicController()
            .topicLikeDelete(topicInfo.id,
                Provider.of<UserData>(context, listen: false).userInfo.id)
            .then((value) {
            if (value == true) {
              setState(() {
                topicInfo.isUserLikedTopic = false;
                topicInfo.likesNo = (topicInfo.likesNo! - 1);
              });
            }
          });
  }

  @override
  Widget build(BuildContext context) {
    // LayoutManager layoutManager = LayoutManager(context);

    return Consumer<UserData>(builder: (context, userData, child) {
      bool isArabic = userData.userLanguage == "ar" ? true : false;
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Material(
          elevation: 2,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: isArabic ? Alignment.topLeft : Alignment.topRight,
                  child: Text("10 ${isArabic ? "د" : "m"}",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.normal,
                        fontSize: 13,
                      )),
                ),
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(200),
                      child: FadeInImage(
                        height: 45,
                        width: 45,
                        image: NetworkImage(
                            '${Constant.baseURL}imgusers/${topicInfo.user!.id}.jpg'),
                        placeholder: const AssetImage(
                          'images/person.png',
                        ),
                        imageErrorBuilder: (context, error, stackTrace) {
                          return Image.asset(
                            'images/person.png',
                            fit: BoxFit.fill,
                            height: 45,
                            width: 45,
                          );
                        },
                        fit: BoxFit.fill,
                      ),
                    ),
                    // CircleAvatar(
                    //   backgroundColor: Colors.grey,
                    //   child: Image.asset("images/person.png"),
                    // ),
                    const SizedBox(width: 16),
                    Text(
                      topicInfo.user!.displayName,
                      style: const TextStyle(
                        color: appDesign.colorAccentDarker,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    topicInfo.details,
                    overflow: TextOverflow.ellipsis,
                    textDirection: TextDirection.ltr,
                    maxLines: 4,
                  ),
                ),
                widget.topicInfo.images!.isNotEmpty
                    ? AspectRatio(
                        aspectRatio: 9 / 6,
                        child: FadeInImage.assetNetwork(
                          image:
                              '${Constant.baseURL}imgtopics/${widget.topicInfo.images![0].id}.jpg',
                          placeholder: 'images/placeholder.png',
                          imageErrorBuilder: (context, error, stackTrace) {
                            return Image.asset('images/placeholder.png',
                                fit: BoxFit.contain);
                          },
                          fit: BoxFit.contain,
                        ),
                      )
                    : const SizedBox(),
                // SizedBox(
                //   height: 300,
                //   width: double.infinity,
                //   child: StaggeredGrid.count(
                //     crossAxisCount: 5,
                //     mainAxisSpacing: 5,
                //     crossAxisSpacing: 2,
                //     children: [
                //       StaggeredGridTile.count(
                //         crossAxisCellCount: 2,
                //         mainAxisCellCount: 3,
                //         child: GestureDetector(
                //           child: Container(
                //             color: Colors.red,
                //           ),
                //           onTap: () {
                //             print("Click on red one");
                //           },
                //         ),
                //       ),
                //       StaggeredGridTile.count(
                //         crossAxisCellCount: 3,
                //         mainAxisCellCount: 2,
                //         child: Container(
                //           color: Colors.green,
                //         ),
                //       ),
                //       StaggeredGridTile.count(
                //         crossAxisCellCount: 3,
                //         mainAxisCellCount: 1,
                //         child: Container(
                //           color: Colors.yellow,
                //         ),
                //       ),
                //       StaggeredGridTile.count(
                //           crossAxisCellCount: 2,
                //           mainAxisCellCount: 2,
                //           child: Container(
                //             color: Colors.purple,
                //             child: const Stack(
                //               children: [
                //                 Padding(
                //                   padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
                //                   child: Center(
                //                     child: Text(
                //                       "2+",
                //                       style: TextStyle(
                //                         color: Colors.white,
                //                         fontSize: 30,
                //                         fontWeight: FontWeight.bold,
                //                       ),
                //                     ),
                //                   ),
                //                 )
                //               ],
                //             ),
                //           )),
                //       StaggeredGridTile.count(
                //         crossAxisCellCount: 3,
                //         mainAxisCellCount: 2,
                //         child: Container(
                //           color: Colors.grey,
                //         ),
                //       ),
                //     ],
                //   ),
                //   // child: Image(image: AssetImage("images/placeholder.png")),
                // ),

                // const Padding(
                //   padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                //   child: Row(
                //     children: [
                //       Icon(
                //         Icons.pin_drop,
                //         color: appDesign.colorAccent,
                //       ),
                //       SizedBox(width: 5),
                //       Text(
                //         "ألبرتا، كندا",
                //         style: TextStyle(
                //           color: appDesign.colorAccent,
                //           fontWeight: FontWeight.w600,
                //           fontSize: 13,
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                InkWell(
                  onTap: () {
                    context
                        .navigateTo(GroupDetails(groupInfo: topicInfo.group!));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8, right: 5, left: 5),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.groups,
                          color: appDesign.colorAccentDarker,
                        ),
                        const SizedBox(width: 15),
                        Text(
                          topicInfo.group!.name,
                          style: const TextStyle(
                            color: appDesign.colorAccentDarker,
                            fontSize: 13,
                            fontFamily: '.SF Arabic',
                            fontWeight: FontWeight.w600,
                            height: 0.12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(
                  color: Colors.grey.shade300,
                  thickness: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            toggleLike();
                          },
                          icon: topicInfo.isUserLikedTopic == true
                              ? const Icon(Icons.thumb_up_alt)
                              : const Icon(Icons.thumb_up_alt_outlined),
                          color: appDesign.colorPrimaryDark,
                        ),
                        Text(
                          topicInfo.likesNo.toString(),
                          style: const TextStyle(
                            color: Color(0xFF676D7A),
                            fontSize: 15,
                            fontFamily: 'SF Pro',
                            fontWeight: FontWeight.w500,
                            height: 0.09,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            context.navigateTo(TopicView(topicInfo: topicInfo));
                          },
                          icon: const Icon(Icons.message_outlined),
                          color: appDesign.colorPrimaryDark,
                        ),
                        Text(
                          topicInfo.commentsNo.toString(),
                          style: const TextStyle(
                            color: Color(0xFF676D7A),
                            fontSize: 15,
                            fontFamily: 'SF Pro',
                            fontWeight: FontWeight.w500,
                            height: 0.09,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.share),
                          color: appDesign.colorPrimaryDark,
                        ),
                        const Text(
                          '99',
                          style: TextStyle(
                            color: Color(0xFF676D7A),
                            fontSize: 15,
                            fontFamily: 'SF Pro',
                            fontWeight: FontWeight.w500,
                            height: 0.09,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
