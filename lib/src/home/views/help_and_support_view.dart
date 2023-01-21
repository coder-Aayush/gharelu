import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gharelu/src/core/constant/app_constant.dart';
import 'package:gharelu/src/core/utility/contact_utility.dart';
import 'package:gharelu/src/core/widgets/widgets.dart';
import 'package:gharelu/src/home/widgets/widgets.dart';

class HelpAndSupportView extends StatelessWidget ***REMOVED***
  const HelpAndSupportView(***REMOVED***Key? key***REMOVED***) : super(key: key);

***REMOVED***
  Widget build(BuildContext context) ***REMOVED***
    return ScaffoldWrapper(
      appBar: AppBar(
        title: const Text('Help and Support'),
      ),
      body: Column(
        children: List.generate(AppConstant.helpAndSupport.length, (index) ***REMOVED***
          final helpAndSupport = AppConstant.helpAndSupport[index];
          return CardListTile(
            title: helpAndSupport.name,
            onPressed: () async ***REMOVED***
              await launchType(helpAndSupport.type, helpAndSupport.content);
            ***REMOVED***,
          );
        ***REMOVED***),
      ),
    );
  ***REMOVED***
***REMOVED***