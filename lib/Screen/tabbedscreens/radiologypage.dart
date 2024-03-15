
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../component/component.dart';
import '../../component/second component.dart';
import '../../controller/homecontroller.dart';
import '../../theme/colors.dart';
class RadiologyPage extends StatelessWidget {
   RadiologyPage({super.key});

  TextEditingController Radiologycontrollor=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: radiology(Radiologycontrollor)));
  }
}

Widget radiology(x) => GetBuilder<homecontroller>(
  init: homecontroller(),
  builder: (controller) {

    return Column(
      children: [
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
              Expanded(
                  child: Center(
                      child: Text(
                        'مراكز',
                        style: TextStyle(
                            fontSize: 24,
                            color: Appcolor().thirdcolor,
                            fontFamily: 'ElMessiri-Bold'),
                      ))),
              IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    Icons.arrow_forward_rounded,
                    color: Colors.white,
                  )),
            ],
          ),
        ),
        Gap(8),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Container(
              height: 60,
              child: textInputform(
                  IconColor: Appcolor().firstcolor,
                  FillColor: Appcolor().thirdcolor,
                  PrefIcon: Icon(Icons.search),
                  LableText: 'ابحث عن مركز',
                  HintText: 'ابحث عن مركز',
                  Scure: false,
                  radius: 10,
                  controller: x)),
        ),
        Gap(8),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Container(
              width: double.infinity,
              height: 60,

              child:DropdownButtonFormField(
                decoration: InputDecoration(enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Appcolor().firstcolor,),borderRadius: BorderRadius.circular(10))),
                value:controller.dropvalue,items: controller.dropItems.map((e) => DropdownMenuItem(value:e,child: Text(e))).toList(), onChanged: (value) {
                controller.changedrop(value);
              },) ),
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
  },
);