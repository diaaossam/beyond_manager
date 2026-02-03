// 🎯 Dart imports:
import 'dart:io';

// 🌎 Project imports:
// 🐦 Flutter imports:
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

class SecureFilePicker {
  static const filenameLengthLimit = 20;
  static const imageFileSizeLimit = 4000000; // 4MB
  static const videoFileSizeLimit = 25000000; // 25MB

  static Future<File?> pickImage(
    ImageSource source, {
    required BuildContext context,
  }) async {
    final ImagePicker picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);
    if (pickedFile == null) return null;
    final file = File(pickedFile.path);
    final File compressedFile = await _compressImage(file);
    return compressedFile;
  }

  static Future<File> _compressImage(File sourceFile, {int? targetSize}) async {
    final dir = await getTemporaryDirectory();
    final targetPath = '${dir.absolute.path}/${const Uuid().v4()}.jpg';

    for (int quality = 80; quality >= 40; quality -= 5) {
      final data = await FlutterImageCompress.compressAndGetFile(
        sourceFile.absolute.path,
        targetPath,
        quality: quality,
      );

      final file = File(data?.path ?? '');

      if (targetSize == null) return file;

      if (file.lengthSync() < targetSize) return file;
    }
    throw Exception("Image is too large, cannot compress below target size");
  }

  static Future<File> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      File file = File(result.files.single.path!);
      return file;
    } else {
      throw Exception("No file selected");
    }
  }
}
