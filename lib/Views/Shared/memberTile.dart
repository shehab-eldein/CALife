import 'package:canadianslife/Models/GroupSubscriber.dart';
import 'package:flutter/material.dart';
import 'package:canadianslife/Helper/Constants.dart';

class MemberTile extends StatefulWidget {
  const MemberTile(
      {super.key,
      required this.subscriber,
      this.accept,
      this.reject,
      this.removeAccept});
  final GroupSubscriber subscriber;
  final Function? accept;
  final Function? reject;
  final bool? removeAccept;
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
      title: Text(
        widget.subscriber.user!.displayName,
        textAlign: TextAlign.right,
        style: const TextStyle(
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
                borderRadius: BorderRadius.circular(5),
                color: const Color(0xFFFF0000)),
            child: InkWell(
              onTap: () {
                widget.reject!(widget.subscriber);
              },
              child: const Icon(
                Icons.close,
                color: Colors.white,
              ),
            ),
          ),
          widget.removeAccept != null && widget.removeAccept == true
              ? const SizedBox()
              : Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: appDesign.colorAccent),
                  child: InkWell(
                    onTap: () {
                      widget.accept!(widget.subscriber.id);
                    },
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
