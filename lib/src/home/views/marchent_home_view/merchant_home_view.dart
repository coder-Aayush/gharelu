import 'package:algolia_helper_flutter/algolia_helper_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gharelu/src/core/extensions/extensions.dart';
import 'package:gharelu/src/core/theme/app_colors.dart';
import 'package:gharelu/src/core/widgets/widgets.dart';
import 'package:gharelu/src/home/widgets/search_services.dart';
import 'package:gharelu/src/home/widgets/widgets.dart';

class MerchantHomeView extends StatelessWidget ***REMOVED***
  const MerchantHomeView(***REMOVED***Key? key***REMOVED***) : super(key: key);

***REMOVED***
  Widget build(BuildContext context) ***REMOVED***
    return ScaffoldWrapper(
      // body: SingleChildScrollView(
      //   child: Column(
      //     children: List.generate(
      //       100,
      //       (index) => ListTile(
      //         title: Text(index.toString()),
      //       ),
      //     ),
      //   ),
      // ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: AppColors.primaryColor,
            title: const Text(
              'Gharelu App',
              style: TextStyle(color: AppColors.whiteColor),
            ),
            expandedHeight: 150.h,
            snap: true,
            floating: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: SearchBar(
                onPressed: () ***REMOVED***
                  final searcher = HitsSearcher(
                    applicationID: 'IYS3NBQCDI',
                    apiKey: '3ab9dbad16ea56cdccf487e845d139a6',
                    indexName: 'services',
                  );
                  showSearch(
                    context: context,
                    delegate: CustomSearchServices(searcher),
                  );
                ***REMOVED***,
              ),
            ),
          ),
          20.verticalSpace.toSliverBox,
  ***REMOVED***
      ),
    );
  ***REMOVED***
***REMOVED***
