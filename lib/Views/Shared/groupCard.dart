import 'package:canadianslife/Controllers/GroupController.dart';
import 'package:canadianslife/Extinsions/extensions.dart';
import 'package:canadianslife/Models/Group.dart';
import 'package:canadianslife/Views/Shared/CustomTextButton.dart';
import 'package:canadianslife/Views/Shared/InteractiveIcon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:canadianslife/Helper/Constants.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class GroupCard extends StatefulWidget {
  final bool subscribeBtnIsHidden;
  final Group groupInfo;

  GroupCard(
      {Key? key, required this.subscribeBtnIsHidden, required this.groupInfo})
      : super(key: key);

  @override
  _GroupCardState createState() => _GroupCardState();
}

class _GroupCardState extends State<GroupCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Material(
        elevation: 2,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                child: AspectRatio(
                  aspectRatio: 20 / 10,
                  child: Image(
                    image: AssetImage("images/placeholder.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Center(
                child: Text(
                  widget.groupInfo.name,
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 14,
                    backgroundColor: Colors.grey,
                    child: widget.groupInfo.user!.userImage != null
                        ? Image.network(widget.groupInfo.user!.userImage!)
                        : Image.asset("images/person.png"),
                  ),
                  SizedBox(width: 5),
                  Text(
                    widget.groupInfo.user!.displayName,
                    style: TextStyle(
                      color: appDesign.colorAccent,
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              Divider(
                color: Colors.grey.shade300,
                thickness: 1, // Specify the thickness of the line
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Expanded(
                        child: InteractiveIcon(
                      icon: widget.groupInfo.visibility == 0
                          ? Icons.lock_open_rounded
                          : Icons.lock_rounded,
                      text: widget.groupInfo.visibility == 0
                          ? "مجموعة عامة"
                          : "مجموعة خاصة",
                    )),
                    Expanded(
                        child: InteractiveIcon(
                            icon: Icons.person,
                            text: "${widget.groupInfo.subscribersNo} عضواً")),
                    Expanded(
                        child: InteractiveIcon(
                            icon: Icons.share,
                            text: "${widget.groupInfo.topicsNo} منشور")),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Visibility(
                      visible: widget.subscribeBtnIsHidden,
                      child: Expanded(
                        child: CustomTextButton(
                          backgroundColor: appDesign.colorPrimaryDark,
                          text: "اشتراك",
                          onPressed: () {
                            GroupController().subscribeToGroup(
                                widget.groupInfo.id,
                                Provider.of<UserData>(context, listen: false)
                                    .userInfo
                                    .id);
                          },
                          icon: Icons.add_box_rounded,
                        ),
                      ),
                    ),
                    SizedBox(width: widget.subscribeBtnIsHidden ? 8 : 0),
                    Expanded(
                      child: CustomTextButton(
                        backgroundColor: Colors.white,
                        text: "زيارة المجموعة",
                        textColor: appDesign.colorPrimaryDark,
                        onPressed: () {},
                        icon: Icons.keyboard_double_arrow_left_sharp,
                        iconColor: appDesign.colorPrimaryDark,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
