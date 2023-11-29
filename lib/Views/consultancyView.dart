import 'dart:convert';

import 'package:canadianslife/Extinsions/extensions.dart';
import 'package:canadianslife/Helper/responsive.dart';
import 'package:canadianslife/Managers/LayoutManager.dart';
import 'package:canadianslife/Helper/Constants.dart';
import 'package:canadianslife/Managers/NetworkManager.dart';
import 'package:canadianslife/Models/ConsultanceForm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class Consultancy {
  static ConsultanceForm constultanceForm = ConsultanceForm(
    id: 0,
    userId: 0,
    passportNo: "passportNo",
    passportIssuer: "passportIssuer",
    residenceCountry: "residenceCountry",
    maritalStatus: 0,
    readingRate: 0,
    writingRate: 0,
    speakingRate: 0,
    listeningRate: 0,
    hasBachelor: false,
    hasOffer: false,
    hasFriend: false,
    hasFamily: false,
    isAgree: false,
    netWealth: 0,
  );
}

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
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  prevPage() {
    setState(() {
      if (_currentPage == 3 - 0) {
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

  submit() async {
    final Uri uri = Uri.parse(
      "https://tender-chandrasekhar.38-100-170-33.plesk.page/Consultancy/ConsultancyAdd",
    );
    var res = await http.post(
      uri,
      body: jsonEncode(Consultancy.constultanceForm.toJson()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    print(json.decode(res.body));
  }

  // Future<bool> submitConsultancy(int groupId, int userId) async {
  //   final url = "${Constant.baseURL}${Constant.group}AddGroupSubscriber";

  //   final response = await http.post(
  //     Uri.parse(url),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //     body: jsonEncode(.toJson()),
  //   );

  //   if (response.statusCode == 200) {
  //     print("Success");
  //     return true;
  //   } else {
  //     print("Falied ${response.statusCode} ");
  //     return false;
  //   }
  // }

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
                physics: const NeverScrollableScrollPhysics(),
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
                          ? Consultancy2(
                              nextPage: nextPage,
                              prevPage: prevPage,
                            )
                          : Consultancy3(
                              submit: submit,
                              prevPage: prevPage,
                            );
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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Consultancy.constultanceForm.userId =
        Provider.of<UserData>(context, listen: false).userInfo.id;
  }

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

  updateData() {
    Consultancy.constultanceForm.passportNo = passportNo.text;
    Consultancy.constultanceForm.passportIssuer = passportSource.text;
    Consultancy.constultanceForm.passportImage = passportCopy.text;
    Consultancy.constultanceForm.maritalStatus = 0;
    Consultancy.constultanceForm.residenceCountry = country.text;
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
          image: AssetImage("images/c1.png"),
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
                updateData();
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
  const Consultancy2(
      {super.key, required this.nextPage, required this.prevPage});
  final Function prevPage;
  final Function nextPage;

  @override
  State<Consultancy2> createState() => _Consultancy2State();
}

class _Consultancy2State extends State<Consultancy2> {
  bool? hasBachelor;
  int? writing;
  int? speaking;
  int? reading;
  int? listening;
  setHasBachelor(value) {
    setState(() {
      hasBachelor = value;
      Consultancy.constultanceForm.hasBachelor = value;
    });
  }

  setWriting(value) {
    setState(() {
      writing = value;
      Consultancy.constultanceForm.writingRate = value;
    });
  }

  setSpeaking(value) {
    setState(() {
      speaking = value;
      Consultancy.constultanceForm.speakingRate = value;
    });
  }

  setReading(value) {
    setState(() {
      reading = value;
      Consultancy.constultanceForm.readingRate = value;
    });
  }

  setListening(value) {
    setState(() {
      listening = value;
      Consultancy.constultanceForm.listeningRate = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 20),
        const Align(
          alignment: Alignment.center,
          child: Text(
            "المهارات و الدراسة",
            style: TextStyle(
              color: Color(0xFF04BFDB),
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 20),
        const Image(
          image: AssetImage("images/c2.png"),
          height: 150,
          width: 50,
        ),
        const SizedBox(height: 20),
        cYesNo(
          context,
          "هل حصلت علي درجة البكالوريوس",
          hasBachelor,
          setHasBachelor,
        ),
        cRate(context, "مهاراتك في اللغة الانجليزية:", writing, setWriting,
            "الكتابة"),
        cRate(context, "القراءة", reading, setReading, null),
        cRate(context, "التحدث", speaking, setSpeaking, null),
        cRate(context, "الاستماع", listening, setListening, null),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              height: 45,
              minWidth: Dimensions.widthPercentage(context, 40),
              onPressed: () {
                widget.prevPage();
              },
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: Color(0xFF030F2E), width: 2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                'السابق',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF030F2E),
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
}

Widget cYesNo(
    BuildContext context, String title, dynamic value, Function setValue) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Text(
          title,
          style: TextStyle(
            fontFamily: '.SF Arabic',
            color: const Color(0xFF030F2E),
            fontSize: Dimensions.fontSize(context, 1.7),
            fontWeight: FontWeight.w600,
            height: 1,
          ),
        ),
      ),
      const SizedBox(height: 15),
      ListTile(
        title: const Text(
          'نعم',
          textAlign: TextAlign.right,
          style: TextStyle(
            color: Color(0xFF474B51),
            fontSize: 20,
            fontFamily: '.SF Arabic',
            fontWeight: FontWeight.w500,
            height: 0.08,
          ),
        ),
        leading: Radio<bool>(
          activeColor: const Color(0xFF030F2E),
          value: true,
          groupValue: value,
          onChanged: (value) {
            setValue(value);
          },
        ),
      ),
      ListTile(
        title: const Text(
          'لا',
          textAlign: TextAlign.right,
          style: TextStyle(
            color: Color(0xFF474B51),
            fontSize: 20,
            fontFamily: '.SF Arabic',
            fontWeight: FontWeight.w500,
            height: 0.08,
          ),
        ),
        leading: Radio<bool>(
          activeColor: const Color(0xFF030F2E),
          value: false,
          groupValue: value,
          onChanged: (value) {
            setValue(value);
          },
        ),
      ),
    ],
  );
}

Widget cRate(BuildContext context, String title, dynamic value,
    Function setValue, String? subTitle) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: Text(
          title,
          style: TextStyle(
            fontFamily: '.SF Arabic',
            color: const Color(0xFF030F2E),
            fontSize: Dimensions.fontSize(context, 1.7),
            fontWeight: FontWeight.w600,
            height: 1,
          ),
        ),
      ),
      subTitle != null ? const SizedBox(height: 20) : const SizedBox(),
      subTitle != null
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                subTitle,
                style: TextStyle(
                  fontFamily: '.SF Arabic',
                  color: const Color(0xFF030F2E),
                  fontSize: Dimensions.fontSize(context, 1.7),
                  fontWeight: FontWeight.w600,
                  height: 1,
                ),
              ),
            )
          : const SizedBox(),
      const SizedBox(height: 0),
      ListTile(
        title: const Text(
          'خبير',
          textAlign: TextAlign.right,
          style: TextStyle(
            color: Color(0xFF474B51),
            fontSize: 20,
            fontFamily: '.SF Arabic',
            fontWeight: FontWeight.w500,
            height: 0.08,
          ),
        ),
        leading: Radio<int>(
          activeColor: const Color(0xFF030F2E),
          value: 5,
          groupValue: value,
          onChanged: (value) {
            setValue(value);
          },
        ),
      ),
      ListTile(
        title: const Text(
          'جيد جداً',
          textAlign: TextAlign.right,
          style: TextStyle(
            color: Color(0xFF474B51),
            fontSize: 20,
            fontFamily: '.SF Arabic',
            fontWeight: FontWeight.w500,
            height: 0.08,
          ),
        ),
        leading: Radio<int>(
          activeColor: const Color(0xFF030F2E),
          value: 4,
          groupValue: value,
          onChanged: (value) {
            setValue(value);
          },
        ),
      ),
      ListTile(
        title: const Text(
          'جيد',
          textAlign: TextAlign.right,
          style: TextStyle(
            color: Color(0xFF474B51),
            fontSize: 20,
            fontFamily: '.SF Arabic',
            fontWeight: FontWeight.w500,
            height: 0.08,
          ),
        ),
        leading: Radio<int>(
          activeColor: const Color(0xFF030F2E),
          value: 3,
          groupValue: value,
          onChanged: (value) {
            setValue(value);
          },
        ),
      ),
      ListTile(
        title: const Text(
          'متواضع',
          textAlign: TextAlign.right,
          style: TextStyle(
            color: Color(0xFF474B51),
            fontSize: 20,
            fontFamily: '.SF Arabic',
            fontWeight: FontWeight.w500,
            height: 0.08,
          ),
        ),
        leading: Radio<int>(
          activeColor: const Color(0xFF030F2E),
          value: 2,
          groupValue: value,
          onChanged: (value) {
            setValue(value);
          },
        ),
      ),
      ListTile(
        title: const Text(
          'محدود',
          textAlign: TextAlign.right,
          style: TextStyle(
            color: Color(0xFF474B51),
            fontSize: 20,
            fontFamily: '.SF Arabic',
            fontWeight: FontWeight.w500,
            height: 0.08,
          ),
        ),
        leading: Radio<int>(
          activeColor: const Color(0xFF030F2E),
          value: 1,
          groupValue: value,
          onChanged: (value) {
            setValue(value);
          },
        ),
      ),
      ListTile(
        title: const Text(
          'لا شئ علي الإطلاق',
          textAlign: TextAlign.right,
          style: TextStyle(
            color: Color(0xFF474B51),
            fontSize: 20,
            fontFamily: '.SF Arabic',
            fontWeight: FontWeight.w500,
            height: 0.08,
          ),
        ),
        leading: Radio<int>(
          activeColor: const Color(0xFF030F2E),
          value: 0,
          groupValue: value,
          onChanged: (value) {
            setValue(value);
          },
        ),
      ),
    ],
  );
}

class Consultancy3 extends StatefulWidget {
  const Consultancy3({super.key, required this.submit, required this.prevPage});
  final Function submit;
  final Function prevPage;

  @override
  State<Consultancy3> createState() => _Consultancy3State();
}

class _Consultancy3State extends State<Consultancy3> {
  bool? hasOffer;
  setHasOffer(value) {
    setState(() {
      hasOffer = value;
      Consultancy.constultanceForm.hasOffer = value;
    });
  }

  bool? hasFriend;
  setHasFriend(value) {
    setState(() {
      hasFriend = value;
      Consultancy.constultanceForm.hasFriend = value;
    });
  }

  bool? hasFamily;
  setHasFamily(value) {
    setState(() {
      hasFamily = value;
      Consultancy.constultanceForm.hasFamily = value;
    });
  }

  bool? isAgree;
  setIsAgree(value) {
    setState(() {
      isAgree = value;
      Consultancy.constultanceForm.isAgree = value;
    });
  }

  int? netWealth;

  setNetWealth(value) {
    setState(() {
      netWealth = value;
      Consultancy.constultanceForm.netWealth = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 20),
        const Align(
          alignment: Alignment.center,
          child: Text(
            "بيانات عامة",
            style: TextStyle(
              color: Color(0xFF04BFDB),
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 20),
        const Image(
          image: AssetImage("images/c3.png"),
          height: 150,
          width: 50,
        ),
        const SizedBox(height: 20),
        cYesNo(
          context,
          "هل لديك عرض عمل موثق من صاحب عمل كندي؟",
          hasOffer,
          setHasOffer,
        ),
        cYesNo(
          context,
          "هل لديك صديق مقرب يعيش في كندا يبلغ من العمر 18 عامًا أو أكبر؟",
          hasFriend,
          setHasFriend,
        ),
        cYesNo(
          context,
          "هل لديك أفراد أسرة أو أقارب يعيشون في كندا وتبلغ أعمارهم 18 عامًا أو أكثر؟",
          hasFamily,
          setHasFamily,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Text(
                "صافي ثروتك الشخصية (بالدولار الأمريكي)",
                style: TextStyle(
                  fontFamily: '.SF Arabic',
                  color: const Color(0xFF030F2E),
                  fontSize: Dimensions.fontSize(context, 1.7),
                  fontWeight: FontWeight.w600,
                  height: 1,
                ),
              ),
            ),
            ListTile(
              title: const Text(
                'بين 10,000 \$ و 25,000 \$',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Color(0xFF474B51),
                  fontSize: 20,
                  fontFamily: '.SF Arabic',
                  fontWeight: FontWeight.w500,
                  height: 0.08,
                ),
              ),
              leading: Radio<int>(
                activeColor: const Color(0xFF030F2E),
                value: 0,
                groupValue: netWealth,
                onChanged: (value) {
                  setNetWealth(value);
                },
              ),
            ),
            ListTile(
              title: const Text(
                'بين 25,000 \$ و 100,000 \$',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Color(0xFF474B51),
                  fontSize: 20,
                  fontFamily: '.SF Arabic',
                  fontWeight: FontWeight.w500,
                  height: 0.08,
                ),
              ),
              leading: Radio<int>(
                activeColor: const Color(0xFF030F2E),
                value: 1,
                groupValue: netWealth,
                onChanged: (value) {
                  setNetWealth(value);
                },
              ),
            ),
            ListTile(
              title: const Text(
                'بين 100,000 \$ و 500,000 \$',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Color(0xFF474B51),
                  fontSize: 20,
                  fontFamily: '.SF Arabic',
                  fontWeight: FontWeight.w500,
                  height: 0.08,
                ),
              ),
              leading: Radio<int>(
                activeColor: const Color(0xFF030F2E),
                value: 2,
                groupValue: netWealth,
                onChanged: (value) {
                  setNetWealth(value);
                },
              ),
            ),
            ListTile(
              title: const Text(
                'بين 500,000 \$ و 1,000,000 \$',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Color(0xFF474B51),
                  fontSize: 20,
                  fontFamily: '.SF Arabic',
                  fontWeight: FontWeight.w500,
                  height: 0.08,
                ),
              ),
              leading: Radio<int>(
                activeColor: const Color(0xFF030F2E),
                value: 3,
                groupValue: netWealth,
                onChanged: (value) {
                  setNetWealth(value);
                },
              ),
            ),
            ListTile(
              title: const Text(
                'أكثر من 1,000,000 \$',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Color(0xFF474B51),
                  fontSize: 20,
                  fontFamily: '.SF Arabic',
                  fontWeight: FontWeight.w500,
                  height: 0.08,
                ),
              ),
              leading: Radio<int>(
                activeColor: const Color(0xFF030F2E),
                value: 4,
                groupValue: netWealth,
                onChanged: (value) {
                  setNetWealth(value);
                },
              ),
            ),
          ],
        ),
        cYesNo(
          context,
          "رسوم الاستشارة 200 دولار، هل أنت متأكد أنك تريد المتابعة؟",
          isAgree,
          setIsAgree,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              height: 45,
              minWidth: Dimensions.widthPercentage(context, 40),
              onPressed: () {
                widget.prevPage();
              },
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: Color(0xFF030F2E), width: 2),
                // side: const BorderSide(color: Color(0x3F474B51), width: 2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                'السابق',
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
            ),
            SizedBox(
              width: Dimensions.widthPercentage(context, 5),
            ),
            MaterialButton(
              height: 45,
              minWidth: Dimensions.widthPercentage(context, 40),
              onPressed: () {
                widget.submit();
              },
              color: const Color(0xFF030F2E),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                'ارسال',
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
}
