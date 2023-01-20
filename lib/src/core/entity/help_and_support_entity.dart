import 'package:equatable/equatable.dart';

class HelpAndSupportEntity extends Equatable ***REMOVED***
  const HelpAndSupportEntity(***REMOVED***
    required this.name,
    required this.content,
    required this.type,
***REMOVED***
  final String name;
  final String content;
  final UtilityEnum type;
***REMOVED***
  List<Object?> get props => [name,content,type];
***REMOVED***

enum UtilityEnum ***REMOVED*** WEB, MOBILE, EMAIL ***REMOVED***
