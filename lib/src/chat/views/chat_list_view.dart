import 'package:flutter/material.dart';
import 'package:gharelu/src/chat/data_source/chat_data_source.dart';
import 'package:gharelu/src/chat/providers/chat_list_provider.dart';
import 'package:gharelu/src/core/extensions/context_extension.dart';
import 'package:gharelu/src/core/providers/firbease_provider.dart';
import 'package:gharelu/src/core/routes/app_router.dart';
import 'package:gharelu/src/core/widgets/widgets.dart';
import 'package:gharelu/src/home/widgets/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ChatListView extends StatefulHookConsumerWidget {
  const ChatListView({Key? key, required this.isMerchant***REMOVED***) : super(key: key);
  final bool isMerchant;

  @override
  _ChatListViewState createState() => _ChatListViewState();
***REMOVED***

class _ChatListViewState extends ConsumerState<ChatListView> {
  bool get isMerchant => widget.isMerchant;

  @override
  Widget build(BuildContext context) {
    return ScaffoldWrapper(
      appBar: AppBar(title: const Text('Chat')),
      // body: ref.watch(getChatProvider).maybeWhen(
      //       orElse: Container.new,
      //       loading: () => context.loader,
      //       data: (data) {
      //         return ListView.builder(
      //           itemCount: data.length,
      //           itemBuilder: (context, index) {
      //             final room = data[index];
      //             return ChatListTile(
      //               imageUrl: data[index].id,
      //               name: isMerchant ? (room.user?.name ?? '') : (room.merchant?.name ?? ''),
      //               subtitle: 's',
      //               onPressed: () {***REMOVED***,
      //             );
      //           ***REMOVED***,
      //         );
      //       ***REMOVED***,
      //     ),
      // body: Column(),
      body: ref.watch(chatListNotifierProvider(isMerchant)).maybeWhen(
            orElse: Container.new,
            loading: () => context.loader,
            success: (data) => ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final room = data[index];
                return ChatListTile(
                  imageUrl: '',
                  name: room.product?.name ?? '',
                  subtitle: isMerchant ? (room.user?.name ?? '') : (room.merchant?.name ?? ''),
                  onPressed: () => context.router.push(ChatDetailRoute(
                    product: room.product!,
                    roomId: room.id,
                    isMerchant: isMerchant,
                    merchant: room.merchant,
                    user: room.user,
                  )),
                );
              ***REMOVED***,
            ),
          ),
    );
  ***REMOVED***
***REMOVED***


 // ref.watch(getChatListProvider(widget.isMerchant)).maybeWhen(
          //       orElse: Container.new,
          //       data: (data) => SliverList(
          //         delegate: SliverChildBuilderDelegate(
          //           (context, index) => StreamBuilder(
          //               stream: ref.watch(getChatListProvider(true).stream),
          //               builder: (context, value) {
          //                 print(value);
          //                 return ChatListTile(
          //                   onPressed: () {
          //                     context.router.push(const ChatDetailRoute());
          //                   ***REMOVED***,
          //                   imageUrl: 'https://placehold.jp/30/dd6699/ffffff/300x150.png?text=A',
          //                   name: 'Aayush Bhattarai',
          //                   subtitle: 'Hi, I just booked service.',
          //                 );
          //               ***REMOVED***),
          //         ),
          //       ),
          //     ),