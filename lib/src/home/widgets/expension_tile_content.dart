import 'package:flutter/material.dart';

class ExpensionTileContent extends StatelessWidget {
  const ExpensionTileContent({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  final String title;

  final String description;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title),
        const Spacer(),
        Text(description),
      ],
    );
  }
}
