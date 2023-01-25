import 'package:flutter/material.dart';
import 'package:gharelu/src/core/routes/app_router.dart';
import 'package:gharelu/src/core/widgets/widgets.dart';
import 'package:gharelu/src/home/widgets/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ChatListView extends StatefulHookConsumerWidget ***REMOVED***
  const ChatListView(***REMOVED***Key? key, required this.isMerchant***REMOVED***) : super(key: key);
  final bool isMerchant;

***REMOVED***
  _ChatListViewState createState() => _ChatListViewState();
***REMOVED***

class _ChatListViewState extends ConsumerState<ChatListView> ***REMOVED***
***REMOVED***
  Widget build(BuildContext context) ***REMOVED***
    return ScaffoldWrapper(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text('Chats'),
            floating: true,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => ChatListTile(
                onPressed: () => context.router.push(const ChatDetailRoute()),
                imageUrl: 'https://placehold.jp/30/dd6699/ffffff/300x150.png?text=A',
                name: 'Aayush Bhattarai',
                subtitle: 'Hi, I just booked service.',
              ),
            ),
          )
  ***REMOVED***
      ),
    );
  ***REMOVED***
***REMOVED***
