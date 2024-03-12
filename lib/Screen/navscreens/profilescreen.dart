import 'package:atebaa/Screen/profilemenu/changepassword.dart';
import 'package:atebaa/Screen/profilemenu/profiledata.dart';
import 'package:atebaa/Screen/profilemenu/socialscreen.dart';
import 'package:atebaa/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Column(
      children: [
        Gap(35),
        Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(150),
            child: Image(image: AssetImage('images/pngegg.png'), width: 150),
          ),
        ),
        Gap(15),
        Text(
          'د/ أحمد محمد السعيد',
          style: TextStyle(
              fontSize: 24,
              fontFamily: 'ElMessiri-Bold',
              color: Appcolor().firstcolor),
        ),
        Expanded(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(25),topLeft: Radius.circular(25)),
                  color: Appcolor().secondcolor),
          width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    InkWell(child: RowInProfile('حسابي',Icons.account_circle),onTap: () {
                      Get.to(ProfileData());
                    },),
                    Gap(8), InkWell(onTap: () {
                      Get.to(SocialScreen());
                    },child: RowInProfile('وسائل التواصل',Icons.add_link_outlined)),
                    Gap(8),
                    RowInProfile('إضافة إعلان',Icons.mic_rounded),
                    Gap(8),
                    RowInProfile('عروض وخصومات',Icons.local_offer),
                    Gap(8), InkWell(onTap: () {
                      Get.to(ChangePassword());
                    },child: RowInProfile('تغيير كلمة السر',Icons.key)),
                    Gap(8),
                    RowInProfile('الشروط والخصوصية',Icons.policy),
                    Expanded(child: Gap(8)),
                    RowInProfile('تسجيل الخروج',Icons.logout_outlined),

                  ],
                ),
              ),
        )),
      ],
    )));
  }
}

Widget RowInProfile(x,z)=>Row(children: [
  Icon(z,color: Colors.black,size: 40,),
  Gap(8),
  Expanded(child: Text(x,style: TextStyle(fontSize: 18,color: Colors.black,fontFamily: 'ElMessiri-Bold'))),
  Gap(8),
  Icon(Icons.arrow_forward_ios,size: 30,color: Colors.black,)

],);