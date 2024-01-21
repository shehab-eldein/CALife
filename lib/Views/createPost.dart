import 'package:canadianslife/Controllers/TopicController.dart';
import 'package:canadianslife/Extinsions/extensions.dart';
import 'package:canadianslife/Helper/Constants.dart';
import 'package:canadianslife/Helper/responsive.dart';
import 'package:canadianslife/Managers/ImagePickerManager.dart';
import 'package:canadianslife/Managers/LayoutManager.dart';
import 'package:canadianslife/Models/Topic.dart';
import 'package:canadianslife/Views/Shared/staggeredGridPostCreate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class CreatePostView extends StatefulWidget {
  const CreatePostView(
      {super.key,
      required this.groupId,
      required this.groupName,
      required this.refresh});
  final String groupName;
  final int groupId;
  final Function refresh;
  @override
  State<CreatePostView> createState() => _CreatePostViewState();
}

class _CreatePostViewState extends State<CreatePostView> {
  final TextEditingController _textController = TextEditingController();
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
    if (_textController.text != "" || imageFiles.isNotEmpty) {
      Topic? newTopic = await TopicController().topicAdd(
        widget.groupId,
        _textController.text,
        _textController.text,
        Provider.of<UserData>(context, listen: false).userInfo.id,
      );
      if (newTopic != null) {
        addTopicImgaes(newTopic.id);
      }
    } else {
      context.okAlert(
        title: AppLocalizations.of(context)!.required,
        message: AppLocalizations.of(context)!.emptyMessage,
      );
      setState(() {
        isPressed = false;
      });
    }
  }

  addTopicImgaes(topicId) async {
    if (imageFiles.isNotEmpty) {
      for (String image in imageFiles) {
        await TopicController().topicImageAdd(topicId, image);
      }
    }
    widget.refresh();
    if (context.mounted) {
      Navigator.pop(context);
    }
  }

  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    final layoutManager = LayoutManager(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: layoutManager.mainHorizontalPadding(), vertical: 20),
        child: ListView(
          children: [
            ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(200),
                child: FadeInImage(
                  height: 50,
                  width: 50,
                  image: NetworkImage(
                      '${Constant.baseURL}imgusers/${UserData().getId()}.jpg'),
                  placeholder: const AssetImage('images/person.png'),
                  imageErrorBuilder: (context, error, stackTrace) {
                    return Image.asset('images/person.png',
                        height: 50, width: 50, fit: BoxFit.fill);
                  },
                  fit: BoxFit.fill,
                ),
              ),
              title: Text(
                UserData().userInfo.displayName,
                style: const TextStyle(
                  color: appDesign.colorPrimaryDark,
                  fontSize: 18,
                  fontFamily: '.SF Arabic',
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: Text(
                widget.groupName,
                style: const TextStyle(
                  color: Color(0xFF088395),
                  fontSize: 15,
                  fontFamily: '.SF Arabic',
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: MaterialButton(
                onPressed: () {
                  if (!isPressed) {
                    setState(() {
                      isPressed = true;
                      submitPost();
                    });
                  }
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                color: appDesign.colorAccent,
                child: isPressed
                    ? const Padding(
                        padding: EdgeInsets.all(2.0),
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      )
                    : Wrap(
                        alignment: WrapAlignment.center,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.post,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontFamily: '.SF Arabic',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Icon(
                            Icons.share,
                            color: Colors.white,
                            size: 22,
                          ),
                        ],
                      ),
              ),
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
            imageFiles.isEmpty
                ? Column(
                    children: [
                      SizedBox(height: 200),
                      Center(
                        child: MaterialButton(
                          height: 48,
                          onPressed: () {
                            chooseMuliImages();
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          color: appDesign.colorPrimaryDark,
                          child: Wrap(
                            alignment: WrapAlignment.center,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Text(
                                AppLocalizations.of(context)!.addImages,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontFamily: '.SF Arabic',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Transform.rotate(
                                angle: 360 - 45,
                                child: const Icon(
                                  Icons.attachment,
                                  color: Colors.white,
                                  size: 22,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                : Column(
                    children: [
                      StaggeredGridTopicCreate(images: imageFiles),
                      // Image.memory(
                      //   base64Decode(imageFiles[0]),
                      //   height: 180,
                      //   width: double.infinity,
                      //   fit: BoxFit.cover,
                      // ),
                      Row(
                        children: [
                          MaterialButton(
                            minWidth: layoutManager.valuesHandler(
                                Dimensions.widthPercentage(context, 45),
                                Dimensions.widthPercentage(context, 45),
                                Dimensions.widthPercentage(context, 43),
                                Dimensions.widthPercentage(context, 43)),
                            onPressed: () {
                              chooseMuliImages();
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            color: appDesign.colorPrimaryDark,
                            child: Wrap(
                              alignment: WrapAlignment.center,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                Transform.rotate(
                                  angle: 360 - 45,
                                  child: const Icon(
                                    Icons.attachment,
                                    color: Colors.white,
                                    size: 22,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                const Text(
                                  "إضافة المزيد",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontFamily: '.SF Arabic',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          MaterialButton(
                            minWidth: layoutManager.valuesHandler(
                                Dimensions.widthPercentage(context, 45),
                                Dimensions.widthPercentage(context, 45),
                                Dimensions.widthPercentage(context, 43),
                                Dimensions.widthPercentage(context, 43)),
                            onPressed: () {
                              setState(() {
                                imageFiles = [];
                              });
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              side: const BorderSide(
                                width: 1.0,
                                color: appDesign.red,
                              ),
                            ),
                            child: const Wrap(
                              alignment: WrapAlignment.center,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                Icon(
                                  Icons.delete_outline,
                                  color: appDesign.red,
                                  size: 22,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "حذف الكل",
                                  style: TextStyle(
                                    color: appDesign.red,
                                    fontSize: 17,
                                    fontFamily: '.SF Arabic',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
