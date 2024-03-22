import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../component/second component.dart';
import '../../controller/homecontroller.dart';
import '../../theme/colors.dart';

class SignClient extends StatelessWidget {
  SignClient({super.key});

  var mailadd = TextEditingController();
  var password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<homecontroller>(
      init: homecontroller(),
      builder: (controller) {
        return SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(Icons.arrow_forward)),
                    Center(
                        child: Image(
                      image: AssetImage('images/atebaa.png'),
                      height: 157,
                      width: 154,
                    )),
                    Gap(20),
                    Center(
                      child: Text(
                        'انشاء حساب مستخدم',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 24,
                            fontFamily: 'ElMessiri-Bold'),
                      ),
                    ),
                    Gap(20),

                    Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      child: textInputform(
                          IconColor: Appcolor().firstcolor,
                          FillColor: Appcolor().thirdcolor,
                          PrefIcon: Icon(Icons.person),
                          LableText: 'اسم المستخدم',
                          HintText: 'اسم المستخدم',
                          Scure: true,
                          radius: 25,
                          controller: mailadd),
                    ),
                    Gap(8),
                    Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      child: Container(
                        color: Appcolor().thirdcolor,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25))),
                            prefixIcon: Padding(
                              padding: EdgeInsets.all(0.0),
                              child: Icon(
                                Icons.phone_enabled,
                                color: Appcolor().firstcolor,
                              ),
                            ),
                            hintText: 'رقم الهاتف',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        ),
                      ),
                    ),
                    Gap(8),
                    Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      child: textInputform(
                          IconColor: Appcolor().firstcolor,
                          FillColor: Appcolor().thirdcolor,
                          PrefIcon: Icon(Icons.password),
                          LableText: 'كلمة السر',
                          HintText: '**********',
                          Scure: true,
                          radius: 25,
                          controller: password),
                    ),
                    Gap(8),
                    Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      child: textInputform(
                          IconColor: Appcolor().firstcolor,
                          FillColor: Appcolor().thirdcolor,
                          PrefIcon: Icon(Icons.password),
                          LableText: 'تاكيد كلمة السر',
                          HintText: '**********',
                          Scure: true,
                          radius: 25,
                          controller: password),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: Row(
                        children: [
                          Checkbox(
                              value: controller.isChecked,
                              activeColor: Color(0xFF0904FF),
                              onChanged: (bool? value){
                                controller.changechecked(value);
                              }),
                          Text(
                            'اوافق على القواعد والخصوصية',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        ],
                      ),
                    ),
                     Container(
                       alignment: Alignment.center,
                      child: IconButtons(
                           TextButton: 'انشاء حساب',
                          height: 51.92,
                           width: MediaQuery.of(context).size.width*0.92,
                           TextFont: 20,
                           ButtonColor: Appcolor().firstcolor,
                           TextColor: Appcolor().thirdcolor,
                           ontap: () {
                           },
                           radius: 25),
                     ),
                    Gap(20)
                  ]),
            ),
          ),
        );
      },
    );
    ;
  }
}
