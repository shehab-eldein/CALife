import 'package:canadianslife/Helper/Constants.dart';
import 'package:canadianslife/Managers/LayoutManager.dart';
import 'package:canadianslife/Models/Group.dart';
import 'package:canadianslife/Views/Shared/CustomTextButton.dart';
import 'package:canadianslife/Views/Shared/InteractiveIcon.dart';
import 'package:canadianslife/Views/Shared/appBar.dart';
import 'package:canadianslife/Views/Shared/groupCard.dart';
import 'package:flutter/material.dart';

class MyGroups extends StatefulWidget {
  const MyGroups({Key? key}) : super(key: key);

  @override
  State<MyGroups> createState() => _MyGroupsState();
}

class _MyGroupsState extends State<MyGroups> {
  @override
  Widget build(BuildContext context) {

     final layoutManager = LayoutManager(context);
    return Scaffold(

      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: layoutManager.mainHorizontalPadding()),
        itemCount: 5,
          itemBuilder: (BuildContext context, int index){
        return index == 0 ? Column(

          children: [
            InteractiveIcon(icon: Icons.group,iconSize: 25, text: "My Groups",fontSize: 20,color: appDesign.colorPrimary,),
           SizedBox(height: 8,),
            CustomTextButton(
              width: double.infinity,

                backgroundColor: appDesign.colorPrimaryLight,
                text: "create new group",
                onPressed: () {
              print("Navigate to create group");},
            icon: Icons.add_box_rounded,
            ),
            SizedBox(height: 8,),
            GroupCard(subscribeBtnIsHidden: false,
                groupInfo: Group(
                  id: 20,
                  name: 'test',
                  groupType: 0,
                  locationX: 20,
                  locationY: 20,
                  visibility: 0,
                  userId: 20,


                ))
          ],
        ) : GroupCard(subscribeBtnIsHidden: false,
            groupInfo: Group(
                id: 20,
              name: 'test',
              groupType: 0,
              locationX: 20,
              locationY: 20,
              visibility: 0,
              userId: 20,


            ));
      }

      ),
    );
  }
}
