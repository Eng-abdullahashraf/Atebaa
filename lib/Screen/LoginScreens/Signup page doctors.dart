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
  var username = TextEditingController();
  var name = TextEditingController();
  var mailadd = TextEditingController();
  var address = TextEditingController();
  var phone = TextEditingController();
  var whatsapp = TextEditingController();
  var government = TextEditingController();
  var city = TextEditingController();
  var type = TextEditingController();
  var gender = TextEditingController();
  var password = TextEditingController();
  var verifypassword = TextEditingController();


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
                      image: AssetImage('images/ateba.png'),
                      height: 157,
                      width: 154,
                    )),
                    Gap(20),
                    Center(
                      child: Text(
                        'انشاء حساب',
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
                        controller: username), //‘Username
                    InputInfoDocForm(
                        PrefIcon: Icon(Icons.person),
                        TybeInput: TextInputType.name,
                        LableText: "الاسم الشخصي",
                        HintText: "محمد أحمد السيد",
                        Scure: false,
                        controller: name),//name
                    InputInfoDocForm(
                        PrefIcon: Icon(Icons.person),
                        TybeInput: TextInputType.name,
                        LableText: "العنوان",
                        HintText: "العنوان بالتفصيل",
                        Scure: false,
                        controller: address),//name
                    InputInfoDocForm(
                        PrefIcon: Icon(Icons.person),
                        TybeInput: TextInputType.name,
                        LableText: "البريد الالكتروني",
                        HintText: "mail@comp.com",
                        Scure: false,
                        controller: mailadd),//name
                    InputInfoDocForm(
                        PrefIcon: Icon(Icons.phone_enabled),
                        TybeInput: TextInputType.number,
                        LableText: "رقم الهاتف",
                        HintText: "رقم الهاتف",
                        Scure: false,
                        controller: phone),
                    InputInfoDocForm(
                        PrefIcon: Icon(Icons.phone_enabled),
                        TybeInput: TextInputType.number,
                        LableText: "رقم الواتساب",
                        HintText: "رقم الواتساب",
                        Scure: false,
                        controller: whatsapp),
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
                            value: controller.dropGovvalue,
                            items: controller.dropGoverItems
                                .map((e) =>
                                DropdownMenuItem(value: e, child: Text(e)))
                                .toList(),
                            onChanged: (value) {
                              controller.changgovdrop(value);
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
                            value: controller.dropCityvalue,
                            items: controller.dropCityItems
                                .map((e) =>
                                DropdownMenuItem(value: e, child: Text(e)))
                                .toList(),
                            onChanged: (value) {
                              controller.changcityedrop(value);
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
                    InputInfoDocForm(
                        PrefIcon: Icon(Icons.person),
                        TybeInput: TextInputType.name,
                        LableText: "الجنس",
                        HintText: "الجنس",
                        Scure: false,
                        controller: gender), //‘Username

                    InputInfoDocForm(
                        PrefIcon: Icon(Icons.password),
                        TybeInput: TextInputType.visiblePassword,
                        LableText: "كلمة السر",
                        HintText: "كلمة السر",
                        Scure: true,
                        controller: password),
                    InputInfoDocForm(
                        PrefIcon: Icon(Icons.password),
                        TybeInput: TextInputType.visiblePassword,
                        LableText: "تأكيد كلمة السر",
                        HintText: "تأكيد كلمة السر",
                        Scure: true,
                        controller: verifypassword),
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
                          ontap: () {
                            try{
                              Map<String, String> fields = {
                                "اسم المستخدم": username.text,
                                "الاسم": name.text,
                                "العنوان": address.text,
                                "البريد الإلكتروني": mailadd.text,
                                "رقم الهاتف": phone.text,
                                "رقم الواتساب": whatsapp.text,
                                "المحافظة": controller.dropGovvalue.toString(),
                                "المدينة": controller.dropCityvalue.toString(),
                                "نوع الطبيب": controller.dropvaluedoctorstype.toString(),
                                "النوع": gender.text,
                                "كلمة السر": password.text,
                              };
                              String? emptyField;

                              fields.forEach((key, value) {
                                if (value.trim().isEmpty ||
                                    value == 'اختر المحافظة' ||
                                    value == 'اختر المدينة' ||
                                    value == 'اختر النوع') {
                                  emptyField ??= key;
                                }
                              });
                              if (emptyField != null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("من فضلك أدخل $emptyField"),
                                    backgroundColor: Colors.red,
                                    duration: Duration(seconds: 3),
                                  ),
                                );
                              } else if (password.text != verifypassword.text) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("كلمة السر وتأكيدها غير متطابقين"),
                                    backgroundColor: Colors.red,
                                    duration: Duration(seconds: 3),
                                  ),
                                );
                              } else {
                                controller.sendData(
                                  username.text,
                                  name.text,
                                  address.text,
                                  mailadd.text,
                                  phone.text,
                                  whatsapp.text,
                                  controller.dropGovvalue,
                                  controller.dropCityvalue,
                                  controller.dropvaluedoctorstype,
                                  gender.text,
                                  password.text,
                                );
                              }
                              // if(username.text.isEmpty || name.text.isEmpty || address.text.isEmpty || mailadd.text.isEmpty || phone.text.isEmpty || whatsapp.text.isEmpty || controller.dropGovvalue=='اختر المحافظة' ||controller.dropCityvalue=='اختر المدينة' ||controller.dropvaluedoctorstype=='اختر النوع' || gender.text.isEmpty || password.text.isEmpty){
                              //   ScaffoldMessenger.of(context).showSnackBar(
                              //     SnackBar(
                              //       content: Text("راجع البيانات"),
                              //       backgroundColor: Colors.red,
                              //       duration: Duration(seconds: 3),
                              //     ),
                              //   );
                              // }
                              // else{
                              //   if(password.text==verifypassword.text){
                              //     controller.sendData(username.text, name.text, address.text, mailadd.text, phone.text, whatsapp.text, controller.dropGovvalue, controller.dropCityvalue, controller.dropvaluedoctorstype, gender.text, password.text);
                              //   }
                              //   else{
                              //     ScaffoldMessenger.of(context).showSnackBar(
                              //       SnackBar(
                              //         content: Text("كلمة السر وتأكيدها غير متطابقين"),
                              //         backgroundColor: Colors.red,
                              //         duration: Duration(seconds: 3),
                              //       ),
                              //     );
                              //   }
                              // }

                            }
                            catch(e){
                              print(e);
                            }
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
  }
}
