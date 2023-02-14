import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:gharelu/firebase_options.dart';
import 'package:gharelu/src/app/views/views.dart';
import 'package:gharelu/src/core/routes/app_router.dart';

final getIt = GetIt.instance;

void main() async ***REMOVED***
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  getIt.registerLazySingleton(AppRouter.new);
  runApp(AppView.new());
***REMOVED***
