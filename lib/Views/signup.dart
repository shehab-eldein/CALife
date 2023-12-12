import 'package:canadianslife/Controllers/AuthenticationController.dart';
import 'package:canadianslife/Extinsions/extensions.dart';
import 'package:canadianslife/Helper/Validator.dart';
import 'package:canadianslife/Views/Shared/CustomLoadingButton.dart';
import 'package:flutter/material.dart';
import 'package:canadianslife/Views/Shared/authTextField.dart';
import 'package:canadianslife/Views/Shared/passTextField.dart';
import 'package:canadianslife/Views/Shared/phoneTextField.dart';
import 'package:provider/provider.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:canadianslife/Helper/Constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../Managers/LayoutManager.dart';
import 'login.dart';

class SignUpView extends StatefulWidget {
  final String? email;
  final String? name;

  //constructor
  SignUpView({Key? key, this.name, this.email}) : super(key: key);

  @override
  _SignUp createState() => _SignUp();
}

class _SignUp extends State<SignUpView> {
  final _nameController = TextEditingController();
  final _nameInAppController = TextEditingController();
  final _emailController = TextEditingController();
  final _authController = AuthenticationController();
  final RoundedLoadingButtonController _signUpBtnController =
      RoundedLoadingButtonController();
  late Validator _validator;

  var name;
  var nameInApp;
  var password;
  var confirmPass;
  var email;
  var number;

  @override
  void initState() {
    _signUpBtnController.start();
    super.initState();
  }

  // void signUppValidation(RoundedLoadingButtonController btnController) {
  //   if (name == null ||
  //       password == null ||
  //       number == null ||
  //       confirmPass == null) {
  //     btnController.reset();
  //     context.okAlert(
  //         title: AppLocalizations.of(context)!.required,
  //         message: AppLocalizations.of(context)!.emptyMessage);
  //   } else if (name != null  && password != null) {
  //     if (!name.toString().isValidName()) {
  //       btnController.reset();
  //       context.okAlert(
  //           title: AppLocalizations.of(context)!.required,
  //           message: AppLocalizations.of(context)!.name3Message);
  //     } else if (password.length < 8) {
  //       //todo app strength bar
  //       context.okAlert(
  //           title: AppLocalizations.of(context)!.required,
  //           message: AppLocalizations.of(context)!.passMustBe);
  //       btnController.reset();
  //     } else if (password != confirmPass.toString()) {
  //       context.okAlert(
  //           title: AppLocalizations.of(context)!.required,
  //           message: AppLocalizations.of(context)!.confirmPassError);
  //       btnController.reset();
  //     } else if (!number.toString().isValidNumber()) {
  //       context.okAlert(
  //           title: AppLocalizations.of(context)!.required,
  //           message: AppLocalizations.of(context)!.numberMustBe);
  //       btnController.reset();
  //     }
  //     if (
  //     password.length >= 8 &&
  //         password == confirmPass.toString() &&
  //         number.toString().isValidNumber() && name.toString().isValidName()) {
  //       print("now we can add to data base");
  //
  //       // print("Selected town befor go");
  //       //print(selectedTownObj!.toJson());
  //       _authController
  //           .signUP(name, nameInApp,email, password, number, "")
  //           .then((user) {
  //         if (user != null) {
  //
  //           btnController.success();
  //           //context.saveUser(user);
  //           //context.navigateTo(bottom app bar);
  //         } else {
  //           btnController.error();
  //           context.okAlert(
  //               title: AppLocalizations.of(context)!.signUp,
  //               message: AppLocalizations.of(context)!.userAlreadyTaken);
  //           btnController.reset();
  //         }
  //       });
  //     } else {
  //       print("Enter Else ");
  //     }
  //   }
  //
  //   // Send the email and password to your backend for authentication
  // }

  void signUpValidation(RoundedLoadingButtonController btnController) {
    String? nameError = _validator.validateName(name);
    String? passwordError = _validator.validatePassword(password);
    String? confirmPassError =
        _validator.validateConfirmPassword(password, confirmPass);
    String? numberError = _validator.validateNumber(number);

    if (nameError != null ||
        passwordError != null ||
        confirmPassError != null ||
        numberError != null) {
      // Display error message
      context.okAlert(
        title: AppLocalizations.of(context)!.required,
        message:
            nameError ?? passwordError ?? confirmPassError ?? numberError ?? "",
      );
      btnController.reset();
    } else {
      // Validation passed, proceed with sign-up
      print("now we can add to data base");
      _authController
          .signUP(name, nameInApp ?? name!, email ?? "", password, number, "")
          .then((user) {
        if (user != null) {
          print(user.id);
          Provider.of<UserData>(context, listen: false).logUser(user);
          Navigator.of(context).pop();
          btnController.success();
          // context.saveUser(user);
          // context.navigateTo(bottom app bar);
        } else {
          btnController.error();
          // context.okAlert(
          //   title: AppLocalizations.of(context)!.signUp,
          //   message: AppLocalizations.of(context)!.userAlreadyTaken,
          // );
          btnController.reset();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final layoutManager = LayoutManager(context);
    _validator = Validator(context);

    return Scaffold(
      backgroundColor: appDesign.backGround,
      body: SingleChildScrollView(
        child: Padding(
          // add space for all padding container
          padding: EdgeInsets.symmetric(
              horizontal: layoutManager.mainHorizontalPadding(), vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Container(
                  height: 225,
                  width: 130,
                  child: Image.asset("images/applogo.png"),
                ),
              ),
              SizedBox(height: 5),
              AuthTextField(
                controller: _nameController,
                labelText: AppLocalizations.of(context)!.userName,
                obscureText: false,
                onChanged: (text) {
                  name = text;
                  setState(() {
                    _nameInAppController.text = text;
                  });
                },
              ),
              AuthTextField(
                controller: _nameInAppController,
                labelText: AppLocalizations.of(context)!.displayName,
                obscureText: false,
                onChanged: (text) {
                  nameInApp = text;
                },
              ),
              PassTextField(
                onChanged: (text) {
                  password = text;
                },
              ),
              PassTextField(
                labelText: "أعد كلمة المرور",
                onChanged: (text) {
                  confirmPass = text;
                },
                onEditeComplete: () {},
              ),
              AuthTextField(
                controller: _emailController,
                labelText: AppLocalizations.of(context)!.email,
                hintText: "123456abcdefgh@linkyou.com",
                obscureText: false,
                onChanged: (text) {
                  email = text;
                },
              ),
              PhoneTextField(
                labelText: AppLocalizations.of(context)!.phone,
                onChanged: (text) {
                  number = text.substring(1);
                },
              ),
              CustomLoadingButton(
                text: AppLocalizations.of(context)!.createNewAccount,
                controller: _signUpBtnController,
                onPressed: () => signUpValidation(_signUpBtnController),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.haveAccount,
                      style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.normal,
                          color: appDesign.colorPrimary),
                    ),
                    TextButton(
                      onPressed: () {
                        context.navigateTo(LoginView());
                      },
                      child: Text(AppLocalizations.of(context)!.logIn,
                          style: const TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: appDesign.colorPrimary,
                          )),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
