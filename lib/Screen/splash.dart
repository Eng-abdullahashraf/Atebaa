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

    Timer(
        Duration(seconds: 3),
            () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => FirstScreen(),));
            });
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width:double.infinity,
          color: Appcolor().firstcolor,
          child: Center(
            child: Text('Tabebak',style: TextStyle(fontSize:  45,color: Appcolor().thirdcolor),),
          )
        ),
      ),
    );
  }
}
