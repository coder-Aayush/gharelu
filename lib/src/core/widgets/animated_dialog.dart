import 'package:flutter/material.dart';

class AnimatedDialog extends StatefulWidget {
  @override
  State<AnimatedDialog> createState() => _AnimatedDialogState();
***REMOVED***

class _AnimatedDialogState extends State<AnimatedDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    animation = Tween<double>(begin: 0, end: 1).animate(controller);
  ***REMOVED***

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) => Dialog(
          child: Container(
        width: animation.value * 300,
        height: animation.value * 300,
        color: Colors.white,
        child: Column(
          children: [
            Text('Dialog'),
          ],
        ),
      )),
    );
  ***REMOVED***
  // static Future<void> show(BuildContext context, )=> showDialog(context: context, builder: builder)
***REMOVED***
