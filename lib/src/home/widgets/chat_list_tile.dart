import 'package:flutter/material.dart';
import 'package:gharelu/src/core/extensions/extensions.dart';
import 'package:gharelu/src/core/theme/app_styles.dart';
import 'package:gharelu/src/core/widgets/widgets.dart';

class ChatListTile extends StatelessWidget {
  const ChatListTile({
    Key? key,
    required this.imageUrl,
    required this.name,
    required this.subtitle,
    required this.onPressed,
  }) : super(key: key);
  final String imageUrl;
  final String name;
  final String subtitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPressed,
      leading: GradientCircle(
        child: CacheImageViewer(imageUrl: imageUrl),
        showGradient: true,
      ),
      title: Text(name, style: AppStyles.text16PxBold),
      subtitle: Text(subtitle, style: AppStyles.text12PxRegular.midGrey),
    );
  }
}
