import 'dart:convert';
import 'package:canadianslife/Controllers/TopicController.dart';
import 'package:canadianslife/Extinsions/extensions.dart';
import 'package:canadianslife/Helper/Constants.dart';
import 'package:canadianslife/Managers/ImagePickerManager.dart';
import 'package:canadianslife/Models/Topic.dart';
import 'package:canadianslife/Views/Shared/CustomLoadingButton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddPostPopup extends StatefulWidget {
  const AddPostPopup({super.key, required this.groupId, required this.refresh});
  final int groupId;
  final Function refresh;

  @override
  _AddPostPopupState createState() => _AddPostPopupState();
}

class _AddPostPopupState extends State<AddPostPopup> {
  final TextEditingController _textController = TextEditingController();
  RoundedLoadingButtonController controller = RoundedLoadingButtonController();
  ImagePickerManager imagePickerManager = ImagePickerManager();

  List<String> imageFiles = [];

  void chooseMuliImages() async {
    List<String>? images = await imagePickerManager.pickImages();
    if (images != null && images.isNotEmpty) {
      setState(() {
        imageFiles += images;
      });
    }
  }

  submitPost() async {
    Topic? newTopic = await TopicController().topicAdd(
      widget.groupId,
      _textController.text,
      _textController.text,
      Provider.of<UserData>(context, listen: false).userInfo.id,
    );
    if (newTopic != null) {
      addTopicImgaes(newTopic.id);
    }
  }

  addTopicImgaes(topicId) async {
    if (imageFiles.isNotEmpty) {
      for (String image in imageFiles) {
        await TopicController().topicImageAdd(topicId, image);
      }
    }
    widget.refresh();
    Navigator.pop(context);
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
                  icon: const Icon(Icons.close),
                  color: appDesign.colorAccent,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              GestureDetector(
                child: const Icon(Icons.image),
                onTap: () {
                  // _openGallery();
                  //_pickImages();
                  chooseMuliImages();
                },
              ),
              Expanded(
                child: TextField(
                  controller: _textController,
                  keyboardType: TextInputType.multiline,
                  minLines: 5,
                  maxLines: null,
                  decoration: InputDecoration(
                    hintText: AppLocalizations.of(context)!.startPosting,
                    border: InputBorder.none,
                  ),
                ),
              ),
              imageFiles.isNotEmpty
                  ? Container(
                      decoration: BoxDecoration(border: Border.all(width: 0.5)),
                      height: 200,
                      width: context.screenWidth,
                      child: Center(
                        child: ListView(
                          // scrollDirection: Axis.horizontal,
                          children: [
                            ...imageFiles.map(
                              (e) => Stack(
                                children: [
                                  Image.memory(
                                    base64Decode(e),
                                    height: 180,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                  Positioned(
                                      top: 20,
                                      left: 20,
                                      child: CircleAvatar(
                                        backgroundColor: Colors.red,
                                        child: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                imageFiles.remove(e);
                                              });
                                            },
                                            icon: const Icon(
                                              Icons.close,
                                              color: Colors.white,
                                            )),
                                      ))
                                ],
                              ),
                            )
                          ],
                        ),
                        // child: ListView.builder(
                        //   scrollDirection: Axis.horizontal,
                        //   itemCount: _selectedImages?.length ?? 0,
                        //   itemBuilder: (context, index) {
                        //     return Container(
                        //       padding: EdgeInsets.all(4.0),
                        //       child: AssetThumb(
                        //         asset: _selectedImages![index],
                        //         width: 50,
                        //         height: 50,
                        //       ),
                        //     );
                        //   },
                        // ),
                      ),
                    )
                  : const SizedBox(),
              const SizedBox(height: 7.0),
              Align(
                alignment: Alignment.bottomCenter,
                child: CustomLoadingButton(
                  controller: controller,
                  text: 'نشر',
                  onPressed: () {
                    submitPost();
                    // Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
