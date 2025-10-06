import 'dart:async';
import 'dart:ui';

import 'package:atebaa/controller/homecontroller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../theme/colors.dart';
import 'navscreens/firstscreen.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _Splash();
}

class _Splash extends State<Splash> {
  late homecontroller controller;

  @override
  void initState() {
    super.initState();

    controller = Get.put(homecontroller()); // تحط الكنترولر هنا عشان تضمن نسخة واحدة

    controller.getPharmacyData();
    controller.getLaboratoryData();
    controller.getNursingData();
    controller.getRadiologyData();
    controller.getAdvertisingData();
    controller.getdataapi();
    controller.loadUserFromStorage();
    
    Timer(Duration(seconds: 5), () {
      Get.off(() => FirstScreen());

      /*Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => FirstScreen()),
      );*/
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          color: Appcolor().thirdcolor,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Center(
                      child: Image(
                        image: AssetImage('images/ateba.png'),
                        width: 250,
                      ),
                    ),
                  ),
                  Text(
                    'Powered by TECS',
                    style: TextStyle(
                      fontSize: 15,
                      color: Appcolor().firstcolor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
