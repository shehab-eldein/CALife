import 'package:canadianslife/Controllers/GroupController.dart';
import 'package:canadianslife/Managers/LayoutManager.dart';
import 'package:canadianslife/Models/GroupSubscriber.dart';
import 'package:canadianslife/Views/Shared/memberTile.dart';
import 'package:flutter/material.dart';

class GroupControlPage extends StatefulWidget {
  const GroupControlPage({super.key, required this.groupId});
  final int groupId;
  @override
  State<GroupControlPage> createState() => _GroupControlPageState();
}

class _GroupControlPageState extends State<GroupControlPage> {
  List<GroupSubscriber> requests = [];
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    getGroupRequests();
  }

  getGroupRequests() async {
    requests = await GroupController()
        .getGroupSubscribersByIdAndStatus(widget.groupId, 0);
    setState(() {
      isLoading = false;
    });
  }

  acceptRequest(int subId) async {
    setState(() {
      isLoading = true;
    });
    await GroupController().approveGroupSubRequest(subId);
    setState(() {
      getGroupRequests();
    });
  }

  rejectRequest(int subId) async {
    setState(() {
      isLoading = true;
    });
    await GroupController().rejectGroupSubRequest(subId);
    setState(() {
      getGroupRequests();
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
                'طلبات الإنضمام',
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
                '(${requests.length})',
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
                  ...requests.map(
                    (e) => MemberTile(
                      subscriber: e,
                      accept: acceptRequest,
                      reject: rejectRequest,
                    ),
                  )
                ],
              )
            : const Center(child: CircularProgressIndicator()),
      ],
    );
  }
}
