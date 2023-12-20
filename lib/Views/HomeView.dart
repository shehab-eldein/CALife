import 'package:canadianslife/Controllers/TopicController.dart';
import 'package:canadianslife/Helper/Constants.dart';
import 'package:canadianslife/Helper/responsive.dart';
import 'package:canadianslife/Managers/LayoutManager.dart';
import 'package:canadianslife/Models/Topic.dart';
import 'package:canadianslife/Views/Shared/SearchBar.dart';
import 'package:canadianslife/Views/noPostsView.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Shared/postCard.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    getTopics();
    // getTopics(100012);
    // getTopics(100013);
  }

  List<Topic>? topics;
  TextEditingController controller = TextEditingController();
  bool isLoading = true;
  getTopics() async {
    setState(() {
      isLoading = true;
    });
    List<Topic>? groupTopics = await TopicController().topicsGetByTimeLine(
        Provider.of<UserData>(context, listen: false).userInfo.id,
        controller.text,
        0);
    setState(() {
      topics = groupTopics;
      isLoading = false;
    });
  }

  // getTopics(int grouId) async {
  //   var t = await TopicController().topicsGetByGroupId(
  //       grouId, Provider.of<UserData>(context, listen: false).userInfo.id, 0);
  //   setState(() {
  //     if (topics == null) {
  //       topics = t;
  //     } else {
  //       if (t != null) {
  //         for (var e in t) {
  //           topics!.add(e);
  //         }
  //       }
  //     }
  //   });
  // }

  loadMore() async {
    int lastLoaded = topics![topics!.length - 1].id;
    List<Topic>? groupTopics = await TopicController().topicsGetByTimeLine(
        Provider.of<UserData>(context, listen: false).userInfo.id,
        controller.text,
        lastLoaded);
    setState(() {
      for (var element in groupTopics!) {
        topics!.add(element);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final layoutManager = LayoutManager(context);
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(
            horizontal: layoutManager.mainHorizontalPadding(), vertical: 20),
        children: [
          CustomSearchBar(
              onSearchPressed: getTopics,
              controller: controller,
              hintText: AppLocalizations.of(context)!.searchTopics),
          isLoading == true
              ? SizedBox(
                  height: Dimensions.screenHeight(context),
                  child: const Center(child: CircularProgressIndicator()))
              : topics != null
                  ? topics!.isEmpty
                      ? const Center(
                          child: NotFoundView(
                            isNoGroups: false,
                          ),
                        )
                      : Column(
                          children: [
                            ...topics!.map((e) => Post(
                                  topicInfo: e,
                                )),
                          ],
                        )
                  : SizedBox(
                      height: Dimensions.screenHeight(context),
                      child: const Center(child: CircularProgressIndicator())),
          topics != null && topics!.isNotEmpty && topics!.length % 30 == 0
              ? MaterialButton(
                  onPressed: () {
                    loadMore();
                  },
                  child: const Text(
                    'Load More',
                    style: TextStyle(color: Color(0xFF0A4D68)),
                  ),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
