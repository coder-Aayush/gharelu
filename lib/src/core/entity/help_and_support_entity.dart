import 'package:equatable/equatable.dart';

class HelpAndSupportEntity extends Equatable {
  const HelpAndSupportEntity({
    required this.name,
    required this.content,
    required this.type,
  ***REMOVED***
  final String name;
  final String content;
  final UtilityEnum type;
  @override
  List<Object?> get props => [name,content,type];
***REMOVED***

enum UtilityEnum { WEB, MOBILE, EMAIL ***REMOVED***
