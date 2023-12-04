import 'package:canadianslife/Helper/Constants.dart';
import 'package:flutter/material.dart';

class NotFoundView extends StatefulWidget {
  const NotFoundView({super.key, this.isNoGroups});
  final bool? isNoGroups;
  @override
  State<NotFoundView> createState() => _NotFoundViewState();
}

class _NotFoundViewState extends State<NotFoundView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        widget.isNoGroups == false
            ? SizedBox(height: 150)
            : SizedBox(height: 0),
        const Image(
          image: AssetImage("images/none.png"),
        ),
        Text(
          widget.isNoGroups == false ? 'لا توجد منشورات' : 'لا توجد مجموعات',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xBF030F2E),
            fontSize: 22,
            fontFamily: '.SF Arabic',
            fontWeight: FontWeight.w500,
            height: 0,
          ),
        ),
        Text(
          widget.isNoGroups == false
              ? 'اشترك في مجموعات لتري آخر تحديث'
              : 'انت غير مشترك في اي مجموعة',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0x7F030F2E),
            fontSize: 17,
            fontFamily: '.SF Arabic',
            fontWeight: FontWeight.w400,
            height: 0,
          ),
        ),
        const Text(
          'استكشف المجموعات',
          textAlign: TextAlign.right,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontFamily: '.SF Arabic',
            fontWeight: FontWeight.w500,
            height: 0.08,
          ),
        ),
        const SizedBox(height: 20),
        MaterialButton(
          color: appDesign.colorPrimary,
          onPressed: () {},
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Padding(
            padding: EdgeInsets.all(10.0),
            child: Wrap(
              spacing: 5,
              alignment: WrapAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'استكشف المجموعات',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: '.SF Arabic',
                      fontWeight: FontWeight.w500,
                      height: 0.08,
                    ),
                  ),
                ),
                Icon(
                  Icons.groups_2,
                  color: Colors.white,
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
