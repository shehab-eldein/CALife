import 'package:canadianslife/Controllers/UserController.dart';
import 'package:canadianslife/Helper/Constants.dart';
import 'package:canadianslife/Managers/ImagePickerManager.dart';
import 'package:canadianslife/Models/User.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Helper/responsive.dart';

class UserImage extends StatefulWidget {
  const UserImage({super.key});
  @override
  State<UserImage> createState() => _UserImageState();
}

class _UserImageState extends State<UserImage> {
  ImagePickerManager imagePickerManager = ImagePickerManager();
  void chooseImage() async {
    String? img = await imagePickerManager.pickOneImage();
    if (img != null) {
      editImage(img);
    }
  }

  editImage(img) async {
    User? userInfo = Provider.of<UserData>(context, listen: false).userInfo;
    await UserController().editUser(
      userInfo.id,
      userInfo.displayName,
      userInfo.fullName,
      userInfo.email,
      userInfo.password,
      userInfo.phone.toString(),
      userInfo.userType!,
      img,
    );
    setState(() {});
  }

  String img = '${Constant.baseURL}imgusers/${UserData().getId()}.jpg';
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(200),
        child: FadeInImage(
          height: Dimensions.widthPercentage(context, 30),
          width: Dimensions.widthPercentage(context, 30),
          image: NetworkImage(img),
          placeholder: const AssetImage('images/person.png'),
          imageErrorBuilder: (context, error, stackTrace) {
            return Image.asset('images/person.png',
                height: Dimensions.widthPercentage(context, 30),
                width: Dimensions.widthPercentage(context, 30),
                fit: BoxFit.fill);
          },
          fit: BoxFit.fill,
        ),
      ),
      // CircleAvatar(
      //   backgroundColor: Colors.grey,
      //   backgroundImage: NetworkImage(
      //     '${Constant.baseURL}imgusers/${11}.jpg',
      //   ),
      //   radius: Dimensions.radius(context, 5),
      // ),
      Positioned(
        right: 0,
        bottom: 0,
        child: InkWell(
          onTap: () {
            chooseImage();
          },
          child: Container(
            padding: const EdgeInsets.all(.5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(90.0),
              color: appDesign.colorAccent,
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
