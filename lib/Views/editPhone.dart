import 'package:canadianslife/Controllers/UserController.dart';
import 'package:canadianslife/Models/User.dart';
import 'package:flutter/material.dart';
import '../Helper/responsive.dart';
import 'package:canadianslife/views/shared/save_btn.dart';

class EditPhoneView extends StatefulWidget {
  const EditPhoneView(
      {super.key, required this.userInfo, required this.refresh});
  final User userInfo;
  final Function refresh;

  @override
  State<EditPhoneView> createState() => _EditPhoneViewState();
}

class _EditPhoneViewState extends State<EditPhoneView> {
  void editInfo() async {
    User? userInfo = widget.userInfo;
    await UserController().editUser(
      userInfo.id!,
      userInfo.displayName,
      userInfo.fullName,
      userInfo.email,
      userInfo.password,
      textController.text,
      userInfo.userType!,
    );
    Navigator.of(context).pop();
    widget.refresh();
  }

  final TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'رقم التليفون',
                    style: TextStyle(
                      fontFamily: '.SF Arabic',
                      color: const Color(0xFF484C52),
                      fontSize: Dimensions.fontSize(context, 1.7),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextSpan(
                    text: '(اختيارى)',
                    style: TextStyle(
                      fontFamily: '.SF Arabic',
                      color: const Color(0xFF484C52),
                      fontSize: Dimensions.fontSize(context, 0.9),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              keyboardType: TextInputType.phone,
              controller: textController,
              style: TextStyle(
                fontFamily: '.SF Arabic',
                fontSize: Dimensions.fontSize(context, 1.2),
              ),
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
              ),
            ),
            const Spacer(),
            SaveBtn(onPressed: () {
              editInfo();
            })
          ]),
        ),
      ),
    );
  }
}
