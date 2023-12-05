import 'package:canadianslife/Controllers/GroupController.dart';
import 'package:canadianslife/Extinsions/extensions.dart';
import 'package:canadianslife/Helper/Constants.dart';
import 'package:canadianslife/Managers/LayoutManager.dart';
import 'package:canadianslife/Models/Group.dart';
import 'package:canadianslife/Views/GroupCreateView.dart';
import 'package:canadianslife/Views/Shared/CustomTextButton.dart';
import 'package:canadianslife/Views/Shared/InteractiveIcon.dart';
import 'package:canadianslife/Views/Shared/groupCard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyGroups extends StatefulWidget {
  const MyGroups({Key? key}) : super(key: key);

  @override
  State<MyGroups> createState() => _MyGroupsState();
}

class _MyGroupsState extends State<MyGroups> {
  @override
  void initState() {
    super.initState();
    getUserGroups();
  }

  List<Group>? groups;
  bool isLoading = true;

  getUserGroups() async {
    print("Getting user groups ...");
    groups = await GroupController().getUserGroups(
        Provider.of<UserData>(context, listen: false).userInfo.id);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final layoutManager = LayoutManager(context);
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(
            horizontal: layoutManager.mainHorizontalPadding()),
        children: [
          InteractiveIcon(
            icon: Icons.group,
            iconSize: 25,
            text: "My Groups",
            fontSize: 20,
            color: appDesign.colorPrimary,
          ),
          const SizedBox(
            height: 8,
          ),
          CustomTextButton(
            width: double.infinity,
            backgroundColor: appDesign.colorPrimaryLight,
            text: "create new group",
            onPressed: () {
              context.navigateTo(const GroupCreateView());
            },
            icon: Icons.add_box_rounded,
          ),
          const SizedBox(
            height: 8,
          ),
          isLoading
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  children: [
                    ...groups!.map((e) {
                      return GroupCard(
                          subscribeBtnIsHidden: true, groupInfo: e);
                    })
                  ],
                ),
        ],
      ),
    );
  }
}
