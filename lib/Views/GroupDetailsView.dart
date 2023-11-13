import 'package:canadianslife/Controllers/UserController.dart';
import 'package:canadianslife/Extinsions/extensions.dart';
import 'package:canadianslife/Helper/Constants.dart';
import 'package:canadianslife/Views/Shared/SearchBar.dart';
import 'package:flutter/material.dart';

import '../Managers/LayoutManager.dart';
import '../Managers/NetworkManager.dart';
import '../Models/User.dart';
import 'Shared/addPostPopUp.dart';
import 'Shared/postCard.dart';




class GroupDetails extends StatefulWidget {
  const GroupDetails({Key? key}) : super(key: key);

  @override
  State<GroupDetails> createState() => _GroupDetailsState();




}




void showAddPostPopup(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AddPostPopup();
    },
  );
}

class _GroupDetailsState extends State<GroupDetails> {



  @override
  void initState() {
    super.initState();


  }



  @override
  Widget build(BuildContext context) {
    final  layoutManager = LayoutManager(context);










    return ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index){
          return index == 0 ? Column(children: [
            AspectRatio(aspectRatio: layoutManager.valuesHandler(20/7, 20/7, 40/7, 40/7),
            child: Image(
              image: AssetImage("images/placeholder.png"),
              fit: BoxFit.cover,

            ),

            ),
            SizedBox(height: 7,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: layoutManager.mainHorizontalPadding()),
              child: Column(
                children: [
                  Text(
                    "الحياة في تورنتو",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: appDesign.colorPrimaryDark
                    ),
                  ),
                  SizedBox(height: 7,),
                  CustomSearchBar(hintText: "البحث في المجموعة"),
           SizedBox(height: 7,),
           Container(

                   height: 50,
                   child: Row(
                     children: [
                       CircleAvatar(
                         backgroundImage: AssetImage("images/defultPerson.png"),
                       ),
                       SizedBox(width: 10,),
                       Expanded(
                         child: TextField(
                           readOnly: true,
                           decoration: InputDecoration(
                             hintText: 'ابدأ بالنشر الآن...',
                             border: InputBorder.none,
                           ),
                           onTap: () {

                             showAddPostPopup(context);
                             print("Tapped");

                           },
                         ),
                       ),
                     ],

                   ),
           ),
                 Divider(height: 1,thickness: 1,color: appDesign.colorPrimaryDark.withAlpha(65),)

                 , Post()
                ],
              ),
            )

          ],) :Padding(
            padding:  EdgeInsets.symmetric(horizontal: layoutManager.mainHorizontalPadding()),
            child: Post(),
          );
        }


    );
  }
}
