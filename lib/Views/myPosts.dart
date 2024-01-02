import 'package:canadianslife/Controllers/TopicController.dart';
import 'package:canadianslife/Helper/Constants.dart';
import 'package:canadianslife/Managers/LayoutManager.dart';
import 'package:canadianslife/Models/Topic.dart';
import 'package:canadianslife/Views/Shared/SearchBar.dart';
import 'package:canadianslife/Views/Shared/postCard.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyPostsView extends StatefulWidget {
  const MyPostsView({super.key});

  @override
  State<MyPostsView> createState() => _MyPostsViewState();
}

class _MyPostsViewState extends State<MyPostsView> {
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

  List<Topic>? topics;
  bool isLoading = true;

  TextEditingController controller = TextEditingController();

  getTopics() async {
    setState(() {
      isLoading = true;
    });
    topics = await TopicController().topicsGetByUserId(
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
    return ListView(
      padding: EdgeInsets.symmetric(
          horizontal: layoutManager.mainHorizontalPadding(), vertical: 20),
      children: [
        CustomSearchBar(
            onSearchPressed: getTopics,
            controller: controller,
            hintText: AppLocalizations.of(context)!.searchTopics),
        const SizedBox(height: 10),
        isLoading
            ? const Center(child: CircularProgressIndicator())
            : topics!.isEmpty
                ? Center(
                    child: Text(AppLocalizations.of(context)!.noPostsFound))
                : Column(
                    children: [
                      ...topics!.map((e) => Post(
                            canDelete: true,
                            topicInfo: e,
                          )),
                    ],
                  ),
      ],
    );
  }
}
