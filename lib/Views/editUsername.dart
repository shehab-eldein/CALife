import 'package:canadianslife/Controllers/UserController.dart';
import 'package:canadianslife/Helper/Constants.dart';
import 'package:canadianslife/Models/User.dart';
import 'package:flutter/material.dart';
import 'package:canadianslife/Helper/responsive.dart';
import 'package:canadianslife/views/shared/save_btn.dart';
import 'package:provider/provider.dart';

class EditUsernameView extends StatefulWidget {
  const EditUsernameView(
      {super.key, required this.userInfo, required this.refresh});
  final User userInfo;
  final Function refresh;
  @override
  State<EditUsernameView> createState() => _EditUsernameViewState();
}

class _EditUsernameViewState extends State<EditUsernameView> {
  void editInfo() async {
    User? userInfo = widget.userInfo;
    await UserController()
        .editUser(
          userInfo.id!,
          textController.text,
          userInfo.fullName,
          userInfo.email,
          userInfo.password,
          userInfo.phone.toString(),
          userInfo.userType!,
        )
        .then((value) =>
            Provider.of<UserData>(context, listen: false).logUser(value));
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
              "اسم المستخدم",
              style: TextStyle(
                fontFamily: '.SF Arabic',
                color: const Color(0xFF484C52),
                fontSize: Dimensions.fontSize(context, 1.7),
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              keyboardType: TextInputType.text,
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
