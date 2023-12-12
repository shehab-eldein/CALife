import 'package:canadianslife/Helper/Constants.dart';
import 'package:canadianslife/Models/TopicComment.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CommentCard extends StatefulWidget {
  const CommentCard({super.key, required this.commentInfo});
  final TopicComment commentInfo;

  @override
  State<CommentCard> createState() => _CommentCardState();
}

class _CommentCardState extends State<CommentCard> {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserData>(builder: (context, userData, child) {
      bool isArabic = userData.userLanguage == "ar" ? true : false;
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
                ClipRRect(
                  borderRadius: BorderRadius.circular(200),
                  child: FadeInImage(
                    height: 50,
                    width: 50,
                    image: NetworkImage(
                        '${Constant.baseURL}imgusers/${widget.commentInfo.userId}.jpg'),
                    placeholder: const AssetImage(
                      'images/person.png',
                    ),
                    imageErrorBuilder: (context, error, stackTrace) {
                      return Image.asset(
                        'images/person.png',
                        fit: BoxFit.fill,
                        height: 50,
                        width: 50,
                      );
                    },
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Text(
                  widget.commentInfo.user!.displayName,
                  style: const TextStyle(
                    color: Color(0xFF088395),
                    fontSize: 17,
                    fontFamily: '.SF Arabic',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                  right: isArabic ? 65 : 0, left: isArabic ? 0 : 65),
              child: Align(
                alignment: isArabic ? Alignment.topRight : Alignment.topLeft,
                child: Text(
                  widget.commentInfo.commentDetails,
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    color: Color(0xFF263238),
                    fontSize: 13,
                    fontFamily: '.SF Arabic',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
            ),
            Align(
              alignment:
                  isArabic ? Alignment.bottomLeft : Alignment.bottomRight,
              child: const Text(
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
    });
  }
}
