import 'package:canadianslife/Controllers/GroupController.dart';
import 'package:canadianslife/Helper/Constants.dart';
import 'package:canadianslife/Models/Group.dart';
import 'package:canadianslife/Views/GroupInfoPage.dart';
import 'package:canadianslife/Views/GroupTopicsPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../Managers/LayoutManager.dart';

class GroupDetails extends StatefulWidget {
  const GroupDetails(
      {Key? key,
      required this.groupInfo,
      this.refresh,
      required this.isNotSubed})
      : super(key: key);
  final Group groupInfo;
  final Function? refresh;
  final bool isNotSubed;
  @override
  State<GroupDetails> createState() => _GroupDetailsState();
}

class _GroupDetailsState extends State<GroupDetails> {
  int selection = 0;
  bool isLoading = false;

  showAppDialog() {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SizedBox(
            height: 110,
            child: Column(
              children: [
                const SizedBox(height: 10),
                MaterialButton(
                  minWidth: double.infinity,
                  onPressed: () async {
                    if (isLoading == false) {
                      setState(() {
                        isLoading = true;
                      });
                      await exitGroup();
                      if (widget.refresh != null) {
                        widget.refresh!();
                      }
                      setState(() {
                        isLoading = false;
                      });
                      // ignore: use_build_context_synchronously
                      Navigator.of(context).pop();
                      // ignore: use_build_context_synchronously
                      Navigator.of(context).pop();
                    }
                  },
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: isLoading == true
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : const Wrap(
                          spacing: 10,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.exit_to_app,
                            ),
                            Text(
                              'الخروج من المجموعة',
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
                  },
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    'الغاء',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF474B51),
                      fontSize: 18,
                      fontFamily: '.SF Arabic',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  exitGroup() async {
    await GroupController().removeUserFromGroup(widget.groupInfo.id,
        Provider.of<UserData>(context, listen: false).userInfo.id);
  }

  GlobalKey<ScaffoldState>? _scaffoldKey;
  @override
  Widget build(BuildContext context) {
    List<String> chips = [
      AppLocalizations.of(context)!.posts,
      AppLocalizations.of(context)!.guide,
      AppLocalizations.of(context)!.about
    ];
    final layoutManager = LayoutManager(context);
    List pages = [
      GroupTopicsPage(
        groupId: widget.groupInfo.id,
        groupName: widget.groupInfo.name,
        isNotSubed: widget.isNotSubed,
        refresh: widget.refresh,
      ),
      GroupInfoPage(info: widget.groupInfo.guide ?? "No Guide"),
      GroupInfoPage(info: widget.groupInfo.description ?? "No Description")
    ];
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      body: RefreshIndicator(
        onRefresh: () {
          return Future.delayed(Duration.zero, () {
            setState(() {
              _scaffoldKey = GlobalKey<ScaffoldState>();
            });
          });
        },
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          children: [
            AspectRatio(
              aspectRatio:
                  layoutManager.valuesHandler(20 / 9, 20 / 9, 40 / 9, 40 / 9),
              child: FadeInImage(
                image: NetworkImage(
                    '${Constant.baseURL}imggroupcovers/${widget.groupInfo.id}.jpg'),
                placeholder: const AssetImage('images/placeholder.png'),
                imageErrorBuilder: (context, error, stackTrace) {
                  return Image.asset('images/placeholder.png',
                      fit: BoxFit.cover);
                },
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 7,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: layoutManager.mainHorizontalPadding(),
                  vertical: 5),
              child: Row(
                children: [
                  Text(
                    widget.groupInfo.name,
                    style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF474B51)),
                  ),
                  const Spacer(),
                  // CircleAvatar(
                  //   backgroundColor: appDesign.colorPrimaryDark,
                  //   child: IconButton(
                  //     onPressed: () {},
                  //     icon: const Icon(
                  //       Icons.add,
                  //       color: Colors.white,
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(width: 16),
                  UserData().isLoggedIn()
                      ? CircleAvatar(
                          backgroundColor: const Color(0xFFF5F5F5),
                          child: IconButton(
                            onPressed: () {
                              showAppDialog();
                            },
                            icon: const Icon(Icons.more_horiz),
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: layoutManager.mainHorizontalPadding(),
                  vertical: 5),
              child: Wrap(
                alignment: WrapAlignment.spaceAround,
                children: [
                  ...chips.map((e) {
                    return MaterialButton(
                      elevation: 0,
                      color: selection == chips.indexOf(e)
                          ? appDesign.colorPrimaryDark
                          : const Color(0xFFF5F5F5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      onPressed: () {
                        setState(() {
                          selection = chips.indexOf(e);
                        });
                      },
                      child: Text(
                        e,
                        style: TextStyle(
                          color: selection == chips.indexOf(e)
                              ? Colors.white
                              : appDesign.colorPrimaryDark,
                          fontSize: 17,
                          fontFamily: '.SF Arabic',
                          fontWeight: FontWeight.w500,
                          height: 0.07,
                        ),
                      ),
                    );
                  })
                ],
              ),
            ),
            pages[selection],
          ],
        ),
      ),
    );
  }
}
