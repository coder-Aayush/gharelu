import 'package:auto_route/auto_route.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter/material.dart';
import 'package:gharelu/src/core/widgets/widgets.dart';

@RoutePage()
class ProfileInfoView extends StatelessWidget {
  const ProfileInfoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldWrapper(
      appBar: AppBar(
        title: const Text('My Account'),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
