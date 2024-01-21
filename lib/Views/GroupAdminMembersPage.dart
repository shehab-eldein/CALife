import 'package:canadianslife/Controllers/GroupController.dart';
import 'package:canadianslife/Helper/Constants.dart';
import 'package:canadianslife/Managers/LayoutManager.dart';
import 'package:canadianslife/Models/GroupSubscriber.dart';
import 'package:canadianslife/Views/Shared/memberTile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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

  removeUser(int userId) async {
    setState(() {
      isLoading = true;
    });
    await GroupController().removeUserFromGroup(widget.groupId, userId);
    setState(() {
      getGroupMembers();
    });
  }

  blockUser(int userId) async {
    setState(() {
      isLoading = true;
    });
    await GroupController().blockUserFromGroup(widget.groupId, userId);
    setState(() {
      getGroupMembers();
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
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(200),
                      child: FadeInImage(
                        height: 50,
                        width: 50,
                        image: NetworkImage(
                            '${Constant.baseURL}imgusers/${subscriber.user!.id}.jpg'),
                        placeholder: const AssetImage(
                          'images/person.png',
                        ),
                        imageErrorBuilder: (context, error, stackTrace) {
                          return Image.asset(
                            'images/person.png',
                            fit: BoxFit.fill,
                            height: 50,
                            width: 50,
                          );
                        },
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                MaterialButton(
                  minWidth: double.infinity,
                  onPressed: () {
                    Navigator.of(context).pop();
                    removeUser(subscriber.user!.id);
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
                    blockUser(subscriber.user!.id);
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
                AppLocalizations.of(context)!.members,
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