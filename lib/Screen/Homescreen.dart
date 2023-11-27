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
        backgroundColor: Appcolor().secondcolor,
        body: GetBuilder<homecontroller>(
          init: homecontroller(),
          builder: (controller) => Padding(
            padding: const EdgeInsets.all(25),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Padding(
                    padding: const EdgeInsets.only(top: 100,bottom: 40),
                    child: Image(
                      height: 150,
                      image: AssetImage('images/atebaa.png'),
                      color: Appcolor().firstcolor,
                    ),
                  ),

                  AppTextField(
                      dataList: [
                        SelectedListItem(name: 'الكل'),
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
                        SelectedListItem(name: 'الكل'),
                        SelectedListItem(name: 'باطنة'),
                        SelectedListItem(name: 'عظام'),
                        SelectedListItem(name: 'اسنان'),
                        SelectedListItem(name: 'نساء'),
                        SelectedListItem(name: 'أنف وأذن'),
                        SelectedListItem(name: 'قلب'),
                        SelectedListItem(name: 'جراحة'),
                        SelectedListItem(name: 'مخ وأعصاب'),
                        SelectedListItem(name: 'عيون'),


                      ],
                      textEditingController: specialty,
                      title: 'اختر تخصص الدكتور',
                      hint: 'التخصص',
                      isCitySelected: true),
                  buttons('بحث', 45, double.infinity, 25,
                      Appcolor().firstcolor, Appcolor().thirdcolor, () {
                    if (controller.noin == true) {
                      controller.city = cites.text;
                      controller.special = specialty.text;
                      controller.getdata(context);
                      specialty.clear();
                      cites.clear();
                    }
                    else{
                      Get.rawSnackbar(
                          messageText: const Text(
                              'PLEASE CONNECT TO THE INTERNET',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14
                              )
                          ),
                          isDismissible: false,
                          duration: const Duration(seconds: 100),
                          backgroundColor: Colors.red!,
                          icon : const Icon(Icons.wifi_off, color: Colors.white, size: 35,),
                          margin: EdgeInsets.zero,
                          snackStyle: SnackStyle.GROUNDED
                      );
                    }
                  }, 15),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
