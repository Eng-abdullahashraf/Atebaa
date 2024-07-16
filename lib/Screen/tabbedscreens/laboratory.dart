import 'package:atebaa/controller/homecontroller.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../component/component.dart';
import '../../component/second component.dart';
import '../../theme/colors.dart';

class Laboratory extends StatelessWidget {
  Laboratory({super.key});

  TextEditingController laboratorycontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: laboratory(laboratorycontroller)));
  }
}

Widget laboratory(x) => GetBuilder<homecontroller>(
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
                    'معامل تحاليل',
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
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: ListView.separated(
                    separatorBuilder: (context, index) => Gap(10),
                    itemBuilder: (context, i) {
                      controller.readdata();
                      bool? z = false;

                      if (controller.name!.isEmpty && controller.dropvalue=="اختر البلد") {
                        return  pharmContainer(
                            MediaQuery.of(context)
                                .size
                                .width *
                                .8,
                            'معمل / ${controller.laboratorydata![i]["name"]}',
                            controller.laboratorydata![i]
                            ["address"],
                            controller.laboratorydata![i]
                            ["delevery"],
                            controller.laboratorydata![i]
                            ["phone"],
                            controller.laboratorydata![i]
                            ["time"],
                            controller
                                .laboratorydata![i]
                            ["whatsapp"]);
                      }
                      else if (controller.laboratorydata![i]["name"].toString().contains(controller.name! ) && controller.laboratorydata![i]["city"]==controller.dropvalue) {
                        return pharmContainer(
                            MediaQuery.of(context)
                                .size
                                .width *
                                .8,
                            'معمل / ${controller.laboratorydata![i]["name"]}',
                            controller.laboratorydata![i]
                            ["address"],
                            controller.laboratorydata![i]
                            ["delevery"],
                            controller.laboratorydata![i]
                            ["phone"],
                            controller.laboratorydata![i]
                            ["time"],
                            controller
                                .laboratorydata![i]
                            ["whatsapp"]);
                      }
                      else if (controller.name!.isEmpty && controller.laboratorydata![i]["city"]==controller.dropvalue) {
                        return pharmContainer(
                            MediaQuery.of(context)
                                .size
                                .width *
                                .8,
                            'معمل / ${controller.laboratorydata![i]["name"]}',
                            controller.laboratorydata![i]
                            ["address"],
                            controller.laboratorydata![i]
                            ["delevery"],
                            controller.laboratorydata![i]
                            ["phone"],
                            controller.laboratorydata![i]
                            ["time"],
                            controller
                                .laboratorydata![i]
                            ["whatsapp"]);
                      }
                      else if (controller.laboratorydata![i]["name"].toString().contains(controller.name! ) && controller.dropvalue=="اختر البلد") {
                        return pharmContainer(
                            MediaQuery.of(context)
                                .size
                                .width *
                                .8,
                            'معمل / ${controller.laboratorydata![i]["name"]}',
                            controller.laboratorydata![i]
                            ["address"],
                            controller.laboratorydata![i]
                            ["delevery"],
                            controller.laboratorydata![i]
                            ["phone"],
                            controller.laboratorydata![i]
                            ["time"],
                            controller
                                .laboratorydata![i]
                            ["whatsapp"]);
                      }

                      else {
                        return SizedBox(
                          height: 0,
                        );
                      }
                    },
                    itemCount: controller.laboratorydata!.length,
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
