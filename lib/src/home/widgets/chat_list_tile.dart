import 'package:flutter/material.dart';
import 'package:gharelu/src/core/extensions/extensions.dart';
import 'package:gharelu/src/core/theme/app_styles.dart';
import 'package:gharelu/src/core/widgets/widgets.dart';

class ChatListTile extends StatelessWidget ***REMOVED***
  const ChatListTile(***REMOVED***
    Key? key,
    required this.imageUrl,
    required this.name,
    required this.subtitle,
    required this.onPressed,
  ***REMOVED***) : super(key: key);
  final String imageUrl;
  final String name;
  final String subtitle;
  final VoidCallback onPressed;

***REMOVED***
  Widget build(BuildContext context) ***REMOVED***
    return ListTile(
      onTap: onPressed,
      leading: GradientCircle(
        child: CacheImageViewer(imageUrl: imageUrl),
        showGradient: true,
      ),
      title: Text(name, style: AppStyles.text16PxBold),
      subtitle: Text(subtitle, style: AppStyles.text12PxRegular.midGrey),
    );
  ***REMOVED***
***REMOVED***
