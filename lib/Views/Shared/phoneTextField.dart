import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:canadianslife/Helper/Constants.dart';

class PhoneTextField extends StatefulWidget {
  final String countryCode;
  final String labelText;
  final String? initialValue;
  final Function(String)? onChanged;
  final Function()? onEditingComplete;
  final TextEditingController? controller;

  PhoneTextField({
    Key? key,
    required this.labelText,
    this.initialValue,
    this.onChanged,
    this.onEditingComplete,
    this.controller,
    this.countryCode = '+1',
  }) : super(key: key);

  @override
  _PhoneTextFieldState createState() => _PhoneTextFieldState();
}

class _PhoneTextFieldState extends State<PhoneTextField> {


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            widget.labelText,
            style: TextStyle(
              fontSize: 17,
              color: appDesign.colorPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Container(
            height: 68,
            child: Directionality(
              
              textDirection: TextDirection.ltr,
              child: IntlPhoneField(
                invalidNumberMessage: "Invalid Phone number",
                pickerDialogStyle: PickerDialogStyle(
                    searchFieldCursorColor: appDesign.colorPrimary,
                    searchFieldInputDecoration: InputDecoration(
                  focusColor: appDesign.colorPrimary,
                  labelStyle: TextStyle(
                    fontSize: 17,
                    color: Colors.grey.shade400,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: appDesign.colorPrimary),
                  ),
                )),
                textAlign: TextAlign.end,
               dropdownIcon: Icon(Icons.arrow_drop_down_outlined,color: appDesign.colorPrimary,),
                textAlignVertical: TextAlignVertical.top,
                textInputAction: TextInputAction.done,
                cursorColor: appDesign.colorPrimary,
                cursorHeight: 17,
                decoration: InputDecoration(
                  focusColor: appDesign.colorPrimary,
                  labelStyle: TextStyle(
                    fontSize: 17,
                    color: Colors.grey.shade400,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: appDesign.colorPrimary),
                  ),
                ),
                controller: widget.controller,
                languageCode: UserData.language,
                initialCountryCode: 'CA' ,
                onChanged: (phone) {
                  widget.onChanged!(phone.completeNumber);
                },
                onCountryChanged: (country) {
                  print('Country changed to: ' + country.name);
                },
                onSaved: (phone) {
                  widget.onEditingComplete!();
                },

              ),
            ),
          ),

        ],
      ),
    );
  }
}
