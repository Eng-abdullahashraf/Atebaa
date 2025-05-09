
import 'dart:io';

import 'package:atebaa/Screen/splash.dart';
import 'package:atebaa/constant/firebase_notification.dart';
import 'package:atebaa/controller/dependency.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:upgrader/upgrader.dart';

import 'controller/dio.dart';

void main() async{
  DependencyInjection.init();
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  Platform.isAndroid?
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyCnqV5r75SYUZnZ4-y8KKq0V9LErc7Wqr0",
      appId: "1:888295339059:android:e5491e1e2651439fc71f46",
      messagingSenderId: "888295339059",
      projectId: "atebaa-99f51",
    ),
  )
  :await Firebase.initializeApp();
  await FirebaseNotification().initNotification();
  runApp(const MyApp());
}

final GlobalKey<NavigatorState> navigatorkey=GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This wid get is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: navigatorkey,
      title: 'ATEBAA',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      locale: const Locale('ar'),
      home: UpgradeAlert(child: Splash(),)
      
    );
  }
}

