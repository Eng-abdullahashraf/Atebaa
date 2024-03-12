
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../component/component.dart';
import '../../component/second component.dart';
import '../../theme/colors.dart';
class RadiologyPage extends StatelessWidget {
   RadiologyPage({super.key});

  TextEditingController Radiologycontrollor=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: radiology(Radiologycontrollor)));
  }
}

Widget radiology(x) => Column(
  children: [
    //AppBar(backgroundColor: Appcolor().firstcolor,),
    Container(
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: Appcolor().firstcolor,
        border: Border.all(color: Appcolor().firstcolor, width: 1),
      ),
      height: 50,
      width: double.infinity,
      child: Row(
        children: [
          Expanded(child: Center(child: Text('مراكز',style: TextStyle(fontSize: 24,color: Appcolor().thirdcolor,fontFamily: 'ElMessiri-Bold'),))),
          IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.arrow_forward_rounded,color: Colors.white,)),
        ],
      ),
    ),
    Gap(8),
    Padding(
      padding: const EdgeInsets.only(left: 15,right: 15),
      child: Container(height: 40,child: textInputform(IconColor: Appcolor().firstcolor, FillColor: Appcolor().thirdcolor, PrefIcon: Icon(Icons.search), LableText: 'ابحث عن صيدليتك', HintText: 'ابحث عن صيدليتك', Scure: false, radius: 10, controller: x)),
    ),
    Gap(8),
    Padding(
      padding: const EdgeInsets.only(left: 15,right: 15),
      child: Container(height: 40,child: textInputform(IconColor: Appcolor().firstcolor, FillColor: Appcolor().thirdcolor, PrefIcon: Icon(Icons.search), LableText: 'ابحث عن صيدليتك', HintText: 'ابحث عن صيدليتك', Scure: false, radius: 10, controller: x)),
    ),
    Expanded(
      child: Container(
        child: ListView.builder(
          itemBuilder: (context, i) => pharmacyCard(),
          itemCount: 10,
        ),
      ),
    )
  ],
);