import 'package:canadianslife/Helper/Constants.dart';
import 'package:canadianslife/Extinsions/extensions.dart';
import 'package:canadianslife/Managers/LayoutManager.dart';
import 'package:canadianslife/Views/Shared/CustomTextButton.dart';
import 'package:canadianslife/Views/selectPurpose.dart';
import 'package:canadianslife/Views/splash.dart';
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
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      // layoutManager.valuesHandler(48, 38, 220, 220)
                      0,
                      layoutManager.valuesHandler(50, 50, 25, 25),
                      0,
                      0),
                  child: SizedBox(
                    height: 10,
                    width: context.screenWidth,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _onboardingData.length,
                      itemBuilder: (context, index) {
                        return Container(
                          width: context.screenWidth * 0.3,
                          height: 10,
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(5),
                              color: _currentPage == index
                                  ? appDesign.colorPrimary
                                  : Colors.white,
                              border: Border.all(
                                  color: appDesign.colorPrimary, width: 1)),
                        );
                      },
                    ),
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Visibility(
                          visible: _currentPage != _onboardingData.length - 1,
                          child: CustomTextButton(
                            textColor: Colors.grey,
                            text: AppLocalizations.of(context)!.skip,
                            backgroundColor: Colors.white,
                            onPressed: () {
                              setState(() {
                                _currentPage = 2;
                              });
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                          width: layoutManager.valuesHandler(5, 5, 250, 250)),
                      Expanded(
                        child: CustomTextButton(
                            backgroundColor: appDesign.colorPrimary,
                            // text: _currentPage == _onboardingData.length - 1 ? 'Sign Up' : 'Next',
                            text: AppLocalizations.of(context)!.next,
                            onPressed: () {
                              setState(() {
                                if (_currentPage ==
                                    _onboardingData.length - 1) {
                                  // Handle sign up button action
                                  // e.g., navigate to sign up screen or perform any other desired action
                                  Navigator.of(context).pop();
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          SelectPurposeView()));
                                  // context.navigateTo(const SplashView());
                                } else {
                                  _currentPage++;
                                  _pageController.animateToPage(
                                    _currentPage,
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.easeInOut,
                                  );
                                }
                              });
                            }),
                      )
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
