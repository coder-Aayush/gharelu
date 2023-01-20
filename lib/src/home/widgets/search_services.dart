import 'package:algolia_helper_flutter/algolia_helper_flutter.dart';
import 'package:flutter/material.dart';

class CustomSearchServices extends SearchDelegate ***REMOVED***
  CustomSearchServices(this.searcher);

  final HitsSearcher searcher;

***REMOVED***
  List<Widget>? buildActions(BuildContext context) ***REMOVED***
    return [];
  ***REMOVED***

***REMOVED***
  Widget? buildLeading(BuildContext context) ***REMOVED***
    return const BackButton();
  ***REMOVED***

***REMOVED***
  Widget buildResults(BuildContext context) ***REMOVED***
    searcher.query(query);
    return StreamBuilder(
      stream: searcher.responses,
      builder: (context, AsyncSnapshot<SearchResponse> snapshot) ***REMOVED***
        final response = snapshot.data;
        final hits = response?.hits.toList() ?? [];
        return ListView.builder(
          itemCount: hits.length,
          itemBuilder: (context, index) ***REMOVED***
            final hit = hits[index];

            return ListTile(
              title: RichText(
                  text: TextSpan(
                style: Theme.of(context).textTheme.subtitle2,
                children: hit.getHighlightedString('title').toInlineSpans(),
              )),
            );
          ***REMOVED***,
        );
      ***REMOVED***,
    );
  ***REMOVED***

***REMOVED***
  Widget buildSuggestions(BuildContext context) ***REMOVED***
    return Container();
  ***REMOVED***
***REMOVED***
