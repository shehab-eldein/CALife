import 'package:canadianslife/Controllers/UserController.dart';
import 'package:canadianslife/Helper/Constants.dart';
import 'package:canadianslife/Models/User.dart';
import 'package:canadianslife/Views/Shared/EditDataView.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Helper/responsive.dart';
import 'package:canadianslife/views/shared/EditInfoTile.dart';
import 'package:canadianslife/views/shared/EditInfoTileBtn.dart';
import 'package:canadianslife/views/shared/user_img.dart';

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
    super.initState();
    getUserInfo();
  }

  void getUserInfo() async {
    int userId = Provider.of<UserData>(context, listen: false).userInfo.id;
    userInfo = await UserController().loginById(userId);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading == false && userInfo != null
        ? Scaffold(
            body: Directionality(
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
                            builder: (context) => EditDataView(
                              type: 0,
                              userInfo: userInfo!,
                              refresh: getUserInfo,
                              title: 'اسم المستخدم',
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
                            builder: (context) => EditDataView(
                              type: 1,
                              userInfo: userInfo!,
                              refresh: getUserInfo,
                              title: '',
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
                            builder: (context) => EditDataView(
                              type: 2,
                              userInfo: userInfo!,
                              refresh: getUserInfo,
                              title: 'البريد الالكترونى',
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
                            builder: (context) => EditDataView(
                              type: 3,
                              userInfo: userInfo!,
                              refresh: getUserInfo,
                              title: 'رقم الهاتف',
                            ),
                          ),
                        );
                      }),
                  AppListTileBtn(
                      title: 'كلمة السر',
                      trailing: "تغيير",
                      icon: Icons.compare_arrows,
                      trailingColor: appDesign.colorPrimaryDark,
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => EditDataView(
                              type: 4,
                              userInfo: userInfo!,
                              refresh: getUserInfo,
                              title: 'كلمة المرور الجديدة',
                            ),
                          ),
                        );
                      }),
                  AppListTileBtn(
                      title: 'الحساب',
                      trailing: "حذف",
                      icon: Icons.delete_outline,
                      trailingColor: appDesign.red,
                      onPressed: () {}),
                ],
              ),
            ),
          )
        : const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
