import 'package:canadianslife/Controllers/GroupController.dart';
import 'package:canadianslife/Models/Group.dart';
import 'package:canadianslife/Views/Shared/groupCard.dart';
import 'package:flutter/material.dart';

class TestView extends StatefulWidget {
  const TestView({super.key});

  @override
  State<TestView> createState() => _TestViewState();
}

class _TestViewState extends State<TestView> {
  late List<Group>? newGroups;
  late List<Group>? userGroups;
  bool isLoading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNewGroups();
  }

  getNewGroups() async {
    newGroups = await GroupController().getUnsubedGroups(0, 11, "T", 0);
    userGroups = await GroupController().getSubedGroups(11, "T", 0);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading == false
        ? ListView(
            children: [
              ...newGroups!.map(
                (e) => GroupCard(
                  subscribeBtnIsHidden: false,
                  groupInfo: e,
                ),
              ),
            ],
          )
        : const Center(child: CircularProgressIndicator());
  }
}
