import 'package:canadianslife/Extinsions/extensions.dart';
import 'package:canadianslife/Views/Shared/BottomNavigation.dart';
import 'package:canadianslife/Views/Shared/CustomLoadingButton.dart';
import 'package:canadianslife/Views/signup.dart';
// import 'package:canadianslife/Views/splash.dart';
import 'package:flutter/material.dart';
import 'package:canadianslife/Views/Shared/authTextField.dart';
import 'package:canadianslife/Views/Shared/passTextField.dart';
// import 'package:canadianslife/Views/Shared/phoneTextField.dart';
import 'package:provider/provider.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:canadianslife/Helper/Constants.dart';
import '../Controllers/AuthenticationController.dart';
import '../Managers/LayoutManager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginView extends StatefulWidget {
  //constructor
  final int? redirectScreen;
  const LoginView({Key? key, this.redirectScreen}) : super(key: key);
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginView> {
  final RoundedLoadingButtonController _loginBtnController =
      RoundedLoadingButtonController();
  // final RoundedLoadingButtonController _googleBtnController =
  //     RoundedLoadingButtonController();
  var email;
  var pass;
  final _authController = AuthenticationController();

  @override
  void initState() {
    super.initState();
  }

  void loginValidation(RoundedLoadingButtonController btnController) {
    if (email == null || pass == null) {
      context.okAlert(
          title: AppLocalizations.of(context)!.required,
          message: AppLocalizations.of(context)!.emptyMessage);
      btnController.reset();
    } else {
      _authController.login(email, pass).then((user) {
        if (user != null) {
          Provider.of<UserData>(context, listen: false).logUser(user);
          btnController.success();
        } else {
          context.okAlert(
              title: AppLocalizations.of(context)!.invalid,
              message: AppLocalizations.of(context)!.invalidEmail_Pass);
          btnController.reset();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final layoutManager = LayoutManager(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          // add space for all padding container
          padding: EdgeInsets.symmetric(
            horizontal: layoutManager.mainHorizontalPadding(),
            vertical: 60,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Center(
                child: Container(
                  height: 225,
                  width: 130,
                  child: Image.asset("images/applogo.png"),
                ),
              ),
              SizedBox(height: layoutManager.valuesHandler(30, 10, 10, 10)),
              AuthTextField(
                  labelText: AppLocalizations.of(context)!.usernameEmail,
                  obscureText: false,
                  onChanged: (text) {
                    email = text;
                  }),
              PassTextField(
                onChanged: (text) {
                  pass = text;
                },
              ),
              CustomLoadingButton(
                  controller: _loginBtnController,
                  text: AppLocalizations.of(context)!.logIn,
                  onPressed: () => loginValidation(_loginBtnController)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppLocalizations.of(context)!.dontHaveAccount,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: appDesign.colorPrimary,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      context.navigateTo(SignUpView());
                    },
                    child: Text(AppLocalizations.of(context)!.createNewAccount,
                        style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                            color: appDesign.colorPrimary,
                            decoration: TextDecoration.underline)),
                  )
                ],
              ),
              Center(
                child: TextButton(
                    onPressed: () {
                      Provider.of<UserData>(context, listen: false).logGuest();
                      currentIndex = 1;
                    },
                    child: Text(
                      AppLocalizations.of(context)!.loginAsGuest,
                      style: const TextStyle(
                          fontSize: 18, color: appDesign.colorPrimaryDark),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
