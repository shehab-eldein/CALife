import 'dart:io';
import 'package:canadianslife/Extinsions/extensions.dart';
import 'package:canadianslife/Helper/Constants.dart';
import 'package:canadianslife/Managers/ImagePickerManager.dart';
import 'package:canadianslife/Views/Shared/CustomLoadingButton.dart';
import 'package:flutter/material.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:image_picker/image_picker.dart';

class AddPostPopup extends StatefulWidget {
  @override
  _AddPostPopupState createState() => _AddPostPopupState();
}

class _AddPostPopupState extends State<AddPostPopup> {
  TextEditingController _textController = TextEditingController();
  RoundedLoadingButtonController controller = RoundedLoadingButtonController();
  ImagePickerManager imagePickerManager = ImagePickerManager();
  List<Asset>? _selectedImages = [];

  void chooseMuliImages() async{
      imagePickerManager.selectMultiImage()
          .then((images) {
            if ( images != null) {
              setState(() {
                _selectedImages = images;
              });
            }else {
              _selectedImages = null;
            }
              }


      );
  }


  @override
  Widget build(BuildContext context) {
    return Material(

      color: Colors.white,


      borderRadius: BorderRadius.circular(25.0),
      child: Dialog(

        child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [


              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: Icon(Icons.close),
                  color: appDesign.colorAccent,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              GestureDetector(
                child: Icon(Icons.image),
                onTap: () {
                  print("add image start");
                 // _openGallery();
                  //_pickImages();
                  chooseMuliImages();
                },

              ),

              Expanded(
                child: TextField(
                  controller: _textController,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: InputDecoration(
                    hintText: 'ابدأ بالنشر الآن...',
                    border: InputBorder.none,
                  ),
                ),
              ),


              Container(
                height: 90,

                width: context.screenWidth,
                child: Center(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _selectedImages?.length ?? 0,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.all(4.0),
                        child: AssetThumb(
                          asset: _selectedImages![index],
                          width: 50,
                          height: 50,
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: 7.0),
              Align(
                alignment: Alignment.bottomCenter,
                child: CustomLoadingButton(

                  controller: controller,
                  text: 'نشر',
                  onPressed: () {
                    print("post");
                    Navigator.pop(context);
                  } ,

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}




