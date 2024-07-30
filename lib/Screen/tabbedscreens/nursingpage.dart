
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../component/component.dart';
import '../../controller/homecontroller.dart';
import '../../theme/colors.dart';

class Nursingpage extends StatelessWidget {
  const Nursingpage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: nursingPage(),
        ));
  }
}


Widget nursingPage() => GetBuilder<homecontroller>(
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
                        'خدمات التمريض',
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
        Gap(8),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 15,right: 15),
            child: Container(
              child: ListView.separated(
                separatorBuilder: (context, index) => Gap(0),
                itemBuilder: (context, i) {
                  controller.readdata();
                  bool? z = false;

                  if (controller.name!.isEmpty && controller.dropvalue=="اختر البلد") {
                    return  nursingContainer(
                        'مستر / ${controller.nursingdata![i]["name"]}',
                        controller.nursingdata![i]["phone"],
                        controller.nursingdata![i]["whatsapp"],
                        'العنوان / ${controller.nursingdata![i]["address"]}',
                        controller.nursingdata![i]["about"],
                        MediaQuery.of(context).size.width*.8
                    );
                  }
                  else if (controller.nursingdata![i]["name"].toString().contains(controller.name! ) && controller.nursingdata![i]["city"]==controller.dropvalue) {
                    return nursingContainer(
                        'مستر / ${controller.nursingdata![i]["name"]}',
                        controller.nursingdata![i]["phone"],
                        controller.nursingdata![i]["whatsapp"],
                        'العنوان / ${controller.nursingdata![i]["address"]}',
                        controller.nursingdata![i]["about"],
                        MediaQuery.of(context).size.width*.8
                    );
                  }
                  else if (controller.name!.isEmpty && controller.nursingdata![i]["city"]==controller.dropvalue) {
                    return nursingContainer(
                        '${controller.nursingdata![i]["name"]}',
                        controller.nursingdata![i]["phone"],
                        controller.nursingdata![i]["whatsapp"],
                        'العنوان / ${controller.nursingdata![i]["address"]}',
                        controller.nursingdata![i]["about"],
                        MediaQuery.of(context).size.width*.8
                    );
                  }
                  else if (controller.nursingdata![i]["name"].toString().contains(controller.name! ) && controller.dropvalue=="اختر البلد") {
                    return nursingContainer(
                        'مستر / ${controller.nursingdata![i]["name"]}',
                        controller.nursingdata![i]["phone"],
                        controller.nursingdata![i]["whatsapp"],
                        'العنوان / ${controller.nursingdata![i]["address"]}',
                        controller.nursingdata![i]["about"],
                        MediaQuery.of(context).size.width*.8
                    );
                  }
                  else {
                    return SizedBox(
                      height: 0,
                    );
                  }
                },
                itemCount: controller.nursingdata!.length,
              ),
            ),
          ),
        )
      ],
    );
  },
);
