import 'package:canadianslife/Helper/responsive.dart';
import 'package:flutter/material.dart';

class ProfileInfoRow extends StatefulWidget {
  const ProfileInfoRow({super.key});

  @override
  State<ProfileInfoRow> createState() => _ProfileInfoRowState();
}

class _ProfileInfoRowState extends State<ProfileInfoRow> {
  @override
  Widget build(BuildContext context) {
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
        const Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'لينك يو',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF474B51),
                fontSize: 18,
                fontFamily: '.SF Arabic',
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 4),
            Text(
              'مقيم او مهاجر جديد لكندا',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF04BFDB),
                fontSize: 15,
                fontFamily: '.SF Arabic',
              ),
            ),
            SizedBox(height: 4),
            Text(
              '1234567890abc@Linkyou.ca',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0x7F474B51),
                fontSize: 15,
                fontFamily: 'SF Pro',
              ),
            ),
            SizedBox(height: 4),
            Text(
              '123456789000+',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0x7F474B51),
                fontSize: 15,
                fontFamily: 'SF Pro',
              ),
            ),
          ],
        ),
      ],
    );
  }
}
