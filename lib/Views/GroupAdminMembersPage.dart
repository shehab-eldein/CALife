import 'package:canadianslife/Controllers/GroupController.dart';
import 'package:canadianslife/Managers/LayoutManager.dart';
import 'package:canadianslife/Models/GroupSubscriber.dart';
import 'package:canadianslife/Views/Shared/memberTile.dart';
import 'package:flutter/material.dart';

class GroupMembersPage extends StatefulWidget {
  const GroupMembersPage({super.key, required this.groupId});
  final int groupId;

  @override
  State<GroupMembersPage> createState() => _GroupMembersPageState();
}

class _GroupMembersPageState extends State<GroupMembersPage> {
  List<GroupSubscriber> members = [];
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    getGroupMembers();
  }

  getGroupMembers() async {
    members = await GroupController()
        .getGroupSubscribersByIdAndStatus(widget.groupId, 1);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final layoutManager = LayoutManager(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: layoutManager.mainHorizontalPadding()),
          child: Row(
            children: [
              const Text(
                'الاعضاء',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Color(0xFF1C1C1C),
                  fontSize: 18,
                  fontFamily: '.SF Arabic',
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                '(${members.length})',
                textAlign: TextAlign.right,
                style: const TextStyle(
                  color: Color(0xFF04BFDB),
                  fontSize: 18,
                  fontFamily: '.SF Arabic',
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              )
            ],
          ),
        ),
        const Divider(),
        isLoading == false
            ? Column(
                children: [
                  ...members.map(
                    (e) => MemberTile(
                      subscriber: e,
                      removeAccept: true,
                    ),
                  )
                ],
              )
            : const Center(child: CircularProgressIndicator()),
      ],
    );
  }
}
