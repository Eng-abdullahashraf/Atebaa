import 'package:atebaa/Screen/LoginScreens/Forget%20pass.dart';
import 'package:atebaa/Screen/LoginScreens/Signup%20page.dart';
import 'package:atebaa/component/component.dart';
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
    return SafeArea(
      child: Scaffold(
        body: GetBuilder<homecontroller>(
          init: homecontroller(),
          builder: (controller) {
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(20),
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
                  child: Container(
                    color: Appcolor().thirdcolor,
                    height: 60,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(20))),
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
                  child: Container(
                    height: 60,
                    child: textInputform(
                        IconColor: Appcolor().firstcolor,
                        FillColor: Appcolor().thirdcolor,
                        PrefIcon: Icon(Icons.password),
                        LableText: 'كلمة السر',
                        HintText: '**********',
                        Scure: true,
                        radius: 20,
                        controller: password),
                  ),
                ),
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
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: buttons('تسجيل الدخول', 50, double.infinity, 24, Appcolor().firstcolor, Colors.white, () {
                    controller.logged=true;
                    controller.changeScreen(5);
                  }, 25),
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
          );
        },)
      ),
    );
  }
}
