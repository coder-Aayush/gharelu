import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:gharelu/src/core/extensions/extensions.dart';
import 'package:gharelu/src/core/theme/theme.dart';

class DottedImageViewer extends StatelessWidget {
  const DottedImageViewer({Key? key, required this.image, this.onDelete})
      : super(key: key);
  final String image;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        DottedBorder(
          // child: Assets.images.welcome.image(height: 120, fit: BoxFit.cover),
          child: Image.file(
            File(image),
            height: 120,
            fit: BoxFit.cover,
          ),
          strokeCap: StrokeCap.butt,
          dashPattern: [10, 12],
        ),
        Positioned(
          left: -10,
          top: -15,
          child: Material(
            borderRadius: BorderRadius.circular(60),
            child: InkWell(
              splashColor: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(60),
              onTap: onDelete,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.errorColor,
                  borderRadius: BorderRadius.circular(60),
                ),
                child: const Icon(
                  Icons.delete,
                  color: AppColors.whiteColor,
                ).pad(8),
              ),
            ),
          ),
        ),
      ],
    ).pOnly(left: 10);
  }
}
