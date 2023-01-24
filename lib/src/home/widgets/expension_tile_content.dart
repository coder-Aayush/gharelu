import 'package:flutter/material.dart';

class ExpensionTileContent extends StatelessWidget ***REMOVED***
  const ExpensionTileContent(***REMOVED***
    Key? key,
    required this.title,
    required this.description,
  ***REMOVED***) : super(key: key);

  final String title;

  final String description;

***REMOVED***
  Widget build(BuildContext context) ***REMOVED***
    return Row(
      children: [
        Text(title),
        Spacer(),
        Text(description),
***REMOVED***
    );
  ***REMOVED***
***REMOVED***
