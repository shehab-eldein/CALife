import 'package:canadianslife/Helper/Constants.dart';
import 'package:canadianslife/Extinsions/extensions.dart';
import 'package:canadianslife/Helper/responsive.dart';
import 'package:canadianslife/Managers/LayoutManager.dart';
import 'package:canadianslife/Views/selectPurpose.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  final List<OnboardingData> _onboardingData = [
    OnboardingData(
        image: 'onBoarding',
        title: 'الحياة في كندا',
        subTitel:
            "تطبيق الي لكل المقيمين و المهاجرين و المهتمين بالهجرة الي كندا"),
    OnboardingData(
        image: 'onBoarding',
        title: 'الحياة في كندا',
        subTitel:
            "يوفر مجموعات للتفاعل بين مستخدمي التطبيق وتبادل الخبرات فيما بينهم"),
    OnboardingData(
        image: 'onBoarding',
        title: 'الحياة في كندا',
        subTitel:
            "تستطيع الاستفادة من خلال التطبيق من خبرات أ.عادل عوضة وطلب استشارات من خلال التطبيق"),
  ];
  int _currentPage = 0;
  bool isLoaded = false;

  nextPage() {
    setState(() {
      if (_currentPage == 2) {
        Navigator.of(context).pop();
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => SelectPurposeView()));
      } else {
        _currentPage++;
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  prevPage() {
    setState(() {
      if (_currentPage == 0) {
      } else {
        _currentPage--;
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final layoutManager = LayoutManager(context);

    Future.delayed(const Duration(seconds: 2), () {
      if (context.mounted) {
        setState(() {
          isLoaded = true;
        });
      }
      // context.navigateTo(OnboardingScreen());
      // context.navigateTo(AuthenticationService());
      // _getUser();
      //
      // _navigationDestination();
    });
    return isLoaded
        ? Scaffold(
            backgroundColor: Colors.white,
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      // layoutManager.valuesHandler(48, 38, 220, 220)
                      5,
                      60,
                      5,
                      10),
                  child: SizedBox(
                    height: 10,
                    width: context.screenWidth,
                    child:
                        ListView(scrollDirection: Axis.horizontal, children: [
                      Container(
                        width: context.screenWidth * 0.3,
                        height: 10,
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(5),
                          color: _currentPage >= 0
                              ? appDesign.colorPrimaryDark
                              : Colors.white,
                          border: Border.all(
                              color: appDesign.colorPrimaryDark, width: 1),
                        ),
                      ),
                      Container(
                        width: context.screenWidth * 0.3,
                        height: 10,
                        margin: EdgeInsets.symmetric(
                            horizontal:
                                layoutManager.valuesHandler(4, 4, 15, 15)),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(5),
                          color: _currentPage >= 1
                              ? appDesign.colorPrimaryDark
                              : Colors.white,
                          border: Border.all(
                              color: appDesign.colorPrimaryDark, width: 1),
                        ),
                      ),
                      Container(
                        width: context.screenWidth * 0.32,
                        height: 10,
                        margin: EdgeInsets.symmetric(
                            horizontal:
                                layoutManager.valuesHandler(4, 4, 15, 15)),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(5),
                          color: _currentPage >= 2
                              ? appDesign.colorPrimaryDark
                              : Colors.white,
                          border: Border.all(
                              color: appDesign.colorPrimaryDark, width: 1),
                        ),
                      ),
                    ]),
                  ),
                ),
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: _onboardingData.length,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    itemBuilder: (context, index) {
                      return OnboardingPage(
                        data: _onboardingData[index],
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MaterialButton(
                            height: 45,
                            minWidth: Dimensions.widthPercentage(context, 45),
                            onPressed: () {
                              prevPage();
                            },
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  color: _currentPage == 0
                                      ? appDesign.colorUnhighlighted
                                      : appDesign.colorPrimaryDark,
                                  width: 2),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              AppLocalizations.of(context)!.previous,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: _currentPage == 0
                                    ? appDesign.colorUnhighlighted
                                    : appDesign.colorPrimaryDark,
                                fontSize: 18,
                                fontFamily: '.SF Arabic',
                                fontWeight: FontWeight.w600,
                                height: 0,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: Dimensions.widthPercentage(context, 1),
                          ),
                          MaterialButton(
                            height: 45,
                            minWidth: Dimensions.widthPercentage(context, 45),
                            onPressed: () {
                              nextPage();
                            },
                            color: appDesign.colorPrimaryDark,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              AppLocalizations.of(context)!.next,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: '.SF Arabic',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
          )
        : Scaffold(
            backgroundColor: appDesign.backGround,
            body: Center(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
                child: Image.asset("images/applogo.png"),
              ),
            ));
  }
}

class OnboardingPage extends StatelessWidget {
  final OnboardingData data;

  const OnboardingPage({required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'images/${data.image}.png',
          height: 200,
          width: 200,
        ),
        const SizedBox(height: 16),
        Text(
          data.title,
          style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: appDesign.colorPrimary),
        ),
        const SizedBox(height: 5),
        Container(
          constraints: BoxConstraints(
              maxWidth: context.screenHeight > 600
                  ? context.screenWidth * 0.9
                  : context.screenWidth * 0.5),
          child: Text(
            data.subTitel,
            style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.normal,
                color: appDesign.colorPrimary),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

class OnboardingData {
  final String image;
  final String title;
  final String subTitel;

  OnboardingData(
      {required this.image, required this.title, required this.subTitel});
}
