import 'package:canadianslife/Controllers/UserController.dart';
import 'package:canadianslife/Helper/Constants.dart';
import 'package:canadianslife/Models/User.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Helper/responsive.dart';
import 'package:canadianslife/views/shared/save_btn.dart';
import '../colors.dart';

class EditInterestView extends StatefulWidget {
  const EditInterestView(
      {super.key, required this.userInfo, required this.refresh});
  final User userInfo;
  final Function refresh;

  @override
  State<EditInterestView> createState() => _EditInterestViewState();
}

class _EditInterestViewState extends State<EditInterestView> {
  bool isInCanada = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isInCanada = widget.userInfo.userType == 0 ? true : false;
  }

  void editInfo() async {
    User? userInfo = widget.userInfo;
    await UserController()
        .editUser(
          userInfo.id!,
          userInfo.displayName,
          userInfo.fullName,
          userInfo.email,
          userInfo.password,
          userInfo.phone.toString(),
          isInCanada ? 0 : 1,
        )
        .then((value) =>
            Provider.of<UserData>(context, listen: false).logUser(value));
    Navigator.of(context).pop();
    widget.refresh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: 20, horizontal: Dimensions.widthPercentage(context, 7)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Wrap(
                children: [
                  InkWell(
                    onTap: () => setState(() {
                      isInCanada = false;
                    }),
                    child: Stack(
                      children: [
                        Container(
                          height: Dimensions.widthPercentage(context, 40),
                          width: Dimensions.widthPercentage(context, 40),
                          decoration: BoxDecoration(
                            border: isInCanada
                                ? null
                                : Border.all(color: lightBlueColor, width: 2),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x26000000),
                                blurRadius: 10,
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
                                  color: const Color(0xFF030F2E),
                                  fontSize: Dimensions.fontSize(context, 1.5),
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 0,
                          child: Checkbox(
                            side: BorderSide(
                              color: lightBlueColor, //your desire colour here
                              width: 2,
                            ),
                            activeColor: lightBlueColor,
                            value: !isInCanada,
                            onChanged: (newValue) {
                              setState(() {
                                isInCanada = false;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: Dimensions.widthPercentage(context, 5.9)),
                  InkWell(
                    onTap: () => setState(() {
                      isInCanada = true;
                    }),
                    child: Stack(
                      children: [
                        Container(
                          height: Dimensions.widthPercentage(context, 40),
                          width: Dimensions.widthPercentage(context, 40),
                          decoration: BoxDecoration(
                            border: isInCanada
                                ? Border.all(color: lightBlueColor, width: 2)
                                : null,
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x26000000),
                                blurRadius: 10,
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
                                  color: const Color(0xFF030F2E),
                                  fontSize: Dimensions.fontSize(context, 1.5),
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 0,
                          child: Checkbox(
                            side: BorderSide(
                              color: lightBlueColor, //your desire colour here
                              width: 2,
                            ),
                            activeColor: lightBlueColor,
                            value: isInCanada,
                            onChanged: (newValue) {
                              setState(() {
                                isInCanada = true;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const Spacer(),
              SaveBtn(onPressed: () {
                editInfo();
              })
            ],
          ),
        ),
      ),
    );
  }
}
