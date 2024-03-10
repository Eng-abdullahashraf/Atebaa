import 'package:atebaa/Screen/LoginScreens/Confirmation.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../component/second component.dart';
import '../../controller/homecontroller.dart';
import '../../theme/colors.dart';
class ForgetPass extends StatelessWidget {
   ForgetPass({super.key});

  var mailadd = TextEditingController();

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
                      child: Image(
                        image: AssetImage('images/atebaa.png'),
                        height: 157,
                        width: 154,
                      )),
                  Gap(35),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: TextInput(
                        IconColor: Appcolor().firstcolor,
                        FillColor: Appcolor().thirdcolor,
                        PrefIcon: Icon(Icons.email_outlined),
                        LableText: 'البريد الالكتروني',
                        HintText: 'Atebaa.doctors@Gmail.com',
                        Scure: true,
                        radius: 25,
                        controller: mailadd),
                  ),
                  Gap(20),
                  Container(
                    alignment: Alignment.center,
                    child: IconButtons(
                        TextButton: 'ارسال رمز التاكيد',
                        height: 51.92,
                        width: MediaQuery.of(context).size.width*0.92,
                        TextFont: 20,
                        ButtonColor: Appcolor().firstcolor,
                        TextColor: Appcolor().thirdcolor,
                        ontap: () {
                          Get.to(Confirm());
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
