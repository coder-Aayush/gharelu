import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gharelu/firebase_options.dart';
import 'package:gharelu/src/app/views/views.dart';

void main() async ***REMOVED***
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(AppView.new());
***REMOVED***
