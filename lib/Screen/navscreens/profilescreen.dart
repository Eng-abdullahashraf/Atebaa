import 'package:atebaa/Screen/profilemenu/addAdvertising.dart';
import 'package:atebaa/Screen/profilemenu/changepassword.dart';
import 'package:atebaa/Screen/profilemenu/profiledata.dart';
import 'package:atebaa/controller/homecontroller.dart';
import 'package:atebaa/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../component/component.dart';
import '../profilemenu/profileComponent.dart';
import '../tabbedscreens/laboratory.dart';
import '../tabbedscreens/pharmacypage.dart';
import '../tabbedscreens/radiologypage.dart';
import '../tabbedscreens/searchdoctors.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  TextEditingController name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Appcolor().secondcolor,
            body: GetBuilder<homecontroller>(
              init: homecontroller(),
              builder: (controller) {
                return Padding(
                    padding: const EdgeInsets.only(
                        top: 80, left: 16, right: 16, bottom: 16),
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 90),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Appcolor().thirdcolor),
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 15, right: 15, top: 60, bottom: 15),
                              child: SingleChildScrollView(
                                child: Column(children: [
                                  Gap(20),
                                  InkWell(
                                    child: RowInProfile(
                                        'حسابي', Icons.account_circle),
                                    onTap: () {
                                      Get.to(ProfileData());
                                    },
                                  ),
                                  Gap(15),
                                  InkWell(
                                      onTap: () {
                                        showModalBottomSheet(
                                          isScrollControlled: true,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.vertical(
                                                      top:
                                                          Radius.circular(30))),
                                          context: context,
                                          builder: (context) => Social(name),
                                        );
                                      },
                                      child: RowInProfile('وسائل التواصل',
                                          Icons.add_link_outlined)),
                                  Gap(15),
                                  InkWell(
                                    onTap: () {
                                      Get.to(AddAdvertising());
                                    },
                                    child: RowInProfile(
                                        'إضافة إعلان', Icons.mic_rounded),
                                  ),
                                  Gap(15),
                                  RowInProfile(
                                      'عروض وخصومات', Icons.local_offer),
                                  Gap(15),
                                  InkWell(
                                      onTap: () {
                                        showModalBottomSheet(
                                          isScrollControlled: true,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.vertical(
                                                      top:
                                                          Radius.circular(30))),
                                          context: context,
                                          builder: (context) => changePass(name),
                                        );
                                      },
                                      child: RowInProfile(
                                          'تغيير كلمة السر', Icons.key)),
                                  Gap(15),
                                  RowInProfile(
                                      'عن التطبيق', Icons.account_box_outlined),
                                  Gap(15),
                                  RowInProfile(
                                      'الشروط والخصوصية', Icons.policy),
                                  Gap(50),
                                  InkWell(
                                      onTap: () {
                                        controller.logged = false;
                                        controller.changeScreen(4);
                                      },
                                      child: RowInProfile('تسجيل الخروج',
                                          Icons.logout_outlined)),
                                ]),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: controller.fImage == null
                                    ? Image(
                                          image: AssetImage('images/pngegg.png'),
                                          width: 130,height: 150,fit: BoxFit.fill,)
                                    : Image.file(controller.fImage!,width: 130,height: 130,fit: BoxFit.cover),

                              ),
                              Gap(8),
                              Container(
                                color: Appcolor().thirdcolor,
                                child: Text(
                                  'د/ أحمد محمد السعيد',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'ElMessiri-Bold',
                                      color: Appcolor().firstcolor),
                                ),
                              ),
                            ],
                          ),
                          top: 0,
                        ),
                      ],
                    ));
              },
            )));
  }
}

Widget RowInProfile(x, z) => Row(
      children: [
        Icon(
          z,
          color: Colors.black45,
          size: 25,
        ),
        Gap(8),
        Expanded(
            child: Text(x,
                style: TextStyle(
                    fontSize: 13,
                    color: Colors.black45,
                    fontFamily: 'ElMessiri-Bold'))),
        Gap(8),
        Icon(
          Icons.arrow_forward_ios,
          size: 20,
          color: Colors.black45,
        )
      ],
    );
