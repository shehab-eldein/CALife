import 'package:canadianslife/Helper/Constants.dart';
import 'package:canadianslife/Helper/responsive.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileInfoRow extends StatefulWidget {
  const ProfileInfoRow({super.key});

  @override
  State<ProfileInfoRow> createState() => _ProfileInfoRowState();
}

class _ProfileInfoRowState extends State<ProfileInfoRow> {
  int userId = UserData().getId();
  @override
  Widget build(BuildContext context) {
    return Consumer<UserData>(
      builder: (context, userData, child) {
        return Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(200),
              child: FadeInImage(
                height: Dimensions.widthPercentage(context, 25),
                width: Dimensions.widthPercentage(context, 25),
                image: NetworkImage('${Constant.baseURL}imgusers/$userId.jpg'),
                placeholder: const AssetImage('images/person.png'),
                imageErrorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    'images/person.png',
                    fit: BoxFit.fill,
                    height: Dimensions.widthPercentage(context, 25),
                    width: Dimensions.widthPercentage(context, 25),
                  );
                },
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: Dimensions.widthPercentage(context, 60),
                  child: Text(
                    // 'لينك يو',
                    userData.userInfo.displayName,
                    style: TextStyle(
                      color: Color(0xFF474B51),
                      fontSize: Dimensions.fontSize(context, 1.5),
                      fontFamily: '.SF Arabic',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                SizedBox(
                  width: Dimensions.widthPercentage(context, 60),
                  child: Text(
                    userData.userInfo.userType == 0
                        ? AppLocalizations.of(context)!.userType0
                        : AppLocalizations.of(context)!.userType1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: appDesign.colorAccent,
                      fontSize: Dimensions.fontSize(context, 1.5),
                      fontFamily: '.SF Arabic',
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                SizedBox(
                  width: Dimensions.widthPercentage(context, 60),
                  child: Text(
                    overflow: TextOverflow.ellipsis,
                    userData.userInfo.email,
                    style: TextStyle(
                      color: Color(0x7F474B51),
                      fontSize: Dimensions.fontSize(context, 1.5),
                      fontFamily: 'SF Pro',
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  userData.userInfo.phone ?? " ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0x7F474B51),
                    fontSize: Dimensions.fontSize(context, 1.5),
                    fontFamily: 'SF Pro',
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
