import 'package:flutter/material.dart';
import '../../Helper/responsive.dart';
import '../../colors.dart';

class UserImage extends StatefulWidget {
  const UserImage({super.key});

  @override
  State<UserImage> createState() => _UserImageState();
}

class _UserImageState extends State<UserImage> {
  String img = "images/person.png";
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      CircleAvatar(
        backgroundColor: Colors.grey,
        backgroundImage: AssetImage(img),
        radius: Dimensions.radius(context, 5),
      ),
      Positioned(
        right: 0,
        bottom: 0,
        child: InkWell(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.all(.5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(90.0),
              color: lightBlueColor,
            ),
            child: Icon(
              Icons.add,
              color: Colors.white,
              size: Dimensions.fontSize(context, 2.5),
            ),
          ),
        ),
      )
    ]);
  }
}
