import 'package:flutter/material.dart';

class CommentCard extends StatefulWidget {
  const CommentCard({super.key});

  @override
  State<CommentCard> createState() => _CommentCardState();
}

class _CommentCardState extends State<CommentCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
      decoration: const BoxDecoration(
        border: Border.symmetric(
          horizontal: BorderSide(
            color: Colors.grey,
            width: 0.5,
          ),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 25,
                child: Image.asset("images/person.png"),
              ),
              const SizedBox(
                width: 16,
              ),
              const Text(
                "اسم المستخدم",
                style: TextStyle(
                  color: Color(0xFF088395),
                  fontSize: 17,
                  fontFamily: '.SF Arabic',
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(right: 65),
            child: Text(
              'هنا يظهر النص، هنا يظهر النص، هنا يظهر النص، هنا يظهر النص، هنا يظهر النص، هنا يظهر النص، هنا يظهر النص، هنا يظهر النص، هنا يظهر النص، هنا يظهر النص، هنا يظهر النص، ',
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Color(0xFF263238),
                fontSize: 13,
                fontFamily: '.SF Arabic',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              '3d ago',
              style: TextStyle(
                color: Color(0xFF818796),
                fontSize: 13,
                fontFamily: '.SF Arabic',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
          )
        ],
      ),
    );
  }
}
