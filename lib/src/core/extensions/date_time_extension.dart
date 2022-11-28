import 'package:intl/intl.dart';

extension DateTimeX on DateTime ***REMOVED***
  String formattedDate() ***REMOVED***
    return DateFormat('MMM dd yyyy').format(this);
  ***REMOVED***

  String serverFormattedDate() ***REMOVED***
    return DateFormat('yyyy-MM-dd').format(this);
  ***REMOVED***

  String formattedTime() ***REMOVED***
    return DateFormat.jm().format(this);
  ***REMOVED***
***REMOVED***
