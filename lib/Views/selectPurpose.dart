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

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: layoutManager.mainHorizontalPadding(), vertical: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(height: layoutManager.valuesHandler(100, 100, 10, 10)),

              Padding(
          padding: EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                child: Text("اختر اللغة",
                  style: TextStyle(
            fontSize: 17,
            color: appDesign.colorPrimary,
            fontWeight: FontWeight.bold,
          ),
                ),
              ),
              ToggleSwitch(
              customTextStyles: [
                TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 11,

              )



              ],


              borderColor: [appDesign.colorPrimary],
              borderWidth: 4,
              minHeight: 35,


              minWidth: 80.0,
              cornerRadius: 20.0,

              activeBgColors: [
                [appDesign.colorPrimary],
                [appDesign.colorPrimary]
              ],
              activeFgColor: Colors.white,
              inactiveBgColor: Colors.white,
              inactiveFgColor: appDesign.colorPrimary,
              initialLabelIndex: isEnglish ? 1 : 0,
              totalSwitches: 2,
              labels: [ 'العربية','English'],
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
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        width: 150,
                        height: 150,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            elevation: MaterialStateProperty.all<double>(8.0),
                            backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                            shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            )),

                          ),
                          onPressed: () {  },
                          child: const Center(
                            child: Text(

                                "مقيم او مهاجر جديد لكندا",
                                style: TextStyle(

                                    color: appDesign.colorPrimary,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold
                                ),
                              textAlign: TextAlign.center,

                            ),),

                        ),
                      ),
                    ),
                    SizedBox(width: layoutManager.valuesHandler(20, 10, 100, 100)),

                    Expanded(
                      child: Container(
                        width: 150,
                        height: 150,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            elevation: MaterialStateProperty.all<double>(8.0),
                            backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                            shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            )),

                          ),
                          onPressed: () {  },
                          child: Center(
                            child: Text(
                                "مهتم بالهجرة لكندا",
                              style: TextStyle(
                                  color: appDesign.colorPrimary,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold
                              )
                          ),),

                        ),
                      ),
                    ),
                  ],
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
