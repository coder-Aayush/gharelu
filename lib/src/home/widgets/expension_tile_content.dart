import 'package:flutter/material.dart';

class ExpensionTileContent extends StatelessWidget {
  const ExpensionTileContent({
    Key? key,
    required this.title,
    required this.description,
  ***REMOVED***) : super(key: key);

  final String title;

  final String description;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title),
        Spacer(),
        Text(description),
      ],
    );
  ***REMOVED***
***REMOVED***
