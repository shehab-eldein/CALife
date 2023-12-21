import 'package:canadianslife/Helper/responsive.dart';
import 'package:canadianslife/Managers/LayoutManager.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../Helper/Constants.dart';

class SelectPurposeView extends StatefulWidget {
  SelectPurposeView({Key? key}) : super(key: key);

  @override
  State<SelectPurposeView> createState() => _SelectPurposeViewState();
}

class _SelectPurposeViewState extends State<SelectPurposeView> {
  List<bool> _selections = List.generate(2, (_) => false);
  bool isEnglish = true;

  @override
  void initState() {
    super.initState();
    _selections.first = true;
  }

  void _langSelection() {
    if (UserData.language == "en") {
      _selections.first = true;
    } else {
      _selections[1] = true;
      isEnglish = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final layoutManager = LayoutManager(context);

    _langSelection();

    bool isInCanada = true;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: layoutManager.mainHorizontalPadding(), vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: layoutManager.valuesHandler(25, 25, 5, 5)),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 5),
              child: Text(
                "اختر اللغة",
                style: TextStyle(
                  fontSize: 17,
                  color: appDesign.colorPrimaryDark,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ToggleSwitch(
              customTextStyles: const [
                TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 11,
                )
              ],
              borderColor: const [appDesign.colorPrimaryDark],
              borderWidth: 4,
              minHeight: 35,
              minWidth: 80.0,
              cornerRadius: 20.0,
              activeBgColors: const [
                [appDesign.colorPrimaryDark],
                [appDesign.colorPrimaryDark]
              ],
              activeFgColor: Colors.white,
              inactiveBgColor: Colors.white,
              inactiveFgColor: appDesign.colorPrimaryDark,
              initialLabelIndex: isEnglish ? 1 : 0,
              totalSwitches: 2,
              labels: const ['العربية', 'English'],
              radiusStyle: false,
              onToggle: (index) {
                if (index == 1) {
                  isEnglish = true;
                  print("IS ENGLISH");
                  // context.changeLanguageToEnglish();
                  // context.saveIsEnglish(true);
                } else {
                  isEnglish = false;
                  print("IS Arabic");
                  // context.changeLanguageToArabic();
                  //
                  // context.saveIsEnglish(false);
                }
              },
            ),
            Align(
              alignment: Alignment.center,
              child: const Image(
                image: AssetImage("images/snowman.png"),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(vertical: 20),
            //   child: Row(
            //     children: [
            //       Expanded(
            //         child: SizedBox(
            //           width: 150,
            //           height: 150,
            //           child: ElevatedButton(
            //             style: ButtonStyle(
            //               elevation: MaterialStateProperty.all<double>(8.0),
            //               backgroundColor:
            //                   MaterialStateProperty.all<Color>(Colors.white),
            //               shape: MaterialStateProperty.all<OutlinedBorder>(
            //                   RoundedRectangleBorder(
            //                 borderRadius: BorderRadius.circular(15),
            //               )),
            //             ),
            //             onPressed: () {},
            //             child: const Center(
            //               child: Text(
            //                 "مقيم او مهاجر جديد لكندا",
            //                 style: TextStyle(
            //                     color: appDesign.colorPrimary,
            //                     fontSize: 18,
            //                     fontWeight: FontWeight.bold),
            //                 textAlign: TextAlign.center,
            //               ),
            //             ),
            //           ),
            //         ),
            //       ),
            //       SizedBox(
            //           width: layoutManager.valuesHandler(20, 10, 100, 100)),
            //       Expanded(
            //         child: SizedBox(
            //           width: 150,
            //           height: 150,
            //           child: ElevatedButton(
            //             style: ButtonStyle(
            //               elevation: MaterialStateProperty.all<double>(8.0),
            //               backgroundColor:
            //                   MaterialStateProperty.all<Color>(Colors.white),
            //               shape: MaterialStateProperty.all<OutlinedBorder>(
            //                   RoundedRectangleBorder(
            //                 borderRadius: BorderRadius.circular(15),
            //               )),
            //             ),
            //             onPressed: () {},
            //             child: const Center(
            //               child: Text("مهتم بالهجرة لكندا",
            //                   style: TextStyle(
            //                       color: appDesign.colorPrimary,
            //                       fontSize: 18,
            //                       fontWeight: FontWeight.bold)),
            //             ),
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // )
            const SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () => setState(() {
                    isInCanada = true;
                  }),
                  child: Container(
                    height: Dimensions.widthPercentage(context, 40),
                    width: Dimensions.widthPercentage(context, 40),
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x26000000),
                          blurRadius: 5,
                          offset: Offset(0, 2),
                          spreadRadius: 0,
                        )
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "مقيم او مهاجر جديد\n لكندا",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: '.SF Arabic',
                            color: appDesign.colorPrimaryDark,
                            fontSize: Dimensions.fontSize(context, 1.5),
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: Dimensions.widthPercentage(context, 5)),
                InkWell(
                  onTap: () => setState(() {
                    isInCanada = false;
                  }),
                  child: Container(
                    height: Dimensions.widthPercentage(context, 40),
                    width: Dimensions.widthPercentage(context, 40),
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x26000000),
                          blurRadius: 5,
                          offset: Offset(0, 2),
                          spreadRadius: 0,
                        )
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "مهتم بالهجرة لكندا",
                        style: TextStyle(
                            fontFamily: '.SF Arabic',
                            color: appDesign.colorPrimaryDark,
                            fontSize: Dimensions.fontSize(context, 1.5),
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
