import 'package:canadianslife/Extinsions/extensions.dart';
import 'package:canadianslife/Helper/Constants.dart';
import 'package:canadianslife/Views/GroupsTabsView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NotFoundView extends StatefulWidget {
  const NotFoundView({super.key, this.isNoGroups, this.refresh});
  final bool? isNoGroups;
  final Function? refresh;
  @override
  State<NotFoundView> createState() => _NotFoundViewState();
}

class _NotFoundViewState extends State<NotFoundView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        widget.isNoGroups == false
            ? const SizedBox(height: 150)
            : const SizedBox(height: 0),
        const Image(
          image: AssetImage("images/none.png"),
        ),
        Text(
          widget.isNoGroups == false
              ? AppLocalizations.of(context)!.noPostsFound
              : AppLocalizations.of(context)!.noGroupsFound,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Color(0xBF030F2E),
            fontSize: 22,
            fontFamily: '.SF Arabic',
            fontWeight: FontWeight.w500,
            height: 0,
          ),
        ),
        Text(
          widget.isNoGroups == false
              ? AppLocalizations.of(context)!.subToSee
              : AppLocalizations.of(context)!.notSubed,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Color(0x7F030F2E),
            fontSize: 17,
            fontFamily: '.SF Arabic',
            fontWeight: FontWeight.w400,
            height: 0,
          ),
        ),
        Text(
          AppLocalizations.of(context)!.exploreGroups,
          textAlign: TextAlign.right,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontFamily: '.SF Arabic',
            fontWeight: FontWeight.w500,
            height: 0.08,
          ),
        ),
        const SizedBox(height: 20),
        MaterialButton(
          color: appDesign.colorPrimary,
          onPressed: () {
            Constant.controller.jumpToTab(1);
            if (widget.refresh != null) {
              widget.refresh!();
            }
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Wrap(
              spacing: 5,
              alignment: WrapAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    AppLocalizations.of(context)!.exploreGroups,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: '.SF Arabic',
                      fontWeight: FontWeight.w500,
                      height: 0.08,
                    ),
                  ),
                ),
                const Icon(
                  Icons.groups_2,
                  color: Colors.white,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
