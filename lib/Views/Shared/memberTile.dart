import 'package:flutter/material.dart';
import 'package:canadianslife/Helper/Constants.dart';

class MemberTile extends StatefulWidget {
  const MemberTile({super.key});

  @override
  State<MemberTile> createState() => _MemberTileState();
}

class _MemberTileState extends State<MemberTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: const Border(
        bottom: BorderSide(color: appDesign.colorUnhighlighted, width: 1),
      ),
      title: const Text(
        'لينك يو',
        textAlign: TextAlign.right,
        style: TextStyle(
          color: Color(0xFF323438),
          fontSize: 17,
          fontFamily: '.SF Arabic',
          fontWeight: FontWeight.bold,
          height: 0.08,
        ),
      ),
      leading: const CircleAvatar(
        backgroundColor: Colors.grey,
        backgroundImage: AssetImage("images/person.png"),
        radius: 25,
      ),
      trailing: Wrap(
        spacing: 16,
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5), color: appDesign.red),
            child: InkWell(
              onTap: () {},
              child: const Icon(
                Icons.close,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: appDesign.colorAccent),
            child: InkWell(
              onTap: () {},
              child: const Icon(
                Icons.check_sharp,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
