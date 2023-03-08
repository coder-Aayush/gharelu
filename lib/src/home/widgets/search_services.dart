import 'package:algolia_helper_flutter/algolia_helper_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gharelu/src/core/extensions/extensions.dart';
import 'package:gharelu/src/core/routes/app_router.dart';
import 'package:gharelu/src/core/widgets/widgets.dart';
import 'package:gharelu/src/home/models/category_model.dart';

class CustomSearchServices extends SearchDelegate {
  CustomSearchServices(this.searcher);

  final HitsSearcher searcher;

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return const BackButton();
  }

  @override
  Widget buildResults(BuildContext context) {
    searcher.query(query);
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    searcher..query(query);

    return StreamBuilder(
      stream: searcher.responses,
      builder: (context, AsyncSnapshot<SearchResponse> snapshot) {
        print(snapshot);
        final response = snapshot.data;
        final hits = response?.hits.toList() ?? [];
        return ListView.builder(
          itemCount: hits.length,
          itemBuilder: (context, index) {
            final hit = hits[index];

            return ListTile(
              leading: GradientCircle(
                radius: 40,
                child: CacheImageViewer(imageUrl: (hit['image'] as String?)),
              ),
              onTap: () => context.router.push(
                CategoryRoute(
                  category: CategoryModel(
                    id: hit['category_id'].toString(),
                    name: hit['name'].toString(),
                    image: hit['image'].toString(),
                    createdAt: hit['created_at'] as int,
                    updatedAt: hit['1672337769716'] as int,
                    enable: true,
                  ),
                ),
              ),
              title: RichText(
                  text: TextSpan(
                style: Theme.of(context).textTheme.titleSmall,
                children: hit.getHighlightedString('name').toInlineSpans(),
              )),
            ).py(12.h);
          },
        );
      },
    );
  }
}
