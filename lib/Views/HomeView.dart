import 'package:canadianslife/Controllers/TopicController.dart';
import 'package:canadianslife/Helper/Constants.dart';
import 'package:canadianslife/Helper/responsive.dart';
import 'package:canadianslife/Managers/LayoutManager.dart';
import 'package:canadianslife/Models/Topic.dart';
import 'package:canadianslife/Views/Shared/SearchBar.dart';
import 'package:canadianslife/Views/noPostsView.dart';
import 'package:canadianslife/Views/loggedInGuest.dart';
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
    listController = ScrollController()..addListener(handleScrolling);
    getTopics();
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
      if (topics != null && topics!.isNotEmpty) {
        Constant.isHomeEmpty = false;
      } else {
        Constant.isHomeEmpty = true;
      }
      isLoading = false;
    });
  }

  loadMore() async {
    if (isLoadingMore == false) {
      isLoadingMore = true;
      int lastLoaded = topics![topics!.length - 1].id;
      List<Topic>? groupTopics = await TopicController().topicsGetByTimeLine(
          Provider.of<UserData>(context, listen: false).userInfo.id,
          controller.text,
          lastLoaded);
      setState(() {
        for (var element in groupTopics) {
          topics!.add(element);
        }
        isLoadingMore = false;
      });
    }
  }

  ScrollController listController = ScrollController();

  bool isLoadingMore = false;
  void handleScrolling() {
    if (listController.offset >= listController.position.maxScrollExtent &&
        topics != null &&
        topics!.isNotEmpty &&
        topics!.length % 30 == 0) {
      setState(() {
        loadMore();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final layoutManager = LayoutManager(context);
    return Scaffold(
      body: RefreshIndicator(
        key: Constant.homeViewKey,
        onRefresh: () {
          return Future.delayed(Duration.zero, getTopics);
        },
        child: UserData().userInfo.id > 0
            ? ListView(
                controller: listController,
                physics: const AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(
                    horizontal: layoutManager.mainHorizontalPadding(),
                    vertical: 20),
                children: [
                  CustomSearchBar(
                      onSearchPressed: getTopics,
                      controller: controller,
                      hintText: AppLocalizations.of(context)!.searchTopics),
                  isLoading == true
                      ? SizedBox(
                          height: Dimensions.screenHeight(context),
                          child:
                              const Center(child: CircularProgressIndicator()))
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
                              child: const Center(
                                  child: CircularProgressIndicator())),
                  isLoadingMore
                      ? const Center(child: CircularProgressIndicator())
                      : const SizedBox()
                ],
              )
            : NotLoggedInView(),
      ),
    );
  }
}
