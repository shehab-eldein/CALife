import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
// import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerManager {
  Future<List<String>?> pickImages() async {
    List<String> imageFiles = [];
    final ImagePicker picker = ImagePicker();
    List<XFile> images = await picker.pickMultiImage();
    if (images.isNotEmpty) {
      for (var element in images) {
        var imagFile = File(element.path).readAsBytesSync();
        String base64Image = base64Encode(imagFile);
        imageFiles.add(base64Image);
      }
      return imageFiles;
    } else {
      return null;
    }
  }

  Future<String?> pickOneImage() async {
    final ImagePicker picker = ImagePicker();
    XFile? imageFile = await picker.pickImage(source: ImageSource.gallery);
    if (imageFile != null) {
      Uint8List img = File(imageFile.path).readAsBytesSync();
      String base64Image = base64Encode(img);
      return base64Image;
    } else {
      return null;
    }
  }

  Future<String?> takeImage() async {
    final ImagePicker picker = ImagePicker();
    XFile? imageFile = await picker.pickImage(source: ImageSource.camera);
    if (imageFile != null) {
      Uint8List img = File(imageFile.path).readAsBytesSync();
      String base64Image = base64Encode(img);
      return base64Image;
    } else {
      return null;
    }
  }

  // File? _selectedImage;
  // List<Asset> _selectedImages = [];

  // Future<File?> selectSingleImage() async {
  //   final picker = ImagePicker();
  //   final pickedFile = await picker.pickImage(source: ImageSource.gallery);

  //   if (pickedFile != null) {
  //     _selectedImage = File(pickedFile.path);

  //     print('Image path: ${pickedFile.path}');
  //     return _selectedImage;

  //     // Handle the picked image, you can display it or perform any other actions.
  //   } else {
  //     print('No image selected.');
  //     return null;
  //   }
  // }

  // Future<List<Asset>?> selectMultiImage() async {
  //   List<Asset> resultList = [];

  //   try {
  //     resultList = await MultiImagePicker.pickImages(
  //       maxImages: 5,
  //       enableCamera: true,
  //       selectedAssets: _selectedImages,
  //     );
  //   } on Exception catch (e) {
  //     print(e.toString());
  //     return null;
  //   }
  //   _selectedImages = resultList;
  //   return _selectedImages;
  // }

  // void _removeImage(int index) {
  //   _selectedImages.removeAt(index);
  // }
}
