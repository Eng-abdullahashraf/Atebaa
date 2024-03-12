import 'package:atebaa/Screen/LoginScreens/Forget%20pass.dart';
import 'package:atebaa/Screen/LoginScreens/Signup%20page.dart';
import 'package:atebaa/component/second%20component.dart';
import 'package:atebaa/controller/homecontroller.dart';
import 'package:atebaa/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  var mailadd = TextEditingController();
  var password = TextEditingController();

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
                  Gap(20),
                  Center(
                    child: Text(
                      'تسجيل الدخول',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                          fontFamily: 'ElMessiri-Bold'),
                    ),
                  ),
                  Gap(35),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: textInputform(
                        IconColor: Appcolor().firstcolor,
                        FillColor: Appcolor().thirdcolor,
                        PrefIcon: Icon(Icons.email_outlined),
                        LableText: 'البريد الالكتروني',
                        HintText: 'Atebaa.doctors@Gmail.com',
                        Scure: true,
                        radius: 25,
                        controller: mailadd),
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
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: TextButton(
                            onPressed: () {
                              Get.to(ForgetPass());
                            },
                            child: Text(
                              'هل نسيت كلمة المرور',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w700,color: Color(0xFF0904FF)),
                              textAlign: TextAlign.right,
                            )),
                      )
                    ],
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: IconButtons(
                        TextButton: 'تسجيل الدخول',
                        height: 51.92,
                        width: MediaQuery.of(context).size.width*0.92,
                        TextFont: 20,
                        ButtonColor: Appcolor().firstcolor,
                        TextColor: Appcolor().thirdcolor,
                        ontap: () {
                        },
                        radius: 25),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('ليس لديك حساب',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16,),),
                      TextButton(
                        onPressed: (){
                          Get.to(SignupPage());
                        },
                        child: Text(
                          'انشاء حساب',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16,color: Color(0xFF0904FF)),
                        ),
                      )
                    ],
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
