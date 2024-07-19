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
              child: TextField(
                decoration: InputDecoration(
                  prefixIconColor: Appcolor().gray,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  hintText: "بحث",
                  prefixIcon: Icon(Icons.search),
                ),
                onChanged: (value) {
                  controller.search(value);
                },
              )
          ),
        ),
        Gap(8),
        Padding(
          padding:
          const EdgeInsets.only(left: 15, right: 15),
          child: Container(
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
              ),
              decoration: BoxDecoration(color: Appcolor().thirdcolor,
                  border: Border.all(color: Colors.black87),
                  borderRadius: BorderRadius.circular(10)),
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  focusedBorder: InputBorder.none,
                  border: InputBorder.none,
                ),
                value: controller.dropvalue,
                items: controller.dropItems
                    .map((e) =>
                    DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: (value) {
                  controller.changedrop(value);
                },
              )),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: ListView.separated(
                separatorBuilder: (context, index) => Gap(0),
                // itemBuilder: (context, i) => pharmContainer(MediaQuery.of(context).size.width*.8),
                itemBuilder: (context, i) {
                  controller.readdata();
                  bool? z = false;

                  if (controller.name!.isEmpty && controller.dropvalue=="اختر البلد") {
                    return  pharmContainer(
                        MediaQuery.of(context).size.width*.8,
                        'صيدلية / ${controller.pharmacydata![i]["name"]}',
                        controller.pharmacydata![i]
                        ["address"],
                        controller.pharmacydata![i]
                        ["delevery"],
                        controller.pharmacydata![i]
                        ["phone"],
                        controller.pharmacydata![i]
                        ["time"],
                        controller.pharmacydata![i]
                        ["whatsapp"],'images/pharmalogo.png');
                  }
                  else if (controller.pharmacydata![i]["name"].toString().contains(controller.name! ) && controller.pharmacydata![i]["city"]==controller.dropvalue) {
                    return pharmContainer(
                        MediaQuery.of(context).size.width*.8,
                        'صيدلية / ${controller.pharmacydata![i]["name"]}',
                        controller.pharmacydata![i]
                        ["address"],
                        controller.pharmacydata![i]
                        ["delevery"],
                        controller.pharmacydata![i]
                        ["phone"],
                        controller.pharmacydata![i]
                        ["time"],
                        controller.pharmacydata![i]
                        ["whatsapp"],'images/pharmalogo.png');
                  }
                  else if (controller.name!.isEmpty && controller.pharmacydata![i]["city"]==controller.dropvalue) {
                    return pharmContainer(
                        MediaQuery.of(context).size.width*.8,
                        'صيدلية / ${controller.pharmacydata![i]["name"]}',
                        controller.pharmacydata![i]
                        ["address"],
                        controller.pharmacydata![i]
                        ["delevery"],
                        controller.pharmacydata![i]
                        ["phone"],
                        controller.pharmacydata![i]
                        ["time"],
                        controller.pharmacydata![i]
                        ["whatsapp"],'images/pharmalogo.png');
                  }
                  else if (controller.pharmacydata![i]["name"].toString().contains(controller.name! ) && controller.dropvalue=="اختر البلد") {
                    return pharmContainer(
                        MediaQuery.of(context).size.width*.8,
                        'صيدلية / ${controller.pharmacydata![i]["name"]}',
                        controller.pharmacydata![i]
                        ["address"],
                        controller.pharmacydata![i]
                        ["delevery"],
                        controller.pharmacydata![i]
                        ["phone"],
                        controller.pharmacydata![i]
                        ["time"],
                        controller.pharmacydata![i]
                        ["whatsapp"],'images/pharmalogo.png');
                  }
                  else {
                    return SizedBox(
                      height: 0,
                    );
                  }
                },
                itemCount: controller.pharmacydata!.length,
              ),
            ),
          ),
        )
      ],
    );
  },
);
