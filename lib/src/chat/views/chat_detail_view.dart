import 'dart:io';

import 'package:chat_bubbles/bubbles/bubble_normal_image.dart';
import 'package:chat_bubbles/bubbles/bubble_special_two.dart';
import 'package:chat_bubbles/message_bars/message_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gharelu/src/auth/models/custom_user_model.dart';
import 'package:gharelu/src/chat/models/message_model.dart';
import 'package:gharelu/src/chat/providers/get_message_provider.dart';
import 'package:gharelu/src/chat/providers/send_message_provider.dart';
import 'package:gharelu/src/core/assets/assets.gen.dart';
import 'package:gharelu/src/core/constant/app_constant.dart';
import 'package:gharelu/src/core/extensions/context_extension.dart';
import 'package:gharelu/src/core/extensions/extensions.dart';
import 'package:gharelu/src/core/providers/firbease_provider.dart';
import 'package:gharelu/src/core/theme/app_colors.dart';
import 'package:gharelu/src/core/theme/app_styles.dart';
import 'package:gharelu/src/core/widgets/widgets.dart';
import 'package:gharelu/src/home/models/product_model.dart';
import 'package:gharelu/src/home/widgets/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class ChatDetailView extends StatefulHookConsumerWidget ***REMOVED***
  const ChatDetailView(***REMOVED***
    Key? key,
    required this.roomId,
    required this.isMerchant,
    this.product,
    this.merchant,
    this.user,
  ***REMOVED***) : super(key: key);
  final String roomId;
  final CustomUserModel? user;
  final CustomUserModel? merchant;
  final bool isMerchant;
  final ProductModel? product;

***REMOVED***
  _ChatDetailViewState createState() => _ChatDetailViewState();
***REMOVED***

class _ChatDetailViewState extends ConsumerState<ChatDetailView> ***REMOVED***
***REMOVED***
  void initState() ***REMOVED***
    message = TextEditingController();
    super.initState();
  ***REMOVED***

***REMOVED***
  void dispose() ***REMOVED***
    ref.invalidate(getMessagesNotifierProvider);
    message.dispose();
    super.dispose();
  ***REMOVED***

  late TextEditingController message;

  final ValueNotifier<File?> selectedImage = ValueNotifier<File?>(null);

  String get roomId => widget.roomId;

  bool get isMerchant => widget.isMerchant;

  String? get userId => ref.read(firebaseAuthProvider).currentUser?.uid;

***REMOVED***
  Widget build(BuildContext context) ***REMOVED***
    return ScaffoldWrapper(
      appBar: AppBar(
        title: Row(
          children: [
            GradientCircle(
                radius: 40.r,
                showGradient: true,
                child: CacheImageViewer(
                  error: (context, url, error) => Assets.images.userAvatar.image(fit: BoxFit.cover),
                )),
            10.horizontalSpace,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  (widget.product?.name ?? ''),
                  style: AppStyles.text18PxBold,
                ),
                Text('$***REMOVED***isMerchant ? (widget.user?.name ?? '') : (widget.merchant?.name ?? '')***REMOVED***', style: AppStyles.text12PxMedium.midGrey)
        ***REMOVED***
            ).expanded(),
    ***REMOVED***
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Consumer(
                builder: (context, ref, _) ***REMOVED***
                  return ref.watch(getMessagesNotifierProvider(roomId)).maybeWhen(
                        orElse: () => Container().expanded(),
                        loading: () => context.loader.expanded(),
                        success: (data) ***REMOVED***
                          if (data.isEmpty) ***REMOVED***
                            return SizedBox(
                              child: NoDataFound(
                                title: 'Start Conversation with $***REMOVED***isMerchant ? '$***REMOVED***widget.user?.name***REMOVED***' : '$***REMOVED***widget.merchant?.name***REMOVED***'***REMOVED***',
                                onRefresh: () ***REMOVED***
                                  ref.read(getMessagesNotifierProvider(roomId));
                                ***REMOVED***,
                              ),
                            ).expanded();
                          ***REMOVED***
                          return ListView.builder(
                            itemCount: data.length,
                            reverse: true,
                            itemBuilder: (context, index) ***REMOVED***
                              final message = data[index];
                              if (message.type == MessageType.image) ***REMOVED***
                                return BubbleNormalImage(
                                  isSender: userId == message.senderId ? true : false,
                                  id: message.id,
                                  image: CacheImageViewer(
                                    imageUrl: message.imageUrl,
                                  ),
                                );
                              ***REMOVED***
                              return BubbleSpecialTwo(
                                text: message.message ?? '',
                                isSender: userId == message.senderId ? true : false,
                                tail: true,
                                color: userId == message.senderId ? AppColors.primaryColor : const Color(0xFFE8E8EE),
                                delivered: false,
                                textStyle: userId == message.senderId ? AppStyles.text14PxRegular.white : const TextStyle(),
                              ).px(10).py(10);
                            ***REMOVED***,
                          ).expanded();
                        ***REMOVED***,
                      );
                ***REMOVED***,
              ),
              MessageBar(
                onSend: (message) ***REMOVED***
                  final now = DateTime.now().millisecondsSinceEpoch;
                  ref.read(sendMessageNotifierProvider.notifier).sendMessage(
                        message: MessageModel(
                          id: '',
                          userId: widget.user!.uid,
                          merchantId: widget.merchant!.uid,
                          type: selectedImage.value != null ? MessageType.image : MessageType.text,
                          roomId: roomId,
                          message: message,
                          senderId: userId!,
                          updatedAt: now,
                        ),
                      );
                ***REMOVED***,
                sendButtonColor: AppColors.primaryColor,
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    child: InkWell(
                      child: const Icon(
                        Icons.camera_alt,
                        color: Colors.green,
                        size: 24,
                      ),
                      onTap: () async ***REMOVED***
                        final picker = await ImagePicker().pickImage(source: ImageSource.gallery);
                        if (picker?.path != null) ***REMOVED***
                          final now = DateTime.now().millisecondsSinceEpoch;
                          ref.read(sendMessageNotifierProvider.notifier).sendMessage(
                                message: MessageModel(
                                  id: '',
                                  updatedAt: now,
                                  userId: widget.user!.uid,
                                  merchantId: widget.merchant!.uid,
                                  type: MessageType.image,
                                  roomId: roomId,
                                  imageUrl: picker!.path,
                                  senderId: userId!,
                                ),
                              );
                        ***REMOVED***
                      ***REMOVED***,
                    ),
                  ),
          ***REMOVED***
              ),
      ***REMOVED***
          ),
          Consumer(builder: (context, ref, _) ***REMOVED***
            return ref.watch(sendMessageNotifierProvider).maybeWhen(
                  orElse: Container.new,
                  loading: () => Positioned(
                      child: Container(
                    height: context.height,
                    width: context.width,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor.withOpacity(.5),
                    ),
                    child: context.loader,
                  )),
                );
          ***REMOVED***)
  ***REMOVED***
      ),
    );
  ***REMOVED***
***REMOVED***
// 