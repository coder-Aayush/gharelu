import 'package:gharelu/src/core/entity/help_and_support_entity.dart';
import 'package:url_launcher/url_launcher_string.dart';

Future<void> launchType(UtilityEnum type, String content) async {
  switch (type) {
    case UtilityEnum.EMAIL:
      await launchUrlString('mailto:$content');
      break;
    case UtilityEnum.MOBILE:
      await launchUrlString('tel:$content');
      break;
    case UtilityEnum.WEB:
      await launchUrlString(content);
      break;
  ***REMOVED***
***REMOVED***
