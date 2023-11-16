import 'package:canadianslife/Controllers/UserController.dart';
import 'package:canadianslife/Helper/Constants.dart';
import 'package:canadianslife/Models/User.dart';
import 'package:flutter/material.dart';
import '../Helper/responsive.dart';
import 'package:canadianslife/views/editEmail.dart';
import 'package:canadianslife/views/editPassword.dart';
import 'package:canadianslife/views/editPhone.dart';
import 'package:canadianslife/views/editInterest.dart';
import 'package:canadianslife/views/editUsername.dart';
import 'package:canadianslife/views/shared/EditInfoTile.dart';
import 'package:canadianslife/views/shared/EditInfoTileBtn.dart';
import 'package:canadianslife/views/shared/user_img.dart';
import '../colors.dart';

class EditInfoView extends StatefulWidget {
  const EditInfoView({super.key});

  @override
  State<EditInfoView> createState() => _EditInfoViewState();
}

class _EditInfoViewState extends State<EditInfoView> {
  late User? userInfo;
  bool isLoading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserInfo();
  }

  void getUserInfo() async {
    userInfo = await UserController().loginById(Constant.currentUserId);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading == false && userInfo != null
        ? Directionality(
            textDirection: TextDirection.rtl,
            child: ListView(
              children: [
                SizedBox(
                  height: Dimensions.heightPercentage(context, 5),
                ),
                const Align(
                  alignment: Alignment.center,
                  child: UserImage(),
                ),
                SizedBox(
                  height: Dimensions.heightPercentage(context, 5),
                ),
                AppEditInfoTile(
                    title: 'اسم المستخدم',
                    trailing: userInfo!.displayName,
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => EditUsernameView(
                            userInfo: userInfo!,
                            refresh: getUserInfo,
                          ),
                        ),
                      );
                    }),
                AppEditInfoTile(
                    title: 'الحالة',
                    trailing: userInfo!.userType == 0
                        ? 'مقيم او مهاجر جديد لكندا'
                        : 'مهتم بالهجرة لكندا',
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => EditInterestView(
                            userInfo: userInfo!,
                            refresh: getUserInfo,
                          ),
                        ),
                      );
                    }),
                AppEditInfoTile(
                    title: 'البريد الالكترونى',
                    trailing: userInfo!.email,
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => EditEmailView(
                            userInfo: userInfo!,
                            refresh: getUserInfo,
                          ),
                        ),
                      );
                    }),
                AppEditInfoTile(
                    title: 'رقم الهاتف',
                    trailing: userInfo!.phone.toString(),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => EditPhoneView(
                            userInfo: userInfo!,
                            refresh: getUserInfo,
                          ),
                        ),
                      );
                    }),
                AppListTileBtn(
                    title: 'كلمة السر',
                    trailing: "تغيير",
                    icon: Icons.compare_arrows,
                    trailingColor: blueColor,
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => EditPasswordView(
                            userInfo: userInfo!,
                            refresh: getUserInfo,
                          ),
                        ),
                      );
                    }),
                AppListTileBtn(
                    title: 'الحساب',
                    trailing: "حذف",
                    icon: Icons.delete_outline,
                    trailingColor: redColor,
                    onPressed: () {}),
              ],
            ),
          )
        : Center(child: CircularProgressIndicator());
  }
}
