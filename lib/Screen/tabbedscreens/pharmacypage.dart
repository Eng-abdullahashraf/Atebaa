import 'package:atebaa/component/component.dart';
import 'package:atebaa/component/second%20component.dart';
import 'package:atebaa/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../controller/homecontroller.dart';

class PharmacyPage extends StatelessWidget {
   PharmacyPage({super.key});

  TextEditingController searchcontroller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: pharmacyPage(searchcontroller),
    ));
  }
}

//..................................

Widget pharmacyPage(x) => GetBuilder<homecontroller>(
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
                        'صيدليات',
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
                  LableText: 'ابحث عن صيدلية',
                  HintText: 'ابحث عن صيدلية',
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
