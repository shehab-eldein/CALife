import 'package:flutter/material.dart';
import 'package:canadianslife/Helper/Constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PassTextField extends StatefulWidget {
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final String? labelText;
  final Function()? onEditeComplete;

  const PassTextField(
      {Key? key,
      this.onChanged,
      this.controller,
      this.labelText,
      this.onEditeComplete})
      : super(key: key);

  @override
  _PassTextFieldState createState() => _PassTextFieldState();
}

class _PassTextFieldState extends State<PassTextField> {
  bool _obscureText = true;

  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.password,
            style: const TextStyle(
                fontSize: 17,
                color: appDesign.colorPrimary,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 50,
            child: TextField(
              textAlignVertical: TextAlignVertical.top,
              cursorHeight: 17,
              textInputAction: TextInputAction.done,
              onEditingComplete: widget.onEditeComplete,
              cursorColor: appDesign
                  .colorPrimary, // Replace with your desired cursor color
              onChanged: widget.onChanged,
              obscureText: _obscureText,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                      color: Colors.grey), // Border color when not focused
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: appDesign.colorPrimary),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureText
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: appDesign
                        .colorPrimary, // Replace with your desired icon color
                  ),
                  onPressed: _toggleObscureText,
                ),
              ),
              controller: widget.controller,
            ),
          )
        ],
      ),
    );
  }
}
