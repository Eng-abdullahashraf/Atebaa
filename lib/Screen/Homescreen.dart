
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Apptextfield.dart';
import '../component.dart';
import '../controller/homecontroller.dart';
import '../theme/colors.dart';
class Homescreen extends StatelessWidget {
   Homescreen({super.key});

  TextEditingController cites = TextEditingController();
  TextEditingController specialty = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GetBuilder<homecontroller>(
          init: homecontroller(),
          builder: (controller) => Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('tabebak', style: TextStyle(fontSize: 35)),
                SizedBox(
                  height: 40,
                ),
                AppTextField(
                    dataList: [
                      SelectedListItem(name: 'المنزلة'),
                      SelectedListItem(name: 'البصراط'),
                      SelectedListItem(name: 'الجمالية'),
                      SelectedListItem(name: 'المطرية'),
                    ],
                    textEditingController: cites,
                    title: 'اختر مدينتك',
                    hint: 'مدينتك',
                    isCitySelected: true),
                AppTextField(
                    dataList: [
                      SelectedListItem(name: 'باطنة'),
                      SelectedListItem(name: 'عظام'),
                      SelectedListItem(name: 'اسنان'),
                      SelectedListItem(name: 'نساء'),
                    ],
                    textEditingController: specialty,
                    title: 'اختر تخصص الدكتور',
                    hint: 'التخصص',
                    isCitySelected: true),
                buttons('بحث', 45, double.infinity, 25,
                    Appcolor().firstcolor, Appcolor().thirdcolor, () {
                      controller.city=cites.text;
                      controller.special=specialty.text;
                      controller.getdata(context);
                      specialty.clear();
                      cites.clear();
                    }, 15),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
