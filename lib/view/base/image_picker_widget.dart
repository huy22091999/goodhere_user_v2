import 'dart:typed_data';

import 'package:flutter/material.dart';

import 'custom_image.dart';
class ImagePickerWidget extends StatelessWidget {
  final Uint8List? rawFile;
  final String? image;
  final Function()? onTap;
  final bool isOval;

  ImagePickerWidget(
      { this.rawFile,
       this.image,
       required this.onTap,
      this.isOval = true});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Stack(children: [
      if (isOval)
        ClipOval(
            child: rawFile != null
                ? Image.memory(
                    rawFile!,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  )
                : CustomImage(
                    image: image, height: 100, width: 100, fit: BoxFit.cover)),
      if (!isOval)
        rawFile != null
            ? Image.memory(
                rawFile!,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              )
            : CustomImage(
                image: image, height: 100, width: 100, fit: BoxFit.cover),
      Positioned(
        bottom: 0,
        right: 0,
        top: 0,
        left: 0,
        child: InkWell(
          onTap: onTap!,
          child: isOval?Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3),
              shape: BoxShape.circle,
              border:
              Border.all(width: 1, color: Theme.of(context).primaryColor),
            ),
            child: Container(
              margin: EdgeInsets.all(25),
              decoration: BoxDecoration(
                border: Border.all(width: 2, color: Colors.white),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.camera_alt, color: Colors.white),
            ),
          ):Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3),
              shape: BoxShape.circle,
              border:
              Border.all(width: 1, color: Theme.of(context).primaryColor),
            ),
            child: Container(
              margin: EdgeInsets.all(25),
              decoration: BoxDecoration(
                border: Border.all(width: 2, color: Colors.white),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.camera_alt, color: Colors.white),
            ),
          ),
        ),
      ),
    ]));
  }
}