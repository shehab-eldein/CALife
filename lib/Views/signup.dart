import 'package:canadianslife/Extinsions/extensions.dart';
import 'package:canadianslife/Views/Shared/CustomLoadingButton.dart';
import 'package:flutter/material.dart';
import 'package:canadianslife/Views/Shared/authTextField.dart';
import 'package:canadianslife/Views/Shared/passTextField.dart';
import 'package:canadianslife/Views/Shared/phoneTextField.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:canadianslife/Helper/Constants.dart';

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

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final RoundedLoadingButtonController _signUpBtnController =
  RoundedLoadingButtonController();
  var isLoading = false;
  String email = "";
  var name;
  String password = "";
  var confirmPass;
  var number;


  @override
  void initState() {
    _signUpBtnController.start();
    super.initState();

  }



  @override
  Widget build(BuildContext context) {
    final  layoutManager = LayoutManager(context);
    return Scaffold(

      backgroundColor: appDesign.backGround,
      body: SingleChildScrollView(
        child: Padding(
          // add space for all padding container
          padding: EdgeInsets.symmetric(
              horizontal: layoutManager.mainHorizontalPadding()
              , vertical: 10  ),
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
              SizedBox(height:5),

              AuthTextField(
                controller: nameController,
                labelText: "إسم المستخدم",
                obscureText: false,
                onChanged: (text) {
                  name = text;
                },

              ),
              AuthTextField(
                controller: nameController,
                labelText: "الإسم بالكامل",
                obscureText: false,
                onChanged: (text) {
                  name = text;
                },

              ),
              AuthTextField(
                controller: nameController,
                labelText: "الإسم المعروض داخل التطبيق",
                obscureText: false,
                onChanged: (text) {
                  name = text;
                },

              ),
              PassTextField(
                onChanged: (text) {
                  password = text;
                },
              ),
              PassTextField(
                labelText:"أعد كلمة المرور",

                onChanged: (text) {
                  confirmPass = text;
                },
                onEditeComplete: () {

                },
              ),
              AuthTextField(
                controller: emailController,
                labelText: "البريد الإلكتروني (إختياري)",
                hintText: "123456abcdefgh@linkyou.com",
                obscureText: false,
                onChanged: (text) {
                  email = text;
                },
              ),
              PhoneTextField(
                labelText: "رقم التليفون (إختياري)",
                onChanged: (text) {
                  number = text.substring(1);
                },
              ),



              CustomLoadingButton(
                text: "إنشاء حساب",
                controller: _signUpBtnController,
                onPressed: () {  },
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal:0, vertical: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "هل لديك حساب؟",
                      style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.normal,
                          color: appDesign.colorPrimary),
                    ),
                    TextButton(
                      onPressed: () {
                        context.navigateTo(LoginView());
                      },
                      child: Text(
                      "تسجيل الدخول",

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
