import 'dart:io';

***REMOVED***
import 'package:gharelu/src/core/providers/firbease_provider.dart';

class StorageHelper ***REMOVED***
  const StorageHelper._();
  static Future<List<String>> uploadFiles(Ref reader, List<File> files,
      ***REMOVED***String? path***REMOVED***) async ***REMOVED***
    List<String> fileUrls = [];
    fileUrls = await Future.wait(
        files.map((doc) => uploadFile(reader, doc, path: path)));
    return fileUrls;
  ***REMOVED***

  static Future<String> uploadFile(Ref reader, File file,
      ***REMOVED***String? path***REMOVED***) async ***REMOVED***
    final storageReference = await reader.read(storageProvider)
        .ref(path)
        .child(
            '$path$***REMOVED***DateTime.now().millisecondsSinceEpoch***REMOVED***$***REMOVED***file.path.split('.')[1]***REMOVED***')
        .putFile(file);
    return await storageReference.ref.getDownloadURL();
  ***REMOVED***
***REMOVED***
