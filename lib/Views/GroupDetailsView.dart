import 'package:canadianslife/Controllers/TopicController.dart';
import 'package:canadianslife/Helper/Constants.dart';
import 'package:canadianslife/Models/Group.dart';
import 'package:canadianslife/Models/Topic.dart';
import 'package:canadianslife/Views/Shared/SearchBar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Managers/LayoutManager.dart';
import 'Shared/addPostPopUp.dart';
import 'Shared/postCard.dart';

class GroupDetails extends StatefulWidget {
  const GroupDetails({Key? key, required this.groupInfo}) : super(key: key);
  final Group groupInfo;
  @override
  State<GroupDetails> createState() => _GroupDetailsState();
}

class _GroupDetailsState extends State<GroupDetails> {
  @override
  void initState() {
    super.initState();
    getTopics();
  }

  void showAddPostPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AddPostPopup(
          groupId: widget.groupInfo.id,
          refresh: refresh,
        );
      },
    );
  }

  refresh() {
    topics = null;
    setState(() {
      getTopics();
    });
  }

  List<Topic>? topics;

  getTopics() async {
    List<Topic>? groupTopics = await TopicController().topicsGetByGroupId(
        widget.groupInfo.id,
        Provider.of<UserData>(context, listen: false).userInfo.id,
        0);
    setState(() {
      topics = groupTopics;
    });
  }

  @override
  Widget build(BuildContext context) {
    final layoutManager = LayoutManager(context);

    return Scaffold(
      body: ListView(
        children: [
          AspectRatio(
            aspectRatio:
                layoutManager.valuesHandler(20 / 7, 20 / 7, 40 / 7, 40 / 7),
            child: const Image(
              image: AssetImage("images/placeholder.png"),
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 7,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: layoutManager.mainHorizontalPadding()),
            child: Column(
              children: [
                Text(
                  widget.groupInfo.name,
                  style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: appDesign.colorPrimaryDark),
                ),
                const SizedBox(
                  height: 7,
                ),
                const CustomSearchBar(hintText: "البحث في المجموعة"),
                const SizedBox(
                  height: 7,
                ),
                SizedBox(
                  height: 50,
                  child: Row(
                    children: [
                      const CircleAvatar(
                        backgroundImage: AssetImage("images/defultPerson.png"),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: TextField(
                          readOnly: true,
                          decoration: const InputDecoration(
                            hintText: 'ابدأ بالنشر الآن...',
                            border: InputBorder.none,
                          ),
                          onTap: () {
                            showAddPostPopup(context);
                            print("Tapped");
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(
            height: 1,
            thickness: 1,
            color: appDesign.colorPrimaryDark.withAlpha(65),
          ),
          topics != null
              ? topics!.isEmpty
                  ? const Center(child: Text('لا يوجد منشورات'))
                  : Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: layoutManager.mainHorizontalPadding()),
                      child: Column(
                        children: [
                          ...topics!.map((e) => Post(
                                topicInfo: e,
                              )),
                        ],
                      ),
                    )
              : const Center(child: CircularProgressIndicator()),
        ],
      ),
    );

    // return Scaffold(
    //   body: ListView.builder(
    //       itemCount: 4,
    //       itemBuilder: (context, index) {
    //         return index == 0
    //             ? Column(
    //                 children: [
    //                   AspectRatio(
    //                     aspectRatio: layoutManager.valuesHandler(
    //                         20 / 7, 20 / 7, 40 / 7, 40 / 7),
    //                     child: const Image(
    //                       image: AssetImage("images/placeholder.png"),
    //                       fit: BoxFit.cover,
    //                     ),
    //                   ),
    //                   const SizedBox(
    //                     height: 7,
    //                   ),
    //                   Padding(
    //                     padding: EdgeInsets.symmetric(
    //                         horizontal: layoutManager.mainHorizontalPadding()),
    //                     child: Column(
    //                       children: [
    //                         Text(
    //                           widget.groupInfo.name,
    //                           style: const TextStyle(
    //                               fontSize: 28,
    //                               fontWeight: FontWeight.bold,
    //                               color: appDesign.colorPrimaryDark),
    //                         ),
    //                         const SizedBox(
    //                           height: 7,
    //                         ),
    //                         const CustomSearchBar(
    //                             hintText: "البحث في المجموعة"),
    //                         const SizedBox(
    //                           height: 7,
    //                         ),
    //                         Container(
    //                           height: 50,
    //                           child: Row(
    //                             children: [
    //                               const CircleAvatar(
    //                                 backgroundImage:
    //                                     AssetImage("images/defultPerson.png"),
    //                               ),
    //                               const SizedBox(
    //                                 width: 10,
    //                               ),
    //                               Expanded(
    //                                 child: TextField(
    //                                   readOnly: true,
    //                                   decoration: const InputDecoration(
    //                                     hintText: 'ابدأ بالنشر الآن...',
    //                                     border: InputBorder.none,
    //                                   ),
    //                                   onTap: () {
    //                                     showAddPostPopup(context);
    //                                     print("Tapped");
    //                                   },
    //                                 ),
    //                               ),
    //                             ],
    //                           ),
    //                         ),
    //                         Divider(
    //                           height: 1,
    //                           thickness: 1,
    //                           color: appDesign.colorPrimaryDark.withAlpha(65),
    //                         ),
    //                         Post()
    //                       ],
    //                     ),
    //                   )
    //                 ],
    //               )
    //             : Padding(
    //                 padding: EdgeInsets.symmetric(
    //                     horizontal: layoutManager.mainHorizontalPadding()),
    //                 child: Post(),
    //               );
    //       }),
    // );
  }
}
