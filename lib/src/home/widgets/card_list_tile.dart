import 'package:flutter/material.dart';

class CardListTile extends StatelessWidget {
  const CardListTile({Key? key, required this.title, required this.onPressed***REMOVED***)
      : super(key: key);

  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),
        onTap: onPressed,
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_ios),
      ),
    );
  ***REMOVED***
***REMOVED***
