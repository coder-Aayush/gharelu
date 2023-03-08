import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gharelu/src/core/providers/firbease_provider.dart';

class StorageHelper {
  const StorageHelper._();
  static Future<List<String>> uploadFiles(Ref reader, List<File> files,
      {String? path}) async {
    List<String> fileUrls = [];
    fileUrls = await Future.wait(
        files.map((doc) => uploadFile(reader, doc, path: path)));
    return fileUrls;
  }

  static Future<String> uploadFile(Ref reader, File file,
      {String? path}) async {
    final storageReference = await reader.read(storageProvider)
        .ref(path)
        .child(
            '$path${DateTime.now().millisecondsSinceEpoch}${file.path.split('.')[1]}')
        .putFile(file);
    return await storageReference.ref.getDownloadURL();
  }
}
