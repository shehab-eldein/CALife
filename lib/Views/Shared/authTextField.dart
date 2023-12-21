import 'package:flutter/material.dart';
import 'package:canadianslife/Helper/Constants.dart';

class AuthTextField extends StatelessWidget {
  final String labelText;
  final String? hintText;
  final String? initialValue;
  final Function(String)? onChanged;
  final Function()? onEditeComplete;
  final bool obscureText;
  final TextEditingController? controller;

  const AuthTextField({
    Key? key,
     this.hintText,
    required this.labelText,
    this.initialValue,
    this.onChanged,
    required this.obscureText,
    this.controller,
    this.onEditeComplete
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
        labelText,

        style: TextStyle(
          fontSize: 17,
          color: appDesign.colorPrimary,
          fontWeight: FontWeight.bold
        ),
      ),
        SizedBox(height: 8),
        Container(
          height: 50,
          child: TextField(
              textAlignVertical: hintText!= null ?  TextAlignVertical.bottom : TextAlignVertical.top,
              textInputAction: TextInputAction.done,
              onEditingComplete: onEditeComplete ?? () {

                FocusScope.of(context).unfocus();
              },
              cursorColor: appDesign.colorPrimary,
              cursorHeight: 17,
              onChanged: onChanged,
              obscureText: obscureText,
              decoration: InputDecoration(
                hintText: hintText ,
                hintStyle: TextStyle(
                    color: Colors.grey.shade500,

                ),
                focusColor: appDesign.colorPrimary ,
                //labelText: labelText,
                labelStyle: TextStyle(
                  fontSize: 17,
                  color: Colors.grey.shade400,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Colors.grey), // Border color when not focused
                ),


                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: appDesign.colorPrimary), // Set the focused border color
                ),
              ),
              controller: controller ,
            ),
        )

        ],
      ),
    );
  }
}