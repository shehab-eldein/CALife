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
                Text(
                  // 'لينك يو',
                  userData.userInfo.displayName,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xFF474B51),
                    fontSize: 18,
                    fontFamily: '.SF Arabic',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  userData.userInfo.userType == 0
                      ? AppLocalizations.of(context)!.userType0
                      : AppLocalizations.of(context)!.userType1,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: appDesign.colorAccent,
                    fontSize: 15,
                    fontFamily: '.SF Arabic',
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  userData.userInfo.email.length < 22
                      ? userData.userInfo.email
                      : '...${userData.userInfo.email.substring(0, 22)}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0x7F474B51),
                    fontSize: 15,
                    fontFamily: 'SF Pro',
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  userData.userInfo.phone ?? " ",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0x7F474B51),
                    fontSize: 15,
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
