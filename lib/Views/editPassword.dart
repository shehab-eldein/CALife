import 'package:canadianslife/Controllers/UserController.dart';
import 'package:canadianslife/Models/User.dart';
import 'package:flutter/material.dart';
import '../Helper/responsive.dart';
import 'package:canadianslife/views/shared/save_btn.dart';

class EditPasswordView extends StatefulWidget {
  const EditPasswordView(
      {super.key, required this.userInfo, required this.refresh});
  final User userInfo;
  final Function refresh;

  @override
  State<EditPasswordView> createState() => _EditPasswordViewState();
}

class _EditPasswordViewState extends State<EditPasswordView> {
  final TextEditingController textController = TextEditingController();
  final TextEditingController textController2 = TextEditingController();
  bool hidePassword = true;
  bool hidePassword2 = true;

  void editInfo() async {
    User? userInfo = widget.userInfo;
    await UserController().editUser(
      userInfo.id!,
      userInfo.displayName,
      userInfo.fullName,
      userInfo.email,
      textController.text,
      userInfo.phone.toString(),
      userInfo.userType!,
    );
    Navigator.of(context).pop();
    widget.refresh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            Text(
              "كلمة المرور الجديدة",
              style: TextStyle(
                fontFamily: '.SF Arabic',
                color: const Color(0xFF484C52),
                fontSize: Dimensions.fontSize(context, 1.5),
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              textDirection: TextDirection.rtl,
              obscureText: hidePassword,
              keyboardType: TextInputType.text,
              controller: textController,
              style: TextStyle(
                fontFamily: '.SF Arabic',
                fontSize: Dimensions.fontSize(context, 1.2),
              ),
              decoration: InputDecoration(
                prefixIcon: IconButton(
                    icon: hidePassword
                        ? const Icon(Icons.visibility_off_outlined)
                        : const Icon(Icons.visibility_outlined),
                    onPressed: () {
                      setState(() {
                        hidePassword = !hidePassword;
                      });
                    }),
                border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF030F2E)),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Text(
              "تاكيد كلمة المرور الجديدة",
              style: TextStyle(
                fontFamily: '.SF Arabic',
                color: const Color(0xFF484C52),
                fontSize: Dimensions.fontSize(context, 1.5),
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              obscureText: hidePassword2,
              textDirection: TextDirection.rtl,
              keyboardType: TextInputType.text,
              controller: textController2,
              style: TextStyle(
                fontFamily: '.SF Arabic',
                fontSize: Dimensions.fontSize(context, 1.2),
              ),
              decoration: InputDecoration(
                prefixIcon: IconButton(
                    icon: hidePassword2
                        ? const Icon(Icons.visibility_off_outlined)
                        : const Icon(Icons.visibility_outlined),
                    onPressed: () {
                      setState(() {
                        hidePassword2 = !hidePassword2;
                      });
                    }),
                border: const OutlineInputBorder(
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
