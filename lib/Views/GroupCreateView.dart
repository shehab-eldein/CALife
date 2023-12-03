import 'dart:convert';

import 'package:canadianslife/Controllers/GroupController.dart';
import 'package:canadianslife/Helper/Constants.dart';
import 'package:canadianslife/Helper/responsive.dart';
import 'package:canadianslife/Managers/ImagePickerManager.dart';
import 'package:canadianslife/Managers/LayoutManager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GroupCreateView extends StatefulWidget {
  const GroupCreateView({super.key});

  @override
  State<GroupCreateView> createState() => _GroupCreateViewState();
}

class _GroupCreateViewState extends State<GroupCreateView> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController guideController = TextEditingController();
  bool isPublic = true;
  String? image;

  void createGroup() async {
    await GroupController().createGroup(
      nameController.text,
      0,
      isPublic ? 1 : 0,
      descriptionController.text,
      guideController.text,
      Provider.of<UserData>(context, listen: false).userInfo.id,
      image ?? "image",
    );
  }

  ImagePickerManager imagePickerManager = ImagePickerManager();
  // List<Asset>? _selectedImages = [];

  void pickImage() async {
    List<String>? images = await imagePickerManager.pickImages();
    if (images != null) {
      setState(() {
        image = images[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final layoutManager = LayoutManager(context);
    return Scaffold(
        body: ListView(
      children: [
        Stack(
          children: [
            image == null
                ? const AspectRatio(
                    aspectRatio: 2 / 1,
                    child: Image(
                      image: AssetImage("images/placeholder.png"),
                      fit: BoxFit.cover,
                    ),
                  )
                : AspectRatio(
                    aspectRatio: 2 / 1,
                    child: Image.memory(
                      base64Decode(image!),
                    ),
                  ),
            Positioned(
                top: Dimensions.heightPercentage(context, 13) - 40,
                left: Dimensions.widthPercentage(context, 50) - 60,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: const Color(0xFF04BFDB),
                          borderRadius: BorderRadius.circular(50)),
                      child: IconButton(
                        onPressed: () {
                          pickImage();
                        },
                        icon: const Icon(Icons.add),
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      'إضافة صورة غلاف',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Color(0xFF030F2E),
                        fontSize: 17,
                        fontFamily: '.SF Arabic',
                        fontWeight: FontWeight.w600,
                        height: 0.07,
                      ),
                    )
                  ],
                ))
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: 15, horizontal: layoutManager.mainHorizontalPadding()),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "اسم المجموعة",
                style: TextStyle(
                  fontFamily: '.SF Arabic',
                  color: const Color(0xFF030F2E),
                  fontSize: Dimensions.fontSize(context, 1.7),
                  fontWeight: FontWeight.w600,
                  height: 1,
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                keyboardType: TextInputType.text,
                controller: nameController,
                style: TextStyle(
                  fontFamily: '.SF Arabic',
                  fontSize: Dimensions.fontSize(context, 1.2),
                ),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 5),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: layoutManager.mainHorizontalPadding()),
          child: Text(
            "الخصوصية",
            style: TextStyle(
              fontFamily: '.SF Arabic',
              color: const Color(0xFF030F2E),
              fontSize: Dimensions.fontSize(context, 1.7),
              fontWeight: FontWeight.w600,
              height: 1,
            ),
          ),
        ),
        const SizedBox(height: 5),
        ListTile(
          title: const Row(
            children: [
              Text(
                'مجموعة عامة',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Color(0xFF474B51),
                  fontSize: 20,
                  fontFamily: '.SF Arabic',
                  fontWeight: FontWeight.w600,
                  height: 0.08,
                ),
              ),
              SizedBox(width: 25),
              Icon(Icons.lock_open_rounded)
            ],
          ),
          leading: Radio<bool>(
            activeColor: const Color(0xFF030F2E),
            value: true,
            groupValue: isPublic,
            onChanged: (value) {
              setState(() {
                isPublic = value!;
              });
            },
          ),
        ),
        ListTile(
          title: const Row(
            children: [
              Text(
                'مجموعة خاصة',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Color(0xFF474B51),
                  fontSize: 20,
                  fontFamily: '.SF Arabic',
                  fontWeight: FontWeight.w600,
                  height: 0.08,
                ),
              ),
              SizedBox(width: 15),
              Icon(Icons.lock_rounded)
            ],
          ),
          leading: Radio<bool>(
            activeColor: const Color(0xFF030F2E),
            value: false,
            groupValue: isPublic,
            onChanged: (value) {
              setState(() {
                isPublic = value!;
              });
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: 10, horizontal: layoutManager.mainHorizontalPadding()),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "عن المجموعة",
                style: TextStyle(
                  fontFamily: '.SF Arabic',
                  color: const Color(0xFF030F2E),
                  fontSize: Dimensions.fontSize(context, 1.7),
                  fontWeight: FontWeight.w600,
                  height: 1,
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                maxLines: 7,
                keyboardType: TextInputType.text,
                controller: descriptionController,
                style: TextStyle(
                  fontFamily: '.SF Arabic',
                  fontSize: Dimensions.fontSize(context, 1.2),
                ),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: 15, horizontal: layoutManager.mainHorizontalPadding()),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "الإرشادات",
                style: TextStyle(
                  fontFamily: '.SF Arabic',
                  color: const Color(0xFF030F2E),
                  fontSize: Dimensions.fontSize(context, 1.7),
                  fontWeight: FontWeight.w600,
                  height: 1,
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                maxLines: 7,
                keyboardType: TextInputType.text,
                controller: guideController,
                style: TextStyle(
                  fontFamily: '.SF Arabic',
                  fontSize: Dimensions.fontSize(context, 1.2),
                ),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: layoutManager.mainHorizontalPadding()),
          child: MaterialButton(
            minWidth: double.infinity,
            color: const Color(0xFF04BFDB),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            onPressed: () {
              createGroup();
            },
            child: Text(
              "إنشاء المجموعة",
              style: TextStyle(
                  fontFamily: '.SF Arabic',
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: Dimensions.fontSize(context, 1.4)),
            ),
          ),
        ),
        const SizedBox(height: 25),
      ],
    ));
  }
}
