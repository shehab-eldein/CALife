import 'package:canadianslife/Controllers/GroupController.dart';
import 'package:canadianslife/Extinsions/extensions.dart';
import 'package:canadianslife/Helper/Constants.dart';
import 'package:canadianslife/Models/Group.dart';
import 'package:canadianslife/Models/User.dart';
import 'package:canadianslife/Views/GroupCreateView.dart';
import 'package:canadianslife/Views/Shared/CustomTextButton.dart';
import 'package:canadianslife/Views/Shared/SearchBar.dart';

import 'package:canadianslife/Views/Shared/groupCard.dart';
import 'package:canadianslife/Views/noPostsView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../Managers/LayoutManager.dart';

class GroupsTabsView extends StatefulWidget {
  const GroupsTabsView({super.key});

  @override
  State<GroupsTabsView> createState() => GroupsViewState();
}

class GroupsViewState extends State<GroupsTabsView>
    with SingleTickerProviderStateMixin {
  int tabSelected = 1;
  late TabController _tabController;
  bool hideSubscribeButton = false;

  TextEditingController searchController = TextEditingController();

  late List<Group>? newGroups;
  late List<Group>? userGroups;
  bool isLoadingUser = true;
  bool isLoadingNew = true;

  late User userInfo;

  getNewGroups() async {
    setState(() {
      isLoadingNew = true;
    });
    newGroups = await GroupController().getUnsubedGroups(
        Provider.of<UserData>(context, listen: false).userInfo.userType!,
        Provider.of<UserData>(context, listen: false).userInfo.id,
        searchController.text,
        0);
    setState(() {
      isLoadingNew = false;
    });
  }

  getUserGroups() async {
    setState(() {
      isLoadingUser = true;
    });
    userGroups = await GroupController().getSubedGroups(
        Provider.of<UserData>(context, listen: false).userInfo.id,
        searchController.text,
        0);
    setState(() {
      isLoadingUser = false;
    });
  }

  @override
  void initState() {
    super.initState();
    tabSelected = 1;
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_onTabChanged);
    setState(() {
      _tabController.index = 1;
    });
    userInfo = Provider.of<UserData>(context, listen: false).userInfo;
    getUserGroups();
    getNewGroups();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _onTabChanged() {
    setState(() {
      if (_tabController.index == 0) {
        tabSelected = 1;
        hideSubscribeButton = false;
      } else if (_tabController.index == 1) {
        tabSelected = 2;
        hideSubscribeButton = true;
      }
    });
  }

  refresh() {
    getNewGroups();
    getUserGroups();
  }

  @override
  Widget build(BuildContext context) {
    final layoutManager = LayoutManager(context);

    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Container(
        color: Colors.grey.shade200,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const SizedBox(
            height: 5,
          ),
          Container(
            // padding: EdgeInsets.symmetric(
            //     horizontal: layoutManager.mainHorizontalPadding(), vertical: 5),
            color: Colors.white,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: layoutManager.mainHorizontalPadding(),
                      vertical: 5),
                  child: CustomSearchBar(
                    hintText: AppLocalizations.of(context)!.groupsSearch,
                    controller: searchController,
                    onSearchPressed:
                        tabSelected == 1 ? getUserGroups : getNewGroups,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                TabBar(
                  controller: _tabController,
                  tabs: [
                    Tab(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            tabSelected == 1
                                ? Icons.groups_2
                                : Icons.groups_2_outlined,
                            color: tabSelected == 1
                                ? appDesign.colorPrimaryDark
                                : Colors.grey,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(AppLocalizations.of(context)!.groupsMyGroups,
                              style: TextStyle(
                                  color: tabSelected == 1
                                      ? appDesign.colorPrimaryDark
                                      : Colors.grey,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    Tab(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            tabSelected == 2
                                ? Icons.groups_2
                                : Icons.groups_2_outlined,
                            color: tabSelected == 2
                                ? appDesign.colorPrimaryDark
                                : Colors.grey,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            AppLocalizations.of(context)!.groupsNewGroups,
                            style: TextStyle(
                                color: tabSelected == 2
                                    ? appDesign.colorPrimaryDark
                                    : Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    )
                  ],
                  indicatorColor: appDesign.colorPrimaryDark,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorWeight: 3,
                ),
              ],
            ),
          ),
          Container(
              padding: EdgeInsets.symmetric(
                  horizontal: layoutManager.mainHorizontalPadding(),
                  vertical: 0),
              height: context.screenHeight * 0.7,
              color: Colors.grey.shade200,
              child: tabSelected == 1
                  ? isLoadingUser == false
                      ? userGroups!.isEmpty
                          ? NotFoundView(
                              isNoGroups: true,
                              refresh: () {
                                setState(() {
                                  _tabController.animateTo(1);
                                });
                              },
                            )
                          : ListView(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: CustomTextButton(
                                    width: double.infinity,
                                    backgroundColor:
                                        appDesign.colorPrimaryLight,
                                    text: AppLocalizations.of(context)!
                                        .createGroup,
                                    onPressed: () {
                                      context.navigateTo(GroupCreateView(
                                        refresh: getUserGroups,
                                      ));
                                    },
                                    icon: Icons.add_box_rounded,
                                  ),
                                ),
                                ...userGroups!.map(
                                  (e) => GroupCard(
                                    isNotSubed: false,
                                    groupInfo: e,
                                    refresh: refresh,
                                  ),
                                ),
                              ],
                            )
                      : const Center(child: CircularProgressIndicator())
                  : isLoadingNew == false
                      ? newGroups!.isEmpty
                          ? const Center(
                              child: Text('لم نجد مجموعات!'),
                            )
                          : ListView(
                              children: [
                                ...newGroups!.map(
                                  (e) => GroupCard(
                                    isNotSubed: true,
                                    groupInfo: e,
                                    refresh: refresh,
                                  ),
                                ),
                              ],
                            )
                      : const Center(child: CircularProgressIndicator()))
        ]),
      ),
    );
  }
}
