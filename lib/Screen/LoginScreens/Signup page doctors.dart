import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../component/second component.dart';
import '../../constant/Apptextfield.dart';
import '../../controller/homecontroller.dart';
import '../../theme/colors.dart';

class SignDoctors extends StatelessWidget {
  SignDoctors({super.key});
  bool? isChecked = false;
  var mailadd = TextEditingController();
  var password = TextEditingController();
  TextEditingController cites = TextEditingController();

  List dropItems=['اختر البلد','المنزلة','البصراط'];
  String? dropvalue='اختر البلد';

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
                        'انشاء حساب طبيب',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 24,
                            fontFamily: 'ElMessiri-Bold'),
                      ),
                    ),
                    Gap(20),
                    InputInfoDocForm(
                        PrefIcon: Icon(Icons.person),
                        TybeInput: TextInputType.name,
                        LableText: "اسم المستخدم",
                        HintText: "اسم المستخدم",
                        Scure: false,
                        controller: TextEditingController()),
                    Padding(
                      padding:
                      const EdgeInsets.only(left: 16, right: 16, top: 13),
                      child: Container(
                          padding: EdgeInsets.only(
                            left: 16,
                            right: 16,
                          ),
                          decoration: BoxDecoration(color: Appcolor().thirdcolor,
                              border: Border.all(color: Colors.black87),
                              borderRadius: BorderRadius.circular(10)),
                          child: DropdownButtonFormField(
                            decoration: InputDecoration(
                              focusedBorder: InputBorder.none,
                              border: InputBorder.none,
                            ),
                            value: controller.dropvaluedoctorstype,
                            items: controller.dropdoctorstype
                                .map((e) =>
                                DropdownMenuItem(value: e, child: Text(e)))
                                .toList(),
                            onChanged: (value) {
                              controller.changedropdoctorstype(value);
                            },
                          )),
                    ),

                    Padding(
                      padding:
                      const EdgeInsets.only(left: 16, right: 16, top: 13),
                      child: Container(
                          padding: EdgeInsets.only(
                            left: 16,
                            right: 16,
                          ),
                          decoration: BoxDecoration(color: Appcolor().thirdcolor,
                              border: Border.all(color: Colors.black87),
                              borderRadius: BorderRadius.circular(10)),
                          child: DropdownButtonFormField(
                            decoration: InputDecoration(
                              focusedBorder: InputBorder.none,
                              border: InputBorder.none,
                            ),
                            value: controller.dropvaluedoctorspecial,
                            items: controller.dropdoctorsspecial
                                .map((e) =>
                                DropdownMenuItem(value: e, child: Text(e)))
                                .toList(),
                            onChanged: (value) {
                              controller.changedropdoctorsspecial(value);
                            },
                          )),
                    ),
                    InputInfoDocForm(
                        PrefIcon: Icon(Icons.phone_enabled),
                        TybeInput: TextInputType.number,
                        LableText: "رقم الهاتف",
                        HintText: "رقم الهاتف",
                        Scure: false,
                        controller: TextEditingController()),
                    Padding(
                      padding:
                      const EdgeInsets.only(left: 16, right: 16, top: 13),
                      child: Container(
                          padding: EdgeInsets.only(
                            left: 16,
                            right: 16,
                          ),
                          decoration: BoxDecoration(color: Appcolor().thirdcolor,
                              border: Border.all(color: Colors.black87),
                              borderRadius: BorderRadius.circular(10)),
                          child: DropdownButtonFormField(
                            decoration: InputDecoration(
                              focusedBorder: InputBorder.none,
                              border: InputBorder.none,
                            ),
                            value: controller.dropvalue,
                            items: controller.dropItems
                                .map((e) =>
                                DropdownMenuItem(value: e, child: Text(e)))
                                .toList(),
                            onChanged: (value) {
                              controller.changedrop(value);
                            },
                          )),
                    ),
                    Padding(
                      padding:
                      const EdgeInsets.only(left: 16, right: 16, top: 13),
                      child: Container(
                          padding: EdgeInsets.only(
                            left: 16,
                            right: 16,
                          ),
                          decoration: BoxDecoration(color: Appcolor().thirdcolor,
                              border: Border.all(color: Colors.black87),
                              borderRadius: BorderRadius.circular(10)),
                          child: DropdownButtonFormField(
                            decoration: InputDecoration(
                              focusedBorder: InputBorder.none,
                              border: InputBorder.none,
                            ),
                            value: controller.dropvalue,
                            items: controller.dropItems
                                .map((e) =>
                                DropdownMenuItem(value: e, child: Text(e)))
                                .toList(),
                            onChanged: (value) {
                              controller.changedrop(value);
                            },
                          )),
                    ),
                    InputInfoDocForm(
                        PrefIcon: Icon(Icons.password),
                        TybeInput: TextInputType.visiblePassword,
                        LableText: "كلمة السر",
                        HintText: "كلمة السر",
                        Scure: true,
                        controller: TextEditingController()),
                    InputInfoDocForm(
                        PrefIcon: Icon(Icons.password),
                        TybeInput: TextInputType.visiblePassword,
                        LableText: "تأكيد كلمة السر",
                        HintText: "تأكيد كلمة السر",
                        Scure: true,
                        controller: TextEditingController()),
                    Center(
                      child: Container(
                        child: Column(
                          children: [
                            Text(
                              'قم برفع صورة اثبات الشخصية',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: InkWell(
                                onTap: () {},
                                radius: 25,
                                child: Image(
                                  image: AssetImage('images/qrcode.png'),
                                  height: 114,
                                  width: 114,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 35),
                      child: Row(
                        children: [
                          Checkbox(
                              value: controller.isChecked,
                              activeColor: Color(0xFF0904FF),
                              onChanged: (bool? value) {
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
                          TextButton: 'انشاء',
                          height: 51.92,
                          width: MediaQuery.of(context).size.width * 0.92,
                          TextFont: 20,
                          ButtonColor: Appcolor().firstcolor,
                          TextColor: Appcolor().thirdcolor,
                          ontap: () {},
                          radius: 25),
                    ),
                    Gap(20)
                  ]),
            ),
          ),
        );
      },
    );
  }
}
