import 'dart:io';

import 'package:flutter/material.dart';

class FileImageBorder extends StatelessWidget {
  final File file;
  final Color borderColor;
  final double borderWith;
  final BorderRadiusGeometry borderRadius;
  final double? height;
  final double? width;

  FileImageBorder({
    required this.file,
    required this.borderColor,
    required this.borderRadius,
    required this.borderWith,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        image: DecorationImage(image: FileImage(file), fit: BoxFit.fill),
        border: Border.all(color: borderColor, width: borderWith),
        borderRadius: borderRadius,
      ),
    );
  }
}
