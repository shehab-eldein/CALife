import 'package:flutter/material.dart';
import 'package:canadianslife/Helper/Constants.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomSearchBar extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final Function? onSearchPressed;
  const CustomSearchBar(
      {Key? key, required this.hintText, this.controller, this.onSearchPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();

    return SizedBox(
      height: 40,
      child: TextField(
        onSubmitted: (value) {
          onSearchPressed!();
        },
        textInputAction: TextInputAction.search,
        controller: controller ?? searchController,
        decoration: InputDecoration(
          filled: true,
          fillColor: appDesign.greyBackground,
          hintText: hintText,
          contentPadding: EdgeInsets.zero,
          prefixIcon: IconButton(
            icon: const Icon(Icons.search, color: appDesign.colorPrimaryDark),
            onPressed: () {
              onSearchPressed!();
              // Perform the search here
            },
          ),
          suffixIcon: const Icon(
            Icons.filter_list,
            color: appDesign.colorPrimaryDark,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7.0),
            borderSide:
                const BorderSide(width: 2, color: appDesign.colorPrimaryDark),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7.0),
            borderSide:
                const BorderSide(width: 1, color: appDesign.colorPrimaryDark),
          ),
        ),
      ),
    );
  }
}
