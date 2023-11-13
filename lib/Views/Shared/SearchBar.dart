import 'package:flutter/material.dart';
import 'package:canadianslife/Helper/Constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomSearchBar extends StatelessWidget {
  final  String hintText;
  const CustomSearchBar({Key? key,required this.hintText}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final TextEditingController _searchController = TextEditingController();

    return Container(


      height: 40,


      child: TextField(

        controller: _searchController,
        decoration: InputDecoration(
          filled: true,
          fillColor: appDesign.greyBackground,

          hintText: hintText,
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
    );
  }
}
