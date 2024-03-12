
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../component/component.dart';
import '../../component/second component.dart';
import '../../theme/colors.dart';

class ChangePassword extends StatelessWidget {
   ChangePassword({super.key});
  TextEditingController name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [

            IconButton(onPressed: () {Get.back();}, icon: Icon(Icons.arrow_forward_rounded)),

            Expanded(
              child: Container(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Gap(8),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Container(
                            height: 60,
                            child: textInputform(
                                IconColor: Appcolor().firstcolor,
                                FillColor: Colors.white,
                                PrefIcon: Icon(Icons.person),
                                LableText: 'كلمة السر القديمة',
                                HintText: '*********',
                                Scure: true,
                                radius: 10,
                                controller: name)),
                      ),
                      Gap(8),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Container(
                            height: 60,
                            child: textInputform(
                                IconColor: Appcolor().firstcolor,
                                FillColor: Colors.white,
                                PrefIcon: Icon(Icons.location_on_outlined),
                                LableText: 'كلمة السر الجديدة',
                                HintText: '*********',
                                Scure: true,
                                radius: 10,
                                controller: name)),
                      ),
                      Gap(8),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Container(
                            height: 60,
                            child: textInputform(
                                IconColor: Appcolor().firstcolor,
                                FillColor: Colors.white,
                                PrefIcon: Icon(Icons.folder_special),
                                LableText: 'كلمة السر الجديدة',
                                HintText: '*********',
                                Scure: true,
                                radius: 10,
                                controller: name)),
                      ),
                      Gap(12),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: buttons('حفظ', 50, double.infinity, 24, Appcolor().firstcolor, Colors.white, () { }, 24),
                      )
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
