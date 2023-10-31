import 'package:canadianslife/Extinsions/extensions.dart';
import 'package:canadianslife/Views/Shared/InteractiveIcon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:canadianslife/Helper/Constants.dart';


class Post extends StatefulWidget {


  Post({
    Key? key,

  }) : super(key: key);

  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  const EdgeInsets.symmetric(vertical: 5),
      child: Material(
        elevation: 2,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
                  color:  Colors.white,

          ),
          padding:const EdgeInsets.symmetric(horizontal: 10, vertical: 10) ,
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
               Align(
                alignment: Alignment.topLeft,
                child: Text(
                    "10 د",
          style:  TextStyle(
            color: Colors.grey,

            fontWeight: FontWeight.normal,

            fontSize: 13,
          )
                ),
              ),
               Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey,
                  ),
                  SizedBox(width: 16),
                  Text(
                      "اسم المستخدم",
                    style: TextStyle(
                      color: appDesign.colorAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),

                ],

              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Text(


                  "محتوي المنشور، محتوي المنشور، محتوي المنشور، محتوي المنشور، محتوي المنشور، محتوي المنشور،  ",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 4,

                ),
              ),
              //todo handel many image case
              Container(
                height: 200,
                width: double.infinity,

                child: Image(
                    image: AssetImage("images/placeholder.png")
                ),
              ),
              Padding(
                padding:const EdgeInsets.fromLTRB(0, 8, 0, 0) ,
                child: Row(
                  children: [
                    Icon(Icons.pin_drop,color: appDesign.colorAccent,),
                    SizedBox(width: 5),
                    Text(
                      "ألبرتا، كندا",
                      style: TextStyle(
                        color: appDesign.colorAccent,

                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                    ),

                  ],

                ),
              ),
              Divider(
                color: Colors.grey.shade300,
                thickness: 1, // Specify the thickness of the line
              ),


              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    Expanded(child: InteractiveIcon(icon: Icons.thumb_up_alt_outlined, text: "50")),
                    Expanded(child: InteractiveIcon(icon: Icons.message_outlined, text: "20")),
                    Expanded(child: InteractiveIcon(icon: Icons.bookmark_border_outlined, text: "")),


                  ],
                ),
              ),






            ],
          ),
        ),
      ),
    );
  }
}
