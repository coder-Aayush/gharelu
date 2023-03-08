import 'package:intl/intl.dart';

extension DateTimeX on DateTime {
  String formattedDate() {
    return DateFormat('MMM dd yyyy').format(this);
  ***REMOVED***

  String serverFormattedDate() {
    return DateFormat('yyyy-MM-dd').format(this);
  ***REMOVED***

  String formattedTime() {
    return DateFormat.jm().format(this);
  ***REMOVED***
***REMOVED***
