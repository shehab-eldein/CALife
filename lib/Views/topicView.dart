import 'package:canadianslife/Controllers/TopicController.dart';
import 'package:canadianslife/Extinsions/extensions.dart';
import 'package:canadianslife/Helper/responsive.dart';
import 'package:canadianslife/Managers/LayoutManager.dart';
import 'package:canadianslife/Models/Topic.dart';
import 'package:canadianslife/Models/TopicComment.dart';
import 'package:canadianslife/Views/GroupDetailsView.dart';
import 'package:canadianslife/Views/Shared/commentCard.dart';
import 'package:flutter/material.dart';
import 'package:canadianslife/Helper/Constants.dart';
import 'package:provider/provider.dart';

class TopicView extends StatefulWidget {
  const TopicView({
    super.key,
    required this.topicInfo,
  });
  final Topic topicInfo;

  @override
  State<TopicView> createState() => _TopicViewState();
}

class _TopicViewState extends State<TopicView> {
  TextEditingController textController = TextEditingController();
  final FocusNode textFocusNode = FocusNode();
  final ScrollController scrollController = ScrollController();
  late Topic topicInfo;

  @override
  void initState() {
    super.initState();
    topicInfo = widget.topicInfo;
    getTopicComments();
  }

  List<TopicComment>? comments = [];
  bool isLoading = true;

  getTopicComments() async {
    setState(() {
      isLoading = true;
    });
    List<TopicComment>? res =
        await TopicController().topicCommentsGetByTopicId(topicInfo.id, 0);
    setState(() {
      comments = res;
      isLoading = false;
    });
  }

  addComment() async {
    await TopicController()
        .topicCommentAdd(textController.text, topicInfo.id,
            Provider.of<UserData>(context, listen: false).userInfo.id)
        .then((value) => getTopicComments());
    textController.text = "";
  }

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

  void scrollDown() {
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: const Duration(seconds: 2),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    final layoutManager = LayoutManager(context);
    return Scaffold(
      body: ListView(
        controller: scrollController,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: layoutManager.mainHorizontalPadding(),
                vertical: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        '10 د',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: appDesign.colorUnhighlighted,
                          fontSize: 15,
                          fontFamily: 'SF Pro',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      )),
                ),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      child: Image.asset("images/person.png"),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Text(
                      topicInfo.user!.displayName,
                      style: const TextStyle(
                        color: appDesign.colorAccentDarker,
                        fontSize: 17,
                        fontFamily: '.SF Arabic',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                    const Spacer(),
                    Column(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.more_horiz),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  topicInfo.details,
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    color: Color(0xFF263238),
                    fontSize: 17,
                    fontFamily: '.SF Arabic',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
              ],
            ),
          ),
          AspectRatio(
            aspectRatio: 3 / 2,
            child: Image.asset("images/placeholder.png"),
          ),
          InkWell(
            onTap: () {
              context.navigateTo(GroupDetails(groupInfo: topicInfo.group!));
            },
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10),
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
          Container(
            decoration: const BoxDecoration(
              border: Border.symmetric(
                horizontal: BorderSide(
                  color: Colors.grey,
                  width: 0.5,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        toggleLike();
                      },
                      icon: widget.topicInfo.isUserLikedTopic == true
                          ? const Icon(Icons.thumb_up_alt)
                          : const Icon(Icons.thumb_up_alt_outlined),
                      color: appDesign.colorPrimaryDark,
                    ),
                    Text(
                      widget.topicInfo.likesNo.toString(),
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
                        scrollDown();
                        textFocusNode.requestFocus();
                      },
                      icon: const Icon(Icons.message_outlined),
                      color: appDesign.colorPrimaryDark,
                    ),
                    Text(
                      comments!.length.toString(),
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
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.bookmark_outline_rounded),
                  color: appDesign.colorPrimaryDark,
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
          ),
          // const Padding(
          //   padding: EdgeInsets.only(top: 10, right: 15, bottom: 10),
          //   child: Row(
          //     children: [
          //       Icon(
          //         Icons.list,
          //         color: appDesign.colorAccent,
          //       ),
          //       SizedBox(width: 15),
          //       Text(
          //         'ترتيب حسب',
          //         style: TextStyle(
          //           color: appDesign.colorAccent,
          //           fontSize: 17,
          //           fontFamily: 'SF Pro',
          //           fontWeight: FontWeight.w600,
          //           height: 0,
          //         ),
          //       )
          //     ],
          //   ),
          // ),
          !isLoading
              ? Column(
                  children: [
                    ...comments!.map(
                      (e) => CommentCard(
                        commentInfo: e,
                      ),
                    ),
                  ],
                )
              : const Center(child: CircularProgressIndicator()),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: Dimensions.widthPercentage(context, 80),
                child: TextField(
                  // autofocus: true,
                  controller: textController,
                  focusNode: textFocusNode,
                  style: const TextStyle(height: 1),
                  decoration: InputDecoration(
                    hintText: "ابدأ بكاتبة تعليقك الآن",
                    hintStyle: TextStyle(
                      color: Colors.grey.shade500,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide:
                          const BorderSide(color: appDesign.colorPrimary),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: appDesign.colorAccent,
                ),
                child: Transform.rotate(
                  angle: 45 * 3.14 / 180,
                  child: IconButton(
                    onPressed: () {
                      addComment();
                    },
                    icon: const Icon(Icons.send_outlined),
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
