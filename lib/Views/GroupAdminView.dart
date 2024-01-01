import 'package:canadianslife/Helper/Constants.dart';
import 'package:canadianslife/Helper/responsive.dart';
import 'package:canadianslife/Managers/LayoutManager.dart';
import 'package:canadianslife/Models/Group.dart';
import 'package:canadianslife/Views/GroupAdminControlPage.dart';
import 'package:canadianslife/Views/GroupAdminMembersPage.dart';
import 'package:canadianslife/Views/GroupInfoPage.dart';
import 'package:canadianslife/Views/GroupTopicsPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class GroupAdminView extends StatefulWidget {
  const GroupAdminView({super.key, required this.groupInfo});
  final Group groupInfo;

  @override
  State<GroupAdminView> createState() => _GroupAdminViewState();
}

class _GroupAdminViewState extends State<GroupAdminView> {
  int selection = 0;
  GlobalKey<ScaffoldState>? _scaffoldKey;
  @override
  Widget build(BuildContext context) {
    List pages = [
      GroupControlPage(
        groupId: widget.groupInfo.id,
      ),
      GroupMembersPage(
        groupId: widget.groupInfo.id,
      ),
      GroupTopicsPage(
        groupId: widget.groupInfo.id,
        isNotSubed: false,
      ),
      GroupInfoPage(info: widget.groupInfo.guide ?? "No Info"),
      GroupInfoPage(info: widget.groupInfo.description ?? "No Description")
    ];
    final layoutManager = LayoutManager(context);
    List<String> chips = [
      AppLocalizations.of(context)!.control,
      AppLocalizations.of(context)!.members,
      AppLocalizations.of(context)!.posts,
      AppLocalizations.of(context)!.guide,
      AppLocalizations.of(context)!.about,
    ];
    return Scaffold(
      key: _scaffoldKey,
      body: RefreshIndicator(
        onRefresh: () {
          return Future.delayed(Duration.zero, () {
            setState(() {
              _scaffoldKey = GlobalKey<ScaffoldState>();
            });
          });
        },
        child: ListView(
          children: [
            Stack(
              children: [
                AspectRatio(
                  aspectRatio: layoutManager.valuesHandler(
                      20 / 9, 20 / 9, 40 / 9, 40 / 9),
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
                Positioned(
                  top: 20,
                  right: 20,
                  child: InkWell(
                    onTap: () {},
                    child: const CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.edit,
                        color: appDesign.colorPrimaryDark,
                        size: 17,
                      ),
                    ),
                  ),
                ),
              ],
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
                  CircleAvatar(
                    backgroundColor: appDesign.colorPrimaryDark,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  CircleAvatar(
                    backgroundColor: const Color(0xFFF5F5F5),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.more_horiz),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 45,
              padding: EdgeInsets.symmetric(
                  horizontal: layoutManager.mainHorizontalPadding(),
                  vertical: 5),
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: chips.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.only(
                        left: Dimensions.widthPercentage(context, 3),
                      ),
                      child: MaterialButton(
                        elevation: 0,
                        color: selection == chips.indexOf(chips[index])
                            ? appDesign.colorPrimaryDark
                            : const Color(0xFFF5F5F5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        onPressed: () {
                          setState(() {
                            selection = chips.indexOf(chips[index]);
                          });
                        },
                        child: Text(
                          chips[index],
                          style: TextStyle(
                            color: selection == chips.indexOf(chips[index])
                                ? Colors.white
                                : appDesign.colorPrimaryDark,
                            fontSize: 17,
                            fontFamily: '.SF Arabic',
                            fontWeight: FontWeight.w500,
                            height: 0.07,
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            pages[selection],
          ],
        ),
      ),
    );
  }
}
