import 'dart:io';

***REMOVED***
import 'package:gharelu/src/core/providers/firbease_provider.dart';

class StorageHelper ***REMOVED***
  const StorageHelper._();
  static Future<List<String>> uploadFiles(
      Reader reader, List<File> files) async ***REMOVED***
    List<String> fileUrls = [];

    files.forEach((_file) async ***REMOVED***
      final storageReference =
          await reader(storageProvider).ref().child('users/').putFile(_file);
      fileUrls.add(await (await storageReference.ref.getDownloadURL()));
  ***REMOVED***
    return fileUrls;
  ***REMOVED***
***REMOVED***
