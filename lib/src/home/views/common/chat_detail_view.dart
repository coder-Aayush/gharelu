import 'package:chat_bubbles/bubbles/bubble_special_two.dart';
import 'package:chat_bubbles/message_bars/message_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gharelu/src/core/extensions/extensions.dart';
import 'package:gharelu/src/core/theme/app_styles.dart';
import 'package:gharelu/src/core/widgets/widgets.dart';

class ChatDetailView extends StatelessWidget ***REMOVED***
  const ChatDetailView(***REMOVED***Key? key***REMOVED***) : super(key: key);

***REMOVED***
  Widget build(BuildContext context) ***REMOVED***
    return ScaffoldWrapper(
      appBar: AppBar(
        title: Row(
          children: [
            GradientCircle(
              radius: 40.r,
              child: const CacheImageViewer(
                imageUrl:
                    'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1180&q=80',
              ),
            ),
            10.horizontalSpace,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Aayush',
                  style: AppStyles.text18PxBold,
                ),
                Text('Online', style: AppStyles.text12PxMedium.midGrey)
        ***REMOVED***
            ).expanded(),
    ***REMOVED***
        ),
      ),
      body: Column(
        children: [
          ListView.builder(
            itemBuilder: (context, index) => BubbleSpecialTwo(
              text: 'bubble special tow without tail',
              isSender: index % 2 == 0 ? true : false,
              tail: true,
              color: index % 2 == 0
                  ? const Color(0xFF1B97F3)
                  : const Color(0xFFE8E8EE),
              delivered: false,
              textStyle: index % 2 == 0
                  ? AppStyles.text14PxRegular.white
                  : const TextStyle(),
            ).px(10).py(10),
          ).expanded(),
          MessageBar(
            onSend: (_) => print(_),
            actions: [
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: InkWell(
                  child: const Icon(
                    Icons.camera_alt,
                    color: Colors.green,
                    size: 24,
                  ),
                  onTap: () ***REMOVED******REMOVED***,
                ),
              ),
      ***REMOVED***
          ),
  ***REMOVED***
      ),
    );
  ***REMOVED***
***REMOVED***
// 