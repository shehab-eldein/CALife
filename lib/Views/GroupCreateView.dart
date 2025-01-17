import 'dart:convert';

import 'package:canadianslife/Controllers/GroupController.dart';
import 'package:canadianslife/Extinsions/extensions.dart';
import 'package:canadianslife/Helper/Constants.dart';
import 'package:canadianslife/Helper/responsive.dart';
import 'package:canadianslife/Managers/ImagePickerManager.dart';
import 'package:canadianslife/Managers/LayoutManager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class GroupCreateView extends StatefulWidget {
  const GroupCreateView({super.key, required this.refresh});
  final Function refresh;

  @override
  State<GroupCreateView> createState() => _GroupCreateViewState();
}

class _GroupCreateViewState extends State<GroupCreateView> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController guideController = TextEditingController();
  bool isPublic = true;
  String? image;
  bool isPressed = false;

  createGroup() async {
    if (image != null && image != "") {
      if (nameController.text.isNotEmpty &&
          descriptionController.text.isNotEmpty &&
          guideController.text.isNotEmpty) {
        setState(() {
          isPressed = true;
        });
        await GroupController().createGroup(
          nameController.text,
          0,
          isPublic ? 0 : 1,
          descriptionController.text,
          guideController.text,
          Provider.of<UserData>(context, listen: false).userInfo.id,
          image ?? "image",
        );
        widget.refresh();
        if (context.mounted) {
          Navigator.pop(context);
        }
      } else {
        context.okAlert(
          title: AppLocalizations.of(context)!.required,
          message: AppLocalizations.of(context)!.emptyMessage,
        );
      }
    } else {
      context.okAlert(
        title: AppLocalizations.of(context)!.required,
        message: AppLocalizations.of(context)!.emptyImage,
      );
    }
  }

  ImagePickerManager imagePickerManager = ImagePickerManager();

  void pickImage() async {
    String? img = await imagePickerManager.pickOneImage();
    if (img != null) {
      setState(() {
        image = img;
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
                ? SizedBox(
                    height: layoutManager.valuesHandler(200, 200, 400, 400),
                    width: double.infinity,
                    child: const AspectRatio(
                      aspectRatio: 2 / 1,
                      child: Image(
                        image: AssetImage("images/placeholder.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  )
                : SizedBox(
                    height: layoutManager.valuesHandler(200, 200, 400, 400),
                    width: double.infinity,
                    child: AspectRatio(
                      aspectRatio: 2 / 1,
                      child: Image.memory(
                        base64Decode(image!),
                      ),
                    ),
                  ),
            Positioned(
                top: layoutManager.valuesHandler(70, 70, 170, 170),
                left: Dimensions.widthPercentage(context, 50) -
                    Dimensions.radius(context, 6.5),
                child: Column(
                  children: [
                    Container(
                      height: Dimensions.radius(context, 3),
                      width: Dimensions.radius(context, 3),
                      decoration: BoxDecoration(
                          color: const Color(0xFF04BFDB),
                          borderRadius: BorderRadius.circular(50)),
                      child: IconButton(
                        onPressed: () {
                          pickImage();
                        },
                        icon: Icon(
                          Icons.add,
                          size: Dimensions.fontSize(context, 1.6),
                        ),
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      AppLocalizations.of(context)!.addCoverImage,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Color(0xFF030F2E),
                        fontSize: Dimensions.fontSize(context, 1.7),
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
                AppLocalizations.of(context)!.groupName,
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
            AppLocalizations.of(context)!.privacy,
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
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: layoutManager.valuesHandler(0, 0, 45, 45)),
          child: ListTile(
            title: Row(
              children: [
                Text(
                  AppLocalizations.of(context)!.publicGroup,
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    color: Color(0xFF474B51),
                    fontSize: 20,
                    fontFamily: '.SF Arabic',
                    fontWeight: FontWeight.w600,
                    height: 0.08,
                  ),
                ),
                const SizedBox(width: 25),
                const Icon(Icons.lock_open_rounded)
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
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: layoutManager.valuesHandler(0, 0, 45, 45)),
          child: ListTile(
            title: Row(
              children: [
                Text(
                  AppLocalizations.of(context)!.privateGroup,
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    color: Color(0xFF474B51),
                    fontSize: 20,
                    fontFamily: '.SF Arabic',
                    fontWeight: FontWeight.w600,
                    height: 0.08,
                  ),
                ),
                const SizedBox(width: 15),
                const Icon(Icons.lock_rounded)
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
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: 10, horizontal: layoutManager.mainHorizontalPadding()),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.about,
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
                AppLocalizations.of(context)!.guide,
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
            height: 48,
            minWidth: double.infinity,
            color: const Color(0xFF04BFDB),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            onPressed: () async {
              createGroup();
            },
            child: isPressed
                ? const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  )
                : Text(
                    AppLocalizations.of(context)!.createGroup,
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
