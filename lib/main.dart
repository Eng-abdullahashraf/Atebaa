
import 'dart:io';

import 'package:atebaa/Screen/splash.dart';
import 'package:atebaa/controller/dependency.dart';
import 'package:atebaa/controller/homecontroller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';

void main() async{
  DependencyInjection.init();
  WidgetsFlutterBinding.ensureInitialized();

  Platform.isAndroid?
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyCnqV5r75SYUZnZ4-y8KKq0V9LErc7Wqr0",
      appId: "1:888295339059:android:4feb7aa3ae8ded69c71f46",
      messagingSenderId: "888295339059",
      projectId: "atebaa-99f51",
    ),
  )
  :await Firebase.initializeApp();
  //await Hive.initFlutter();
  //await Hive.openBox('favorite');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'ATEBAA',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      locale: const Locale('ar'),
      home: Splash(),
      
    );
  }
}

