import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gharelu/src/core/assets/assets.gen.dart';
import 'package:gharelu/src/core/extensions/context_extension.dart';
import 'package:lottie/lottie.dart';

class ScaffoldWrapper extends StatelessWidget {
  const ScaffoldWrapper({
    Key? key,
    this.appBar,
    this.body,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.floatingActionButtonAnimator,
    this.persistentFooterButtons,
    this.drawer,
    this.onDrawerChanged,
    this.endDrawer,
    this.onEndDrawerChanged,
    this.bottomNavigationBar,
    this.bottomSheet,
    this.backgroundColor,
    this.resizeToAvoidBottomInset,
    this.primary = true,
    this.drawerDragStartBehavior = DragStartBehavior.start,
    this.extendBody = false,
    this.extendBodyBehindAppBar = false,
    this.drawerScrimColor,
    this.drawerEdgeDragWidth,
    this.drawerEnableOpenDragGesture = true,
    this.endDrawerEnableOpenDragGesture = true,
    this.restorationId,
    this.loading = false,
  ***REMOVED***) : super(key: key);

  final bool extendBody;

  final bool extendBodyBehindAppBar;

  final PreferredSizeWidget? appBar;

  final Widget? body;

  final Widget? floatingActionButton;

  final FloatingActionButtonLocation? floatingActionButtonLocation;

  final FloatingActionButtonAnimator? floatingActionButtonAnimator;

  final List<Widget>? persistentFooterButtons;

  final Widget? drawer;

  final DrawerCallback? onDrawerChanged;

  final Widget? endDrawer;

  final DrawerCallback? onEndDrawerChanged;

  final Color? drawerScrimColor;

  final Color? backgroundColor;

  final Widget? bottomNavigationBar;

  final Widget? bottomSheet;

  final bool? resizeToAvoidBottomInset;

  final bool primary;

  final DragStartBehavior drawerDragStartBehavior;

  final double? drawerEdgeDragWidth;

  final bool drawerEnableOpenDragGesture;

  final bool endDrawerEnableOpenDragGesture;

  final String? restorationId;

  final bool loading;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (FocusScope.of(context).hasFocus) {
          FocusScope.of(context).unfocus();
        ***REMOVED***
      ***REMOVED***,
      onVerticalDragStart: (details) {
        if (FocusScope.of(context).hasFocus) {
          FocusScope.of(context).unfocus();
        ***REMOVED***
      ***REMOVED***,
      child: Scaffold(
        key: key,
        appBar: appBar,
        body: loading ? context.loader : body,
        floatingActionButton: floatingActionButton,
        floatingActionButtonLocation: floatingActionButtonLocation,
        floatingActionButtonAnimator: floatingActionButtonAnimator,
        persistentFooterButtons: persistentFooterButtons,
        drawer: drawer,
        onDrawerChanged: onDrawerChanged,
        endDrawer: endDrawer,
        onEndDrawerChanged: onEndDrawerChanged,
        bottomNavigationBar: bottomNavigationBar,
        bottomSheet: bottomSheet,
        backgroundColor: backgroundColor,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        primary: primary,
        drawerDragStartBehavior: drawerDragStartBehavior,
        extendBody: extendBody,
        extendBodyBehindAppBar: extendBodyBehindAppBar,
        drawerScrimColor: drawerScrimColor,
        drawerEdgeDragWidth: drawerEdgeDragWidth,
        drawerEnableOpenDragGesture: drawerEnableOpenDragGesture,
        endDrawerEnableOpenDragGesture: endDrawerEnableOpenDragGesture,
        restorationId: restorationId,
      ),
    );
  ***REMOVED***
***REMOVED***
