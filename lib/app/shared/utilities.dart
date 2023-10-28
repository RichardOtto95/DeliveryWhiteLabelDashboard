import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

/// Responsible functions

double wv(double size, context) =>
    MediaQuery.of(context).size.width / 375 * size;

double hv(double size, context) =>
    MediaQuery.of(context).size.height / 667 * size;

double pw(double size, context) =>
    MediaQuery.of(context).size.width / 100 * size;

double ph(double size, context) =>
    MediaQuery.of(context).size.height / 100 * size;

double maxWidth(context) => MediaQuery.of(context).size.width;

double maxHeight(context) => MediaQuery.of(context).size.height;

/// Theme Functions

ColorScheme getColor(context) => Theme.of(context).colorScheme;

TextTheme getStyle(context) => Theme.of(context).textTheme;

// Pick Functions

pickColorPopup(context, void Function(Color) onPickColor, Color color) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text(
        "Escolha sua cor",
      ),
      content: Column(
        children: [
          ColorPicker(
            pickerColor: color,
            onColorChanged: (clr) => onPickColor(clr),
          ),
          TextButton(
            child: const Text(
              "Escolher",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            onPressed: () => Modular.to.pop(),
          ),
        ],
      ),
    ),
  );
}

Future<File?> pickImage() async {
  if (await Permission.storage.request().isGranted) {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile == null) {
      return null;
    } else {
      File _file = File(pickedFile.path);
      return _file;
    }
  } else {
    return null;
  }
}
