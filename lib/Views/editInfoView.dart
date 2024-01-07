import 'package:canadianslife/Controllers/UserController.dart';
import 'package:canadianslife/Extinsions/extensions.dart';
import 'package:canadianslife/Helper/Constants.dart';
import 'package:canadianslife/Models/User.dart';
import 'package:canadianslife/Views/Shared/EditDataView.dart';
import 'package:canadianslife/Views/Shared/EditInfoTile.dart';
import 'package:canadianslife/Views/Shared/EditInfoTileBtn.dart';
import 'package:canadianslife/Views/Shared/user_img.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Helper/responsive.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
            body: ListView(
              children: [
                SizedBox(
                  height: Dimensions.heightPercentage(context, 5),
                ),
                const Align(alignment: Alignment.center, child: UserImage()),
                SizedBox(
                  height: Dimensions.heightPercentage(context, 5),
                ),
                AppEditInfoTile(
                    title: AppLocalizations.of(context)!.userName,
                    trailing: userInfo!.displayName,
                    onPressed: () {
                      context.navigateTo(
                        EditDataView(
                          type: 0,
                          userInfo: userInfo!,
                          refresh: getUserInfo,
                          title: AppLocalizations.of(context)!.userName,
                        ),
                      );
                    }),
                AppEditInfoTile(
                    title: AppLocalizations.of(context)!.statue,
                    trailing: userInfo!.userType == 0
                        ? AppLocalizations.of(context)!.userType0
                        : AppLocalizations.of(context)!.userType1,
                    onPressed: () {
                      context.navigateTo(
                        EditDataView(
                          type: 1,
                          userInfo: userInfo!,
                          refresh: getUserInfo,
                          title: '',
                        ),
                      );
                    }),
                AppEditInfoTile(
                    title: AppLocalizations.of(context)!.email,
                    trailing: userInfo!.email,
                    onPressed: () {
                      context.navigateTo(
                        EditDataView(
                          type: 2,
                          userInfo: userInfo!,
                          refresh: getUserInfo,
                          title: AppLocalizations.of(context)!.email,
                        ),
                      );
                    }),
                AppEditInfoTile(
                    title: AppLocalizations.of(context)!.phone,
                    trailing: userInfo!.phone.toString(),
                    onPressed: () {
                      context.navigateTo(
                        EditDataView(
                          type: 3,
                          userInfo: userInfo!,
                          refresh: getUserInfo,
                          title: AppLocalizations.of(context)!.phone,
                        ),
                      );
                    }),
                AppListTileBtn(
                    title: AppLocalizations.of(context)!.password,
                    trailing: AppLocalizations.of(context)!.change,
                    icon: Icons.compare_arrows,
                    trailingColor: appDesign.colorPrimaryDark,
                    onPressed: () {
                      context.navigateTo(
                        EditDataView(
                          type: 4,
                          userInfo: userInfo!,
                          refresh: getUserInfo,
                          title: AppLocalizations.of(context)!.password,
                        ),
                      );
                    }),
                AppListTileBtn(
                    title: AppLocalizations.of(context)!.account,
                    trailing: AppLocalizations.of(context)!.delete,
                    icon: Icons.delete_outline,
                    trailingColor: appDesign.red,
                    onPressed: () {}),
              ],
            ),
          )
        : const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
