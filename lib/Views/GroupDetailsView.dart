import 'package:canadianslife/Helper/Constants.dart';
import 'package:canadianslife/Models/Group.dart';
import 'package:canadianslife/Views/GroupInfoPage.dart';
import 'package:canadianslife/Views/GroupTopicsPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../Managers/LayoutManager.dart';

class GroupDetails extends StatefulWidget {
  const GroupDetails({Key? key, required this.groupInfo}) : super(key: key);
  final Group groupInfo;
  @override
  State<GroupDetails> createState() => _GroupDetailsState();
}

class _GroupDetailsState extends State<GroupDetails> {
  int selection = 0;

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
      ),
      GroupInfoPage(info: widget.groupInfo.guide ?? "No Guide"),
      GroupInfoPage(info: widget.groupInfo.description ?? "No Description")
    ];
    return Scaffold(
      body: ListView(
        children: [
          AspectRatio(
            aspectRatio:
                layoutManager.valuesHandler(20 / 9, 20 / 9, 40 / 9, 40 / 9),
            child: FadeInImage(
              image: NetworkImage(
                  '${Constant.baseURL}imggroupcovers/${widget.groupInfo.id}.jpg'),
              placeholder: const AssetImage('images/placeholder.png'),
              imageErrorBuilder: (context, error, stackTrace) {
                return Image.asset('images/placeholder.png', fit: BoxFit.cover);
              },
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 7,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: layoutManager.mainHorizontalPadding(), vertical: 5),
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
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: layoutManager.mainHorizontalPadding(), vertical: 5),
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
    );
  }
}
