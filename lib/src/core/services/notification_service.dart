import 'dart:math';
import 'dart:ui';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

class NotificationService {
  factory NotificationService() {
    return instance;
  ***REMOVED***
  const NotificationService._();

  static NotificationService get instance => const NotificationService._();

  Future<void> initilize() async {
    AwesomeNotifications().initialize(
      null,
      [
        NotificationChannel(
          channelGroupKey: 'basic_channel_group',
          channelKey: 'basic_channel',
          channelName: 'Basic notifications',
          channelDescription: 'Notification channel for basic tests',
          defaultColor: Color(0xFF9D50DD),
          ledColor: Colors.white,
        )
      ],
    );
  ***REMOVED***

  Future<void> show() async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: NotificationService().hashCode,
        channelKey: 'basic_channel',
        title: 'Test',
        actionType: ActionType.DisabledAction,
        locked: true,
        fullScreenIntent: true,
        category: NotificationCategory.Email,
        notificationLayout: NotificationLayout.Inbox,
      ),
    );
  ***REMOVED***
***REMOVED***
