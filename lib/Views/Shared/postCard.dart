import 'package:canadianslife/Controllers/TopicController.dart';
import 'package:canadianslife/Extinsions/extensions.dart';
import 'package:canadianslife/Managers/LayoutManager.dart';
import 'package:canadianslife/Models/Topic.dart';
import 'package:canadianslife/Models/User.dart';
import 'package:canadianslife/Views/GroupDetailsView.dart';
import 'package:canadianslife/Views/Shared/InteractiveIcon.dart';
import 'package:canadianslife/Views/topicView.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:canadianslife/Helper/Constants.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
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
              const Align(
                alignment: Alignment.topLeft,
                child: Text("10 د",
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.normal,
                      fontSize: 13,
                    )),
              ),
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Image.asset("images/person.png"),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    topicInfo.user!.displayName,
                    style: const TextStyle(
                      color: appDesign.colorAccent,
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
              //todo handel many image case
              SizedBox(
                height: 300,
                width: double.infinity,
                child: StaggeredGrid.count(
                  crossAxisCount: 5,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 2,
                  children: [
                    StaggeredGridTile.count(
                      crossAxisCellCount: 2,
                      mainAxisCellCount: 3,
                      child: GestureDetector(
                        child: Container(
                          color: Colors.red,
                        ),
                        onTap: () {
                          print("Click on red one");
                        },
                      ),
                    ),
                    StaggeredGridTile.count(
                      crossAxisCellCount: 3,
                      mainAxisCellCount: 2,
                      child: Container(
                        color: Colors.green,
                      ),
                    ),
                    StaggeredGridTile.count(
                      crossAxisCellCount: 3,
                      mainAxisCellCount: 1,
                      child: Container(
                        color: Colors.yellow,
                      ),
                    ),
                    StaggeredGridTile.count(
                        crossAxisCellCount: 2,
                        mainAxisCellCount: 2,
                        child: Container(
                          color: Colors.purple,
                          child: const Stack(
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
                                child: Center(
                                  child: Text(
                                    "2+",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )),
                    StaggeredGridTile.count(
                      crossAxisCellCount: 3,
                      mainAxisCellCount: 2,
                      child: Container(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                // child: Image(image: AssetImage("images/placeholder.png")),
              ),
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
                  context.navigateTo(GroupDetails(groupInfo: topicInfo.group!));
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 8, right: 10),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.groups,
                        color: Color(0xFF088395),
                      ),
                      const SizedBox(width: 15),
                      Text(
                        topicInfo.group!.name,
                        style: const TextStyle(
                          color: Color(0xFF088395),
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
                thickness: 1, // Specify the thickness of the line
              ),
              // ---------OLD-------------
              // Padding(
              //   padding: EdgeInsets.symmetric(
              //       horizontal: layoutManager.valuesHandler(0, 0, 20, 20)),
              //   child: Row(
              //     children: [
              //       Expanded(
              //           child: InteractiveIcon(
              //               icon: Icons.thumb_up_alt_outlined, text: "50")),
              //       Spacer(
              //           flex: layoutManager.valuesHandler(2, 1, 2, 2).toInt()),
              //       Expanded(
              //         child: InteractiveIcon(
              //           icon: Icons.message_outlined,
              //           text: "20",
              //           onPressed: () {},
              //         ),
              //       ),
              //       Spacer(
              //           flex: layoutManager.valuesHandler(2, 1, 2, 2).toInt()),
              //       Expanded(
              //           child: InteractiveIcon(
              //               icon: Icons.bookmark_border_outlined, text: "")),
              //     ],
              //   ),
              // ),
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
                        color: const Color(0xFF0A4D68),
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
                        color: const Color(0xFF0A4D68),
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
                        color: const Color(0xFF0A4D68),
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
  }
}
