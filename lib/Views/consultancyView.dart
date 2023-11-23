import 'package:canadianslife/Extinsions/extensions.dart';
import 'package:canadianslife/Helper/responsive.dart';
import 'package:canadianslife/Managers/LayoutManager.dart';
import 'package:canadianslife/Helper/Constants.dart';
import 'package:canadianslife/Views/Shared/CustomTextButton.dart';
import 'package:flutter/material.dart';

class ConsultancyView extends StatefulWidget {
  const ConsultancyView({super.key});

  @override
  State<ConsultancyView> createState() => _ConsultancyViewState();
}

class _ConsultancyViewState extends State<ConsultancyView> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  nextPage() {
    setState(() {
      if (_currentPage == 3 - 1) {
      } else {
        _currentPage++;
        _pageController.animateToPage(
          _currentPage,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final layoutManager = LayoutManager(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(
                  // layoutManager.valuesHandler(48, 38, 220, 220)
                  0,
                  layoutManager.valuesHandler(40, 40, 20, 20),
                  0,
                  0),
              child: Container(
                height: 10,
                width: context.screenWidth,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
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
                itemCount: 3,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                itemBuilder: (context, index) {
                  return index == 0
                      ? Consultancy1(
                          nextPage: nextPage,
                        )
                      : index == 1
                          ? const Consultancy2()
                          : const Consultancy3();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Consultancy1 extends StatefulWidget {
  const Consultancy1({super.key, required this.nextPage});
  final Function nextPage;

  @override
  State<Consultancy1> createState() => _Consultancy1State();
}

class _Consultancy1State extends State<Consultancy1> {
  final TextEditingController fullName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController age = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController passportNo = TextEditingController();
  final TextEditingController passportSource = TextEditingController();
  final TextEditingController passportCopy = TextEditingController();
  final TextEditingController country = TextEditingController();
  final TextEditingController statue = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    fullName.dispose();
    email.dispose();
    age.dispose();
    phone.dispose();
    passportNo.dispose();
    passportSource.dispose();
    passportCopy.dispose();
    country.dispose();
    statue.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 20),
        const Align(
          alignment: Alignment.center,
          child: Text(
            "البيانات الشخصية",
            style: TextStyle(
              color: Color(0xFF04BFDB),
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 20),
        const Image(
          image: AssetImage("images/Group.png"),
          height: 150,
          width: 50,
        ),
        const SizedBox(height: 20),
        cTextField(
            context, fullName, "الاسم بالكامل", "ادخل اسمك بالكامل", false),
        cTextField(context, email, "البريد الإلكتروني",
            "123456abcdefgh@linkyou.ca", true),
        cTextField(context, age, "العمر (سنة)", "ادخل عمرك هنا", false),
        cTextField(context, phone, "رقم التليفون", "1111111111111", true),
        cTextField(
            context, passportNo, "رقم جواز السفر", "ادخل رقم جواز سفرك", false),
        cTextField(context, passportSource, "صادر من",
            "ادخل جهة اصدار جواز سفرك هنا", false),
        cTextField(context, passportCopy, "نسخة من جواز السفر",
            "قم بالتقاط او تحميل صورة من جواز سفرك", false),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              minWidth: Dimensions.widthPercentage(context, 40),
              onPressed: () {},
              color: const Color(0xFF030F2E),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Row(
                children: [
                  Text(
                    'التقاط صورة',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: '.SF Arabic',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                  SizedBox(width: 5),
                  Icon(
                    Icons.camera_alt_outlined,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            MaterialButton(
              minWidth: Dimensions.widthPercentage(context, 40),
              onPressed: () {},
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: Color(0xFF030F2E), width: 2),
                // side: const BorderSide(color: Color(0x3F474B51), width: 2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Row(
                children: [
                  Text(
                    'رفع ملف',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF030F2E),
                      // color: Color(0x3F474B51),
                      fontSize: 18,
                      fontFamily: '.SF Arabic',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                  Icon(
                    Icons.add,
                    color: Color(0xFF030F2E),
                  ),
                ],
              ),
            ),
          ],
        ),
        cTextField(context, country, "بلد الإقامة",
            "ادخل اسم البلد المقيم بها حالياً هنا", false),
        cTextField(context, statue, "الحالة الإجتماعية",
            "ادخل حالتك الإجتماعية هنا", false),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              height: 45,
              minWidth: Dimensions.widthPercentage(context, 40),
              onPressed: () {},
              color: Colors.white,
              shape: RoundedRectangleBorder(
                // side: const BorderSide(color: Color(0xFF030F2E), width: 2),
                side: const BorderSide(color: Color(0x3F474B51), width: 2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                'السابق',
                textAlign: TextAlign.center,
                style: TextStyle(
                  // color: Color(0xFF030F2E),
                  color: Color(0x3F474B51),
                  fontSize: 18,
                  fontFamily: '.SF Arabic',
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
            ),
            SizedBox(
              width: Dimensions.widthPercentage(context, 5),
            ),
            MaterialButton(
              height: 45,
              minWidth: Dimensions.widthPercentage(context, 40),
              onPressed: () {
                widget.nextPage();
              },
              color: const Color(0xFF030F2E),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                'التالي',
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
    );
  }

  Widget cTextField(
    BuildContext context,
    TextEditingController controller,
    String title,
    String hint,
    bool isRequired,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          children: [
            Text(
              title,
              style: TextStyle(
                fontFamily: '.SF Arabic',
                color: const Color(0xFF030F2E),
                fontSize: Dimensions.fontSize(context, 1.7),
                fontWeight: FontWeight.w600,
                height: 1,
              ),
            ),
            Text(
              isRequired ? "*" : "",
              style: TextStyle(
                fontFamily: '.SF Arabic',
                color: Colors.red,
                fontSize: Dimensions.fontSize(context, 1.7),
                fontWeight: FontWeight.w600,
                height: 1,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        TextField(
          keyboardType: TextInputType.text,
          controller: controller,
          style: TextStyle(
            fontFamily: '.SF Arabic',
            fontSize: Dimensions.fontSize(context, 1.2),
          ),
          decoration: InputDecoration(
            hintText: hint,
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8))),
          ),
        ),
      ]),
    );
  }
}

class Consultancy2 extends StatefulWidget {
  const Consultancy2({super.key});

  @override
  State<Consultancy2> createState() => _Consultancy2State();
}

class _Consultancy2State extends State<Consultancy2> {
  @override
  Widget build(BuildContext context) {
    return const Text("Consultancy 2");
  }
}

class Consultancy3 extends StatefulWidget {
  const Consultancy3({super.key});

  @override
  State<Consultancy3> createState() => _Consultancy3State();
}

class _Consultancy3State extends State<Consultancy3> {
  @override
  Widget build(BuildContext context) {
    return const Text("Consultancy 3");
  }
}
