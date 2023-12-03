import 'package:canadianslife/Controllers/TopicController.dart';
import 'package:canadianslife/Helper/Constants.dart';
import 'package:canadianslife/Helper/responsive.dart';
import 'package:canadianslife/Managers/LayoutManager.dart';
import 'package:canadianslife/Models/Topic.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Shared/postCard.dart';

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
  }

  List<Topic>? topics;

  getTopics() async {
    List<Topic>? groupTopics = await TopicController().topicsGetByTimeLine(
        Provider.of<UserData>(context, listen: false).userInfo.id, 0);
    setState(() {
      topics = groupTopics;
    });
  }

  loadMore() async {
    int lastLoaded = topics![topics!.length - 1].id;
    print(lastLoaded);
    List<Topic>? groupTopics = await TopicController().topicsGetByTimeLine(
        Provider.of<UserData>(context, listen: false).userInfo.id, lastLoaded);
    setState(() {
      groupTopics!.forEach((element) {
        topics!.add(element);
      });
      // topics = groupTopics;
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
          topics != null
              ? topics!.isEmpty
                  ? const Center(child: Text('لا يوجد منشورات'))
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
          topics != null
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
