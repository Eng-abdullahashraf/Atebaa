import 'package:atebaa/Screen/LoginScreens/Forget%20pass.dart';
import 'package:atebaa/Screen/LoginScreens/Signup%20page%20doctors.dart';
import 'package:atebaa/component/second%20component.dart';
import 'package:atebaa/controller/homecontroller.dart';
import 'package:atebaa/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  var username = TextEditingController();
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
                Gap(50),
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
                      fontFamily: 'ElMessiri-Bold',
                    ),
                  ),
                ),
                Gap(35),
                InputInfoDocForm(
                    PrefIcon: Icon(Icons.phone_enabled),
                    TybeInput: TextInputType.text,
                    LableText: "اسم المستخدم",
                    HintText: "اسم المستخدم",
                    Scure: false,
                    controller: username),
                InputInfoDocForm(
                    PrefIcon: Icon(Icons.password),
                    TybeInput: TextInputType.visiblePassword,
                    LableText: "كلمة السر",
                    HintText: "كلمة السر",
                    Scure: true,
                    controller: password),
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: TextButton(
                      onPressed: () {
                        Get.to(ForgetPass());
                      },
                      child: Text(
                        'هل نسيت كلمة المرور',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF0904FF)),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Container(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Appcolor().firstcolor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        elevation: 3,
                      ),
                      onPressed: controller.isLoading
                          ? null
                          : () {
                        if (username.text.trim().isEmpty ||
                            password.text.trim().isEmpty) {
                          Get.snackbar('خطأ', 'يرجى ملء جميع الحقول',
                              backgroundColor: Colors.red.shade100,
                              colorText: Colors.black);
                          return;
                        }
                        controller.login(
                          username.text.trim(),
                          password.text.trim(),
                        );
                      },
                      child: controller.isLoading
                          ? SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          color: Appcolor().thirdcolor,
                          strokeWidth: 2,
                        ),
                      )
                          : Text(
                        'تسجيل الدخول',
                        style: TextStyle(color: Appcolor().thirdcolor),
                      ),
                    ),
                  ),
                ),
                if (controller.errorMessage.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(
                      controller.errorMessage,
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'ليس لديك حساب',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.to(SignDoctors());
                      },
                      child: Text(
                        'انشاء حساب',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: Color(0xFF0904FF),
                            decoration: TextDecoration.underline),
                      ),
                    )
                  ],
                ),
              ],
            ),
          );
        },
      )),
    );
  }
}
