import 'package:atebaa/Screen/LoginScreens/Signup%20page%20client.dart';
import 'package:atebaa/Screen/LoginScreens/Signup%20page%20doctors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../component/second component.dart';
import '../../controller/homecontroller.dart';
import '../../theme/colors.dart';
class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<homecontroller>(
      init: homecontroller(),
      builder: (Controller) {
        return SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_forward)),
                  Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 139),
                        child: Image(
                          image: AssetImage('images/atebaa.png'),
                          height: 157,
                          width: 154,
                        ),
                      )),

                  Gap(35),
                  Container(
                    alignment: Alignment.center,
                    child: IconButtons(
                        TextButton: 'انشاء حساب عميل',
                        height: 51.92,
                        width: MediaQuery.of(context).size.width*0.92,
                        TextFont: 20,
                        ButtonColor: Appcolor().firstcolor,
                        TextColor: Appcolor().thirdcolor,
                        ontap: () {
                          Get.to(SignClient());
                        },
                        radius: 25),
                  ),
                  Gap(30),
                  Container(
                    alignment: Alignment.center,
                    child: IconButtons(
                        TextButton: 'انشاء حساب مشترك',
                        height: 51.92,
                        width: MediaQuery.of(context).size.width*0.92,
                        TextFont: 20,
                        ButtonColor: Appcolor().firstcolor,
                        TextColor: Appcolor().thirdcolor,
                        ontap: () {
                          Get.to(SignDoctors());
                        },
                        radius: 25),
                  ),
                ],

              ),
            ),
          ),
        );
      },
    );
  }
}
