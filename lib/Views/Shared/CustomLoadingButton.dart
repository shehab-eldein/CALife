import 'package:canadianslife/Extinsions/extensions.dart';
import 'package:canadianslife/Helper/Constants.dart';
import 'package:canadianslife/Managers/LayoutManager.dart';
import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class CustomLoadingButton extends StatelessWidget {

  final RoundedLoadingButtonController controller;
  final Color? color;
  final String text;
  final VoidCallback onPressed;

  CustomLoadingButton({

    required this.controller,
     this.color,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 8,vertical: 25),
      child: RoundedLoadingButton(
        width: LayoutManager(context).valuesHandler(context.screenWidth, context.screenWidth, 430, 430) ,
        height: 48,
        controller: controller,
        color: color ?? appDesign.colorPrimary,
        successIcon: Icons.cloud,
        failedIcon: Icons.error,
        borderRadius: 10.0,
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: Colors.white
          ),

        ),
        onPressed: onPressed,
      ),
    );
  }
}
