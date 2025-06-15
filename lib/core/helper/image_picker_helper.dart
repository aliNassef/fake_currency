import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

abstract class ImagePickerHelper {
  // static void openImagePicker({
  //   required ValueChanged<File> onGet,
  //   required BuildContext context,
  // }) {
  //   showDialog(
  //     context: context,
  //     builder: (_) {
  //       return CupertinoAlertDialog(
  //         title: Center(
  //           child: Text(
  //             'Select Image Source',
  //             style: AppStyles.roboto18Regular.copyWith(
  //               color: AppColors.darkBlueColor,
  //             ),
  //           ),
  //         ),
  //         actions: [
  //           CupertinoDialogAction(
  //               child: Text(
  //                 'Gallery',
  //               ),
  //               onPressed: () => openGallery(onGet: onGet)),
  //           CupertinoDialogAction(
  //               child: Text('Camera'),
  //               onPressed: () => openCamera(onGet: onGet)),
  //         ],
  //       );
  //     },
  //   );
  // }

  static Future<void> openGallery({required ValueChanged<XFile> onGet}) async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      onGet(image);
    }
  }

  static Future<void> openCamera({required ValueChanged<XFile> onGet}) async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image != null) {
      log(image.path);
      onGet(image);
    }
  }
}
