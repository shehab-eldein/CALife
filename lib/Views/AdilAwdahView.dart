import 'package:canadianslife/Controllers/TopicController.dart';
import 'package:canadianslife/Helper/Constants.dart';
import 'package:canadianslife/Helper/responsive.dart';
import 'package:canadianslife/Models/Topic.dart';
import 'package:canadianslife/Views/GroupInfoPage.dart';
import 'package:canadianslife/Views/Shared/SearchBar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../Managers/LayoutManager.dart';
import 'Shared/postCard.dart';

class AdilAwdah extends StatefulWidget {
  const AdilAwdah({Key? key}) : super(key: key);
  @override
  State<AdilAwdah> createState() => _AdilAwdahState();
}

class _AdilAwdahState extends State<AdilAwdah> {
  int selection = 0;
  GlobalKey<ScaffoldState>? _scaffoldKey;
  @override
  Widget build(BuildContext context) {
    final layoutManager = LayoutManager(context);
    List pages = [
      const AdilAwdahTopicsPage(),
      const GroupInfoPage(
        info:
            'ارشادات الجروب الرسمى للحياة فى كندا مع عادل عوضة ستجد النصائح التى تحاجها عن كندا',
      ),
      const GroupInfoPage(
        info:
            'الجروب الرسمى للحياة فى كندا مع عادل عوضة ستجد النصائح التى تحاجها عن كندا',
      )
    ];
    List<String> chips = [
      AppLocalizations.of(context)!.posts,
      AppLocalizations.of(context)!.guide,
      AppLocalizations.of(context)!.about
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
          physics: const AlwaysScrollableScrollPhysics(),
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                AspectRatio(
                  aspectRatio: layoutManager.valuesHandler(
                      20 / 9, 20 / 9, 40 / 9, 40 / 9),
                  child: FadeInImage(
                    image: const NetworkImage(
                        '${Constant.baseURL}imggroupcovers/100000.jpg'),
                    placeholder: const AssetImage('images/placeholder.png'),
                    imageErrorBuilder: (context, error, stackTrace) {
                      return Image.asset('images/placeholder.png',
                          fit: BoxFit.cover);
                    },
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: layoutManager.valuesHandler(
                      Dimensions.heightPercentage(context, 15),
                      Dimensions.heightPercentage(context, 15),
                      Dimensions.heightPercentage(context, 25),
                      Dimensions.heightPercentage(context, 25)),
                  left: Dimensions.widthPercentage(context, 50) -
                      Dimensions.radius(context, 4),
                  child: CircleAvatar(
                    backgroundColor: Colors.grey,
                    backgroundImage: const AssetImage("images/person.png"),
                    radius: Dimensions.radius(context, 4),
                  ),
                )
              ],
            ),
            SizedBox(
              height: Dimensions.heightPercentage(context, 8),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: layoutManager.mainHorizontalPadding(),
                ),
                child: const Text(
                  'الحياة في كندا مع عادل عوضه',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Color(0xFF474B51),
                    fontSize: 22,
                    fontFamily: '.SF Arabic',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: layoutManager.mainHorizontalPadding(),
                  vertical: 5),
              child: const Text(
                'الجروب الرسمى للحياة فى كندا مع عادل عوضة ستجد النصائح التى تحاجها عن كندا',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xBF474B51),
                    fontSize: 17,
                    fontFamily: '.SF Arabic',
                    fontWeight: FontWeight.w500,
                    height: 1),
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

class AdilAwdahTopicsPage extends StatefulWidget {
  const AdilAwdahTopicsPage({super.key});

  @override
  State<AdilAwdahTopicsPage> createState() => _AdilAwdahTopicsPageState();
}

class _AdilAwdahTopicsPageState extends State<AdilAwdahTopicsPage> {
  @override
  void initState() {
    super.initState();
    getTopics();
  }

  refresh() {
    setState(() {
      isLoading = true;
      getTopics();
    });
  }

  List<Topic>? topics;
  bool isLoading = true;

  // getTopics() async {
  //   topics = await TopicController().topicsGetAdilAwdah(
  //       Provider.of<UserData>(context, listen: false).userInfo.userType ?? 1,
  //       Provider.of<UserData>(context, listen: false).userInfo.id,
  //       0);
  //   setState(() {
  //     isLoading = false;
  //   });
  // }
  getTopics() async {
    topics = await TopicController().topicsGetByGroupId(100013,
        Provider.of<UserData>(context, listen: false).userInfo.id, "", 0);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final layoutManager = LayoutManager(context);
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: layoutManager.mainHorizontalPadding(), vertical: 10),
      child: Column(
        children: [
          CustomSearchBar(hintText: AppLocalizations.of(context)!.searchTopics),
          const SizedBox(height: 10),
          isLoading
              ? const Center(child: CircularProgressIndicator())
              : topics!.isEmpty
                  ? Center(
                      child: Text(AppLocalizations.of(context)!.noPostsFound))
                  : Column(
                      children: [
                        ...topics!.map(
                          (e) => Post(
                            topicInfo: e,
                          ),
                        ),
                      ],
                    ),
        ],
      ),
    );
  }
}
