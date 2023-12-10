import 'package:canadianslife/Controllers/GroupController.dart';
import 'package:canadianslife/Managers/LayoutManager.dart';
import 'package:canadianslife/Models/GroupSubscriber.dart';
import 'package:canadianslife/Views/Shared/memberTile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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

  blockUser(int userId, subId) async {
    setState(() {
      isLoading = true;
    });
    await GroupController().rejectGroupSubRequest(subId);
    await GroupController().blockUserFromGroup(widget.groupId, userId);
    setState(() {
      getGroupRequests();
    });
  }

  showAppDialog(GroupSubscriber subscriber) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SizedBox(
            height: 160,
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ListTile(
                    title: Text(subscriber.user!.displayName),
                    leading: const CircleAvatar(
                      backgroundImage: AssetImage("images/person.png"),
                      radius: 25,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                MaterialButton(
                  minWidth: double.infinity,
                  onPressed: () {
                    Navigator.of(context).pop();
                    rejectRequest(subscriber.id);
                  },
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Wrap(
                    spacing: 10,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.person_remove,
                      ),
                      Text(
                        'حذف',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF474B51),
                          fontSize: 18,
                          fontFamily: '.SF Arabic',
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ),
                MaterialButton(
                  minWidth: double.infinity,
                  onPressed: () {
                    Navigator.of(context).pop();
                    blockUser(subscriber.user!.id, subscriber.id);
                  },
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Wrap(
                    spacing: 10,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.person_off,
                      ),
                      Text(
                        'حظر',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF474B51),
                          fontSize: 18,
                          fontFamily: '.SF Arabic',
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
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
              Text(
                AppLocalizations.of(context)!.joinRequests,
                textAlign: TextAlign.right,
                style: const TextStyle(
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
                      reject: showAppDialog,
                    ),
                  )
                ],
              )
            : const Center(child: CircularProgressIndicator()),
      ],
    );
  }
}
