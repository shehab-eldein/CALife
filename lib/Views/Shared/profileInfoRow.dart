import 'package:canadianslife/Helper/Constants.dart';
import 'package:canadianslife/Helper/responsive.dart';
import 'package:canadianslife/Models/User.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileInfoRow extends StatefulWidget {
  const ProfileInfoRow({super.key});

  @override
  State<ProfileInfoRow> createState() => _ProfileInfoRowState();
}

class _ProfileInfoRowState extends State<ProfileInfoRow> {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserData>(
      builder: (context, userData, child) {
        return Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey,
              backgroundImage: const AssetImage("images/person.png"),
              radius: Dimensions.radius(context, 4),
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
                      ? 'مقيم او مهاجر جديد لكندا'
                      : 'مهتم بالهجرة لكندا',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xFF04BFDB),
                    fontSize: 15,
                    fontFamily: '.SF Arabic',
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  userData.userInfo.email,
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
