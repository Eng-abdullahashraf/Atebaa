import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme/colors.dart';
import 'firstscreen.dart';

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
            builder: (context) => FirstScreen(),
          ));
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
                    /*Image(
                      height: 150,
                      image: AssetImage('images/atebaa.png'),
                      //color: Appcolor().firstcolor,
                    ),*/

                    Text('atebaa',style: TextStyle(fontSize: 75,color: Appcolor().firstcolor,fontFamily: 'ElMessiri-Bold'),),
                  ],
                ),
              ),
              /*child: Text(
                'atebaa',
                style: TextStyle(
                    fontSize: 60,
                    color: Appcolor().firstcolor,
                    fontFamily: "ElMessiri-Bold",
                    fontWeight: FontWeight.w800),
              ),*/
            )),
      ),
    );
  }
}
