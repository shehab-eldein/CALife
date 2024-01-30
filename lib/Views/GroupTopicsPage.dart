import 'package:canadianslife/Controllers/GroupController.dart';
import 'package:canadianslife/Controllers/TopicController.dart';
import 'package:canadianslife/Extinsions/extensions.dart';
import 'package:canadianslife/Helper/Constants.dart';
import 'package:canadianslife/Managers/LayoutManager.dart';
import 'package:canadianslife/Models/Topic.dart';
import 'package:canadianslife/Views/Shared/SearchBar.dart';
import 'package:canadianslife/Views/Shared/addPostPopUp.dart';
import 'package:canadianslife/Views/Shared/postCard.dart';
import 'package:canadianslife/Views/createPost.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class GroupTopicsPage extends StatefulWidget {
  const GroupTopicsPage(
      {super.key,
      required this.groupId,
      required this.groupName,
      required this.isNotSubed,
      this.refresh});
  final int groupId;
  final String groupName;
  final Function? refresh;
  final bool isNotSubed;

  @override
  State<GroupTopicsPage> createState() => _GroupTopicsPageState();
}

class _GroupTopicsPageState extends State<GroupTopicsPage> {
  @override
  void initState() {
    super.initState();
    getTopics();
  }

  postAndSub() async {
    setState(() {
      isLoading = true;
    });
    if (widget.isNotSubed) {
      await GroupController().subscribeToGroup(widget.groupId,
          Provider.of<UserData>(context, listen: false).userInfo.id);
      var snackBar = SnackBar(
        // ignore: use_build_context_synchronously
        content: Text(AppLocalizations.of(context)!.postSubed),
      );
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      widget.refresh!();
    }
    getTopics();
  }

  void showAddPostPopup(BuildContext context) {
    // showDialog(
    //   context: context,
    //   builder: (BuildContext context) {
    // return AddPostPopup(
    //       groupId: widget.groupId,
    //       refresh: postAndSub,
    //     );
    //   },
    // );
    context.navigateTo(CreatePostView(
        refresh: postAndSub,
        groupId: widget.groupId,
        groupName: widget.groupName));
  }

  List<Topic>? topics;
  bool isLoading = true;
  TextEditingController controller = TextEditingController();

  getTopics() async {
    setState(() {
      isLoading = true;
    });
    topics = await TopicController().topicsGetByGroupId(
        widget.groupId,
        Provider.of<UserData>(context, listen: false).userInfo.id,
        controller.text,
        0);
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
          CustomSearchBar(
              controller: controller,
              onSearchPressed: getTopics,
              hintText: AppLocalizations.of(context)!.searchTopics),
          const SizedBox(height: 10),
          UserData().isLoggedIn()
              ? SizedBox(
                  height: 50,
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(200),
                        child: FadeInImage(
                          height: 45,
                          width: 45,
                          image: NetworkImage(
                              '${Constant.baseURL}imgusers/${UserData().getId()}.jpg'),
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
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: TextField(
                          readOnly: true,
                          decoration: InputDecoration(
                            hintText:
                                AppLocalizations.of(context)!.startPosting,
                            border: InputBorder.none,
                          ),
                          onTap: () {
                            showAddPostPopup(context);
                          },
                        ),
                      ),
                    ],
                  ))
              : const SizedBox(),
          isLoading
              ? const Center(child: CircularProgressIndicator())
              : topics != null && topics!.isEmpty
                  ? Center(
                      child: Text(AppLocalizations.of(context)!.noPostsFound))
                  : Column(
                      children: [
                        ...topics!.map((e) => Post(
                              topicInfo: e,
                              hideGroupBtn: true,
                            )),
                      ],
                    ),
        ],
      ),
    );
  }
}
