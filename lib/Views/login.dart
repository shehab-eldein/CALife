import 'package:canadianslife/Extinsions/extensions.dart';
import 'package:canadianslife/Views/Shared/CustomLoadingButton.dart';
import 'package:canadianslife/Views/signup.dart';
import 'package:canadianslife/Views/splash.dart';
import 'package:flutter/material.dart';
import 'package:canadianslife/Views/Shared/authTextField.dart';
import 'package:canadianslife/Views/Shared/passTextField.dart';
import 'package:canadianslife/Views/Shared/phoneTextField.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:canadianslife/Helper/Constants.dart';
import '../Managers/LayoutManager.dart';


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
  final RoundedLoadingButtonController _googleBtnController =
  RoundedLoadingButtonController();
  var email;
  var pass;

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final  layoutManager = LayoutManager(context);
    return Scaffold(

      body: SingleChildScrollView(
        child: Padding(
          // add space for all padding container
          padding: EdgeInsets.symmetric(
              horizontal: layoutManager.mainHorizontalPadding()
              , vertical: 20 ),
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
              SizedBox(height:layoutManager.valuesHandler(30, 10, 10, 10)),

              AuthTextField(
                  labelText: "إسم المستخدم/البريد الإلكتروني",
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
                  text:"تسجيل الدخول" ,
                  onPressed: () {

                  }),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "إنشاء حساب جديد",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: appDesign.colorPrimary ,
                        decoration: TextDecoration.underline
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      context.navigateTo(SignUpView());
                    },
                    child: Text("ليس لديك حساب؟",
                        style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.normal,
                            color: appDesign.colorPrimary,

                        )),
                  )
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
