import 'package:canadianslife/Controllers/UserController.dart';
import 'package:canadianslife/Models/User.dart';
import 'package:flutter/material.dart';
import '../../Helper/responsive.dart';
import '../views/shared/save_btn.dart';

class EditEmailView extends StatefulWidget {
  const EditEmailView(
      {super.key, required this.userInfo, required this.refresh});
  final User userInfo;
  final Function refresh;

  @override
  State<EditEmailView> createState() => _EditEmailViewState();
}

class _EditEmailViewState extends State<EditEmailView> {
  void editInfo() async {
    User? userInfo = widget.userInfo;
    await UserController().editUser(
      userInfo.id!,
      userInfo.displayName,
      userInfo.fullName,
      textController.text,
      userInfo.password,
      userInfo.phone.toString(),
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
            Text(
              "البريد الالكترونى",
              style: TextStyle(
                fontFamily: '.SF Arabic',
                color: const Color(0xFF484C52),
                fontSize: Dimensions.fontSize(context, 1.7),
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              textDirection: TextDirection.rtl,
              keyboardType: TextInputType.emailAddress,
              controller: textController,
              style: TextStyle(
                fontFamily: '.SF Arabic',
                fontSize: Dimensions.fontSize(context, 1.2),
              ),
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8))),
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
