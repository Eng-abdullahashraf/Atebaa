import 'dart:async';
import 'dart:ui';

import 'package:atebaa/controller/homecontroller.dart';
import 'package:atebaa/onboarding/onboarding%20page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import '../../theme/colors.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _Splash();
}

class _Splash extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => onboarding(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GetBuilder<homecontroller>(
            init: homecontroller(),
            builder: (controller) {
              controller.getPharmacyData();
              controller.getLaboratoryData();
              controller.getNursingData();
              controller.getRadiologyData();
              controller.getAdvertisingData();
              return Container(
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
                                child: Image(image: AssetImage('images/ateba.png'),width: 250,)
                              )),
                          Text(
                            'Powered by TECS ',
                            style: TextStyle(
                                fontSize: 15,
                                color: Appcolor().firstcolor,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ));

            },
        )
      ),
    );
  }
}
