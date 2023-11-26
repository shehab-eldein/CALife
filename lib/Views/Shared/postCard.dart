import 'package:canadianslife/Extinsions/extensions.dart';
import 'package:canadianslife/Managers/LayoutManager.dart';
import 'package:canadianslife/Models/Topic.dart';
import 'package:canadianslife/Models/User.dart';
import 'package:canadianslife/Views/Shared/InteractiveIcon.dart';
import 'package:canadianslife/Views/topicView.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:canadianslife/Helper/Constants.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Post extends StatefulWidget {
  // final Topic topicInfo;
  Post({
    Key? key,
    // required this.topicInfo
  }) : super(key: key);

  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
  @override
  Widget build(BuildContext context) {
    LayoutManager layoutManager = LayoutManager(context);

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
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Align(
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
                  ),
                  SizedBox(width: 16),
                  Text(
                    "اسم المستخدم",
                    style: TextStyle(
                      color: appDesign.colorAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  "محتوي المنشور، محتوي المنشور، محتوي المنشور، محتوي المنشور، محتوي المنشور، محتوي المنشور،  ",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 4,
                ),
              ),
              //todo handel many image case
              Container(
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
                          child: Stack(
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
                // child: Image(
                //     image: AssetImage("images/placeholder.png")
                // ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                child: Row(
                  children: [
                    Icon(
                      Icons.pin_drop,
                      color: appDesign.colorAccent,
                    ),
                    SizedBox(width: 5),
                    Text(
                      "ألبرتا، كندا",
                      style: TextStyle(
                        color: appDesign.colorAccent,
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                color: Colors.grey.shade300,
                thickness: 1, // Specify the thickness of the line
              ),

              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: layoutManager.valuesHandler(0, 0, 20, 20)),
                child: Row(
                  children: [
                    Expanded(
                        child: InteractiveIcon(
                            icon: Icons.thumb_up_alt_outlined, text: "50")),
                    Spacer(
                        flex: layoutManager.valuesHandler(2, 1, 2, 2).toInt()),
                    Expanded(
                      child: InteractiveIcon(
                        icon: Icons.message_outlined,
                        text: "20",
                        onPressed: () {
                          context.navigateTo(TopicView(
                            topicInfo: Topic(
                              id: 11,
                              title: "title",
                              details:
                                  'محتوي المنشور، محتوي المنشور، محتوي المنشور، محتوي المنشور، محتوي المنشور، محتوي المنشور،  ',
                              isPinned: true,
                              groupId: 2,
                              userId: 0,
                              user: User(
                                  id: 0,
                                  displayName: "اسم المستخدم",
                                  fullName: "fullName",
                                  email: "email",
                                  password: "password"),
                            ),
                          ));
                        },
                      ),
                    ),
                    Spacer(
                        flex: layoutManager.valuesHandler(2, 1, 2, 2).toInt()),
                    Expanded(
                        child: InteractiveIcon(
                            icon: Icons.bookmark_border_outlined, text: "")),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
