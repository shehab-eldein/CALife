import 'package:canadianslife/Controllers/UserController.dart';
import 'package:canadianslife/Helper/Constants.dart';
import 'package:canadianslife/Helper/responsive.dart';
import 'package:canadianslife/Models/User.dart';
import 'package:canadianslife/Views/Shared/phoneTextField.dart';
import 'package:canadianslife/Views/Shared/save_btn.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:canadianslife/Extinsions/extensions.dart';
import 'package:canadianslife/Helper/Validator.dart';

class EditDataView extends StatefulWidget {
  const EditDataView({
    super.key,
    required this.userInfo,
    required this.type,
    required this.title,
    required this.refresh,
  });
  final User userInfo;
  final int type;
  final String title;
  final Function refresh;

  @override
  State<EditDataView> createState() => _EditDataViewState();
}

class _EditDataViewState extends State<EditDataView> {
  bool isInCanada = true;
  final TextEditingController textController = TextEditingController();
  final TextEditingController textController2 = TextEditingController();
  bool hidePassword = false;
  bool hidePassword2 = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isInCanada = widget.userInfo.userType == 0 ? true : false;
  }

  editInfo() async {
    User? userInfo = widget.userInfo;
    await UserController()
        .editUser(
          userInfo.id,
          widget.type == 0 ? textController.text : userInfo.displayName,
          userInfo.fullName,
          widget.type == 2 ? textController.text : userInfo.email,
          widget.type == 4 ? textController.text : userInfo.password,
          widget.type == 3 ? textController.text : userInfo.phone.toString(),
          widget.type == 1
              ? isInCanada
                  ? 0
                  : 1
              : userInfo.userType!,
          null,
        )
        .then((value) =>
            Provider.of<UserData>(context, listen: false).logUser(value));
    // ignore: use_build_context_synchronously
    Navigator.of(context).pop();
    widget.refresh();
  }

  late Validator validator;
  validate() {
    String? error = widget.type == 0
        ? validator.validateName(textController.text)
        : widget.type == 2
            ? validator.validateEmail(textController.text)
            : widget.type == 3
                ? validator.validateNumber(textController.text)
                : widget.type == 4
                    ? validator.validatePassword(textController.text)
                    : null;
    String? confirmPassError = validator.validateConfirmPassword(
        textController.text, textController2.text);

    if (error != null) {
      // Display error message
      setState(() {
        isPressed = false;
      });
      context.okAlert(
        title: AppLocalizations.of(context)!.required,
        message: error,
      );
    } else {
      if (widget.type == 4 && error == null) {
        if (confirmPassError != null) {
          // Display error message
          setState(() {
            isPressed = false;
          });
          context.okAlert(
            title: AppLocalizations.of(context)!.required,
            message: confirmPassError,
          );
        } else if (widget.type == 4 &&
            error == null &&
            confirmPassError == null) {
          editInfo();
        }
      } else {
        editInfo();
      }
    }
  }

  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    validator = Validator(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: widget.type != 1
            ? Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: TextStyle(
                          fontFamily: '.SF Arabic',
                          color: const Color(0xFF484C52),
                          fontSize: Dimensions.fontSize(context, 1.7),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 10),
                      widget.type == 3
                          ? PhoneTextField(
                              labelText: "",
                              onChanged: (text) {
                                textController.text = text.substring(1);
                              },
                            )
                          : TextField(
                              obscureText: hidePassword,
                              keyboardType: TextInputType.text,
                              controller: textController,
                              style: TextStyle(
                                fontFamily: '.SF Arabic',
                                fontSize: Dimensions.fontSize(context, 1.2),
                                height: 0.9,
                              ),
                              decoration: InputDecoration(
                                suffixIcon: widget.type == 4
                                    ? IconButton(
                                        icon: hidePassword
                                            ? const Icon(
                                                Icons.visibility_off_outlined)
                                            : const Icon(
                                                Icons.visibility_outlined),
                                        onPressed: () {
                                          setState(() {
                                            hidePassword = !hidePassword;
                                          });
                                        })
                                    : null,
                                border: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8))),
                              ),
                            ),
                      SizedBox(height: 10),
                      widget.type == 4
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  AppLocalizations.of(context)!.confirmPassword,
                                  style: TextStyle(
                                    fontFamily: '.SF Arabic',
                                    color: const Color(0xFF484C52),
                                    fontSize: Dimensions.fontSize(context, 1.7),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                TextField(
                                  obscureText: hidePassword2,
                                  keyboardType: TextInputType.text,
                                  controller: textController2,
                                  style: TextStyle(
                                    height: 0.9,
                                    fontFamily: '.SF Arabic',
                                    fontSize: Dimensions.fontSize(context, 1.2),
                                  ),
                                  decoration: InputDecoration(
                                    suffixIcon: widget.type == 4
                                        ? IconButton(
                                            icon: hidePassword2
                                                ? const Icon(Icons
                                                    .visibility_off_outlined)
                                                : const Icon(
                                                    Icons.visibility_outlined),
                                            onPressed: () {
                                              setState(() {
                                                hidePassword2 = !hidePassword2;
                                              });
                                            })
                                        : null,
                                    border: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8))),
                                  ),
                                ),
                              ],
                            )
                          : SizedBox(),
                      const Spacer(),
                      MaterialButton(
                        height: 48,
                        minWidth: double.infinity,
                        color: appDesign.colorAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        onPressed: () {
                          setState(() {
                            isPressed = true;
                          });
                          validate();
                        },
                        child: isPressed
                            ? const Padding(
                                padding: EdgeInsets.all(5.0),
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              )
                            : Text(
                                AppLocalizations.of(context)!.save,
                                style: TextStyle(
                                    fontFamily: '.SF Arabic',
                                    color: Colors.white,
                                    fontSize:
                                        Dimensions.fontSize(context, 1.3)),
                              ),
                      ),
                    ]),
              )
            : Padding(
                padding: EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: Dimensions.widthPercentage(context, 7)),
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
                                      : Border.all(
                                          color: appDesign.colorAccent,
                                          width: 2),
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
                                    AppLocalizations.of(context)!.userType1,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: '.SF Arabic',
                                        color: appDesign.colorPrimary,
                                        fontSize:
                                            Dimensions.fontSize(context, 1.5),
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 0,
                                child: Checkbox(
                                  side: const BorderSide(
                                    color: appDesign
                                        .colorAccent, //your desire colour here
                                    width: 2,
                                  ),
                                  activeColor: appDesign.colorAccent,
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
                        SizedBox(
                            width: Dimensions.widthPercentage(context, 5.9)),
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
                                      ? Border.all(
                                          color: appDesign.colorAccent,
                                          width: 2)
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
                                    AppLocalizations.of(context)!.userType0,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: '.SF Arabic',
                                        color: appDesign.colorPrimary,
                                        fontSize:
                                            Dimensions.fontSize(context, 1.5),
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 0,
                                child: Checkbox(
                                  side: const BorderSide(
                                    color: appDesign
                                        .colorAccent, //your desire colour here
                                    width: 2,
                                  ),
                                  activeColor: appDesign.colorAccent,
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
