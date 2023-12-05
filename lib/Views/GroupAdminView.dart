import 'package:canadianslife/Helper/Constants.dart';
import 'package:canadianslife/Managers/LayoutManager.dart';
import 'package:canadianslife/Models/Group.dart';
import 'package:canadianslife/Views/Shared/SearchBar.dart';
import 'package:canadianslife/Views/Shared/memberTile.dart';
import 'package:flutter/material.dart';

class GroupAdminView extends StatefulWidget {
  GroupAdminView({super.key, this.groupInfo});
  Group? groupInfo;

  @override
  State<GroupAdminView> createState() => _GroupAdminViewState();
}

class _GroupAdminViewState extends State<GroupAdminView> {
  List pages = [
    const ControlPage(),
    const MembersPage(),
    const TopicsPage(),
    const GuidePage()
  ];
  int selection = 0;
  List<String> chips = ['التحكم', 'الاعضاء', 'المنشورات', 'الارشادات'];
  @override
  Widget build(BuildContext context) {
    final layoutManager = LayoutManager(context);
    widget.groupInfo = Group(
      id: 20,
      name: 'الحياة في تورنتو',
      groupType: 0,
      locationX: 20,
      locationY: 20,
      visibility: 0,
      userId: 20,
    );
    return ListView(
      children: [
        Stack(
          children: [
            Positioned(
              // top: 20,
              // right: 20,
              child: CircleAvatar(
                backgroundColor: appDesign.colorPrimaryDark,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.edit,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            AspectRatio(
              aspectRatio:
                  layoutManager.valuesHandler(20 / 7, 20 / 7, 40 / 7, 40 / 7),
              child: FadeInImage(
                image: NetworkImage(
                    '${Constant.baseURL}imggroupcovers/${widget.groupInfo!.id}.jpg'),
                placeholder: const AssetImage('images/placeholder.png'),
                imageErrorBuilder: (context, error, stackTrace) {
                  return Image.asset('images/placeholder.png',
                      fit: BoxFit.cover);
                },
                fit: BoxFit.cover,
              ),
            ),
          ],
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
                widget.groupInfo!.name,
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
        // Padding(
        //   padding: EdgeInsets.symmetric(
        //       horizontal: layoutManager.mainHorizontalPadding()),
        //   child: Column(
        //     children: [

        //       const SizedBox(
        //         height: 7,
        //       ),
        //       const CustomSearchBar(hintText: "البحث في المجموعة"),
        //       const SizedBox(
        //         height: 7,
        //       ),
        //       SizedBox(
        //         height: 50,
        //         child: Row(
        //           children: [
        //             const CircleAvatar(
        //               backgroundImage: AssetImage("images/defultPerson.png"),
        //             ),
        //             const SizedBox(
        //               width: 10,
        //             ),
        //             Expanded(
        //               child: TextField(
        //                 readOnly: true,
        //                 decoration: const InputDecoration(
        //                   hintText: 'ابدأ بالنشر الآن...',
        //                   border: InputBorder.none,
        //                 ),
        //                 onTap: () {
        //                   // showAddPostPopup(context);
        //                   print("Tapped");
        //                 },
        //               ),
        //             ),
        //           ],
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
      ],
    );
  }
}

class Pages extends StatelessWidget {
  final text;
  Pages({this.text});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ]),
    );
  }
}

class ControlPage extends StatefulWidget {
  const ControlPage({super.key});

  @override
  State<ControlPage> createState() => _ControlPageState();
}

class _ControlPageState extends State<ControlPage> {
  @override
  Widget build(BuildContext context) {
    final layoutManager = LayoutManager(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: layoutManager.mainHorizontalPadding()),
          child: const Row(
            children: [
              Text(
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
              SizedBox(width: 10),
              Text(
                '(4)',
                textAlign: TextAlign.right,
                style: TextStyle(
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
        Divider(),
        MemberTile(),
        MemberTile(),
        MemberTile(),
        MemberTile(),
      ],
    );
  }
}

class TopicsPage extends StatefulWidget {
  const TopicsPage({super.key});

  @override
  State<TopicsPage> createState() => _TopicsPageState();
}

class _TopicsPageState extends State<TopicsPage> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Topics'));
  }
}

class MembersPage extends StatefulWidget {
  const MembersPage({super.key});

  @override
  State<MembersPage> createState() => _MembersPageState();
}

class _MembersPageState extends State<MembersPage> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Members'));
  }
}

class GuidePage extends StatefulWidget {
  const GuidePage({super.key});

  @override
  State<GuidePage> createState() => _GuidePageState();
}

class _GuidePageState extends State<GuidePage> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Guide'));
  }
}
