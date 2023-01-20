import 'package:flutter/material.dart';

class CardListTile extends StatelessWidget ***REMOVED***
  const CardListTile(***REMOVED***Key? key, required this.title, required this.onPressed***REMOVED***)
      : super(key: key);

  final String title;
  final VoidCallback onPressed;

***REMOVED***
  Widget build(BuildContext context) ***REMOVED***
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
