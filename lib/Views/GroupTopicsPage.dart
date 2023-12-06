import 'package:canadianslife/Controllers/TopicController.dart';
import 'package:canadianslife/Helper/Constants.dart';
import 'package:canadianslife/Managers/LayoutManager.dart';
import 'package:canadianslife/Models/Topic.dart';
import 'package:canadianslife/Views/Shared/SearchBar.dart';
import 'package:canadianslife/Views/Shared/addPostPopUp.dart';
import 'package:canadianslife/Views/Shared/postCard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GroupTopicsPage extends StatefulWidget {
  const GroupTopicsPage({super.key, required this.groupId});
  final int groupId;

  @override
  State<GroupTopicsPage> createState() => _GroupTopicsPageState();
}

class _GroupTopicsPageState extends State<GroupTopicsPage> {
  @override
  void initState() {
    super.initState();
    getTopics();
  }

  refresh() {
    setState(() {
      isLoading = true;
      getTopics();
    });
  }

  void showAddPostPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AddPostPopup(
          groupId: widget.groupId,
          refresh: refresh,
        );
      },
    );
  }

  List<Topic>? topics;
  bool isLoading = true;

  getTopics() async {
    topics = await TopicController().topicsGetByGroupId(widget.groupId,
        Provider.of<UserData>(context, listen: false).userInfo.id, 0);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final layoutManager = LayoutManager(context);
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: layoutManager.mainHorizontalPadding(), vertical: 10),
      child: Column(
        children: [
          const CustomSearchBar(hintText: "البحث في المجموعة"),
          const SizedBox(height: 10),
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
                    },
                  ),
                ),
              ],
            ),
          ),
          isLoading
              ? const Center(child: CircularProgressIndicator())
              : topics!.isEmpty
                  ? const Center(child: Text('لا يوجد منشورات'))
                  : Column(
                      children: [
                        ...topics!.map((e) => Post(
                              topicInfo: e,
                            )),
                      ],
                    ),
        ],
      ),
    );
  }
}
