import 'package:canadianslife/Controllers/GroupController.dart';
import 'package:canadianslife/Extinsions/extensions.dart';
import 'package:canadianslife/Models/Group.dart';
import 'package:canadianslife/Views/GroupAdminView.dart';
import 'package:canadianslife/Views/GroupDetailsView.dart';
import 'package:canadianslife/Views/Shared/CustomTextButton.dart';
import 'package:canadianslife/Views/Shared/InteractiveIcon.dart';
import 'package:flutter/material.dart';
import 'package:canadianslife/Helper/Constants.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class GroupCard extends StatefulWidget {
  final bool isNotSubed;
  final Group groupInfo;
  final bool? isAdmin;
  final Function? refresh;

  GroupCard(
      {Key? key,
      required this.isNotSubed,
      required this.groupInfo,
      this.isAdmin,
      this.refresh})
      : super(key: key);

  @override
  _GroupCardState createState() => _GroupCardState();
}

class _GroupCardState extends State<GroupCard> {
  bool isPressed = false;
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
                  child: FadeInImage.assetNetwork(
                    image:
                        '${Constant.baseURL}imggroups/${widget.groupInfo.id}.jpg',
                    placeholder: 'images/placeholder.png',
                    imageErrorBuilder: (context, error, stackTrace) {
                      return Image.asset('images/placeholder.png',
                          fit: BoxFit.cover);
                    },
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
              widget.isAdmin == null
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(200),
                          child: FadeInImage(
                            height: 30,
                            width: 30,
                            image: NetworkImage(
                                '${Constant.baseURL}imgusers/${widget.groupInfo.user!.id}.jpg'),
                            placeholder: const AssetImage(
                              'images/person.png',
                            ),
                            imageErrorBuilder: (context, error, stackTrace) {
                              return Image.asset(
                                'images/person.png',
                                fit: BoxFit.fill,
                                height: 30,
                                width: 30,
                              );
                            },
                            fit: BoxFit.fill,
                          ),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          widget.groupInfo.user?.displayName ?? "",
                          style: const TextStyle(
                            color: appDesign.colorAccentDarker,
                            fontWeight: FontWeight.normal,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    )
                  : const SizedBox(),
              Divider(
                color: Colors.grey.shade300,
                thickness: 1, // Specify the thickness of the line
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Expanded(
                        child: InteractiveIcon(
                      icon: widget.groupInfo.visibility == 0
                          ? Icons.lock_open_rounded
                          : Icons.lock_rounded,
                      text: widget.groupInfo.visibility == 0
                          ? AppLocalizations.of(context)!.publicGroup
                          : AppLocalizations.of(context)!.privateGroup,
                    )),
                    Expanded(
                        child: InteractiveIcon(
                            icon: Icons.person,
                            text:
                                "${widget.groupInfo.subscribersNo} ${AppLocalizations.of(context)!.member}")),
                    Expanded(
                        child: InteractiveIcon(
                            icon: Icons.share,
                            text:
                                "${widget.groupInfo.topicsNo} ${AppLocalizations.of(context)!.posts}")),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Visibility(
                      visible: widget.isNotSubed,
                      child: Expanded(
                        child: MaterialButton(
                          height: 45,
                          color: appDesign.colorPrimaryDark,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          onPressed: () async {
                            setState(() {
                              isPressed = true;
                            });
                            await GroupController().subscribeToGroup(
                                widget.groupInfo.id,
                                Provider.of<UserData>(context, listen: false)
                                    .userInfo
                                    .id);
                            if (widget.refresh != null) {
                              widget.refresh!();
                            }
                            setState(() {
                              isPressed = false;
                            });
                          },
                          child: isPressed
                              ? const Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                )
                              : Text(
                                  AppLocalizations.of(context)!.subscribe,
                                  style: const TextStyle(
                                    fontFamily: '.SF Arabic',
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                        ),
                        // child: CustomTextButton(
                        //   backgroundColor: appDesign.colorPrimaryDark,
                        //   text: AppLocalizations.of(context)!.subscribe,
                        //   onPressed: () {
                        //     GroupController().subscribeToGroup(
                        //         widget.groupInfo.id,
                        //         Provider.of<UserData>(context, listen: false)
                        //             .userInfo
                        //             .id);
                        //   },
                        //   icon: Icons.add_box_rounded,
                        // ),
                      ),
                    ),
                    SizedBox(width: widget.isNotSubed ? 8 : 0),
                    Visibility(
                      visible: widget.groupInfo.visibility == 0 ||
                              widget.isNotSubed == false
                          ? true
                          : widget.isAdmin != null
                              ? widget.isAdmin!
                                  ? true
                                  : false
                              : false,
                      child: Expanded(
                        child: CustomTextButton(
                          backgroundColor: Colors.white,
                          text: AppLocalizations.of(context)!.visitGroup,
                          textColor: appDesign.colorPrimaryDark,
                          onPressed: () {
                            widget.isAdmin != null && widget.isAdmin == true
                                ? context.navigateTo(
                                    GroupAdminView(
                                      groupInfo: widget.groupInfo,
                                    ),
                                  )
                                : context.navigateTo(
                                    GroupDetails(
                                      groupInfo: widget.groupInfo,
                                    ),
                                  );
                          },
                          icon: Icons.keyboard_double_arrow_left_sharp,
                          iconColor: appDesign.colorPrimaryDark,
                        ),
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
