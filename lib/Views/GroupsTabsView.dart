import 'package:canadianslife/Constants.dart';
import 'package:canadianslife/Views/GroupsView.dart';
import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootstrap5/flutter_bootstrap5.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class GroupsTabsView extends StatefulWidget {
  const GroupsTabsView({super.key});



  @override
  State<GroupsTabsView> createState() => GroupsViewState();
}

class GroupsViewState extends State<GroupsTabsView> {
  int tabSelected = 1;
  final TextEditingController _searchController = TextEditingController();


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Card(
        elevation: 20,
        child: Container(
          decoration: BoxDecoration(
            color: appDesign.backGround,
          ),
          child:
          FB5Row(
            classNames: 'align-items-center justify-content-center',
            children: [
              FB5Col(classNames: 'col-12', height: 52,
              child:Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                child: Container(
                  height: 36,
                  child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: appDesign.greyBackground,

                        hintText: AppLocalizations.of(context)!.groupsSearch,
                          contentPadding: EdgeInsets.zero,
                        prefixIcon: IconButton(
                          icon: Icon(Icons.search, color: appDesign.colorPrimary),
                          onPressed: () {
                            // Perform the search here
                          },
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7.0),
                          borderSide: BorderSide(width: 1,color: appDesign.colorPrimary),
                      ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7.0),
                          borderSide: BorderSide(width: 1,color: appDesign.colorPrimary),
                        ),
                      ),
                  ),
                ),
              ),),
          FB5Col(classNames: 'col-12',child: FB5Row(
            classNames: 'align-items-center justify-content-center',
            children: [
              FB5Col(
                  height: MediaQuery.of(context).size.height,
                  classNames: 'col-12',
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: appDesign.backGround,
                    ),
                    child: FB5Row(
                        classNames: 'align-items-center justify-content-center',
                        children: [
                          FB5Col(
                            height: MediaQuery.of(context).size.height/8,
                            classNames: 'col-12',
                            child: Center(
                              child: CustomSlidingSegmentedControl<int>(
                                initialValue: tabSelected,
                                children: {
                                  1: Text(AppLocalizations.of(context)!.groupsMyGroups,style: TextStyle(color: tabSelected==1?appDesign.colorPrimaryDark:appDesign.backGround)),
                                  2: Text(AppLocalizations.of(context)!.groupsNewGroups,style: TextStyle(color:  tabSelected==2?appDesign.colorPrimaryDark:appDesign.backGround)),
                                },
                                decoration: BoxDecoration(
                                  color: appDesign.colorPrimaryDark,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                thumbDecoration: BoxDecoration(
                                  color: appDesign.backGround,
                                  borderRadius: BorderRadius.circular(6),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(.3),
                                      blurRadius: 4.0,
                                      spreadRadius: 1.0,
                                      offset: Offset(
                                        0.0,
                                        2.0,
                                      ),
                                    ),
                                  ],
                                ),
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeInToLinear,
                                onValueChanged: (v) {
                                 tabSelected=v;
                                 setState(() {

                                 });
                                },
                              ),
                            ),
                          ),
                          FB5Col(
                            classNames: 'col-12',

                            child: Center(
                              child: GroupsView(),
                            ),

                          )
                        ]),
                  ))
            ],
          ),)]),

        ),
      ),
    );
  }
}
