import 'package:canadianslife/Extinsions/extensions.dart';
import 'package:canadianslife/Helper/Constants.dart';

import 'package:canadianslife/Views/Shared/groupCard.dart';
import 'package:canadianslife/Views/Shared/postCard.dart';
import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../Managers/LayoutManager.dart';

class GroupsTabsView extends StatefulWidget {
  const GroupsTabsView({super.key});



  @override
  State<GroupsTabsView> createState() => GroupsViewState();

}

class GroupsViewState extends State<GroupsTabsView>  with SingleTickerProviderStateMixin {
  int tabSelected = 1;
  final TextEditingController _searchController = TextEditingController();
  late TabController _tabController;
  bool hideSubscribeButton = false;


  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_onTabChanged);

  }
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  void _onTabChanged() {


    setState(() {
      if (_tabController.index == 0) {
        tabSelected=1;
        hideSubscribeButton = false;
      } else if (_tabController.index == 1) {
        tabSelected=2;
        hideSubscribeButton = true;


      }
    });
  }



  @override
  Widget build(BuildContext context) {
    final  layoutManager = LayoutManager(context);

    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),

      child: Container(

          color: Colors.grey.shade200,
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
            children: [

              SizedBox(height: 5,),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: layoutManager.mainHorizontalPadding(),
                  vertical: 5

                ),

                color: Colors.white,

                child: Column(
                  children: [
                    Container(


                      height: 40,


                      child: TextField(

                        controller: _searchController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: appDesign.greyBackground,

                          hintText: AppLocalizations.of(context)!.groupsSearch,
                          contentPadding: EdgeInsets.zero,
                          prefixIcon: IconButton(
                            icon: Icon(Icons.search, color: appDesign.colorPrimaryDark),
                            onPressed: () {
                              // Perform the search here
                            },
                          ),
                          suffixIcon:Icon(  Icons.filter_list ,color: appDesign.colorPrimaryDark,),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7.0),
                            borderSide: BorderSide(width: 2,color: appDesign.colorPrimaryDark),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7.0),
                            borderSide: BorderSide(width: 1,color: appDesign.colorPrimaryDark),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 5,),
                    TabBar(

                      controller: _tabController,
                      tabs: [
                        Tab(
                            child:Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                    AppLocalizations.of(context)!.groupsMyGroups,
                                    style: TextStyle(color: tabSelected==1?appDesign.colorPrimaryDark:Colors.grey,
                                        fontWeight: FontWeight.bold

                                    )),
                                SizedBox(width: 5,),
                                Icon(
                                  tabSelected == 1? CupertinoIcons.group_solid : CupertinoIcons.group,
                                  color:  tabSelected == 1? appDesign.colorPrimaryDark : Colors.grey,

                                )
                              ],
                            ) ),
                        Tab(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,

                              children: [
                                Text(
                                    AppLocalizations.of(context)!.groupsNewGroups,
                                    style: TextStyle(color:  tabSelected==2?appDesign.colorPrimaryDark:Colors.grey,
                                        fontWeight: FontWeight.bold

                                    )),
                                SizedBox(width: 5,),

                                Icon(
                                  tabSelected == 2? CupertinoIcons.group_solid : CupertinoIcons.group,
                                  color:  tabSelected == 2? appDesign.colorPrimaryDark : Colors.grey,

                                )
                              ],
                            ),
                        )
                      ],
                      indicatorColor: appDesign.colorPrimaryDark,
                      indicatorSize: TabBarIndicatorSize.label,


                    ),
                  ],
                ),
              ),


              Container(
                padding: EdgeInsets.symmetric(horizontal: layoutManager.mainHorizontalPadding(),vertical: 10),



                height: context.screenHeight *0.7,


                color: Colors.grey.shade200,
                child: ListView.builder(
                    itemCount: 4,
                    itemBuilder: (context, index){
                      return GroupCard(subscribeBtnIsHidden: hideSubscribeButton,);
                    }


                ),

              )
            ]),
      ),
    );
  }
}
