
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../component/component.dart';
import '../../component/second component.dart';
import '../../theme/colors.dart';

class SocialScreen extends StatelessWidget {
   SocialScreen({super.key});
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
                                LableText: 'رابط حساب فيس بوك',
                                HintText: 'رابط حساب فيس بوك',
                                Scure: false,
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
                                LableText: 'رابط حساب واتس اب',
                                HintText: 'رابط حساب واتس اب',
                                Scure: false,
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
                                LableText: 'رابط حساب انستجرام',
                                HintText: 'رابط حساب انستجرام',
                                Scure: false,
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
