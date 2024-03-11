import 'package:atebaa/Screen/Advertisingscreen.dart';
import 'package:atebaa/theme/advertisingimage.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import '../../constant/Apptextfield.dart';
import '../../controller/homecontroller.dart';
import '../../theme/colors.dart';
import '../../component/component.dart';

class SearchDoctors extends StatelessWidget {
  const SearchDoctors({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: searchDoctors(),);
  }
}

Widget searchDoctors() => StreamBuilder<ConnectivityResult>(
    stream: Connectivity().onConnectivityChanged,
    builder: (context, snapshot) {
      return SafeArea(
        child: Scaffold(
          backgroundColor: Appcolor().thirdcolor,
          body: GetBuilder<homecontroller>(
              init: homecontroller(),
              builder: (controller) {
                controller.checkinternet();
                TextEditingController cites = TextEditingController();
                TextEditingController specialty = TextEditingController();
                return controller.noin == false
                    ? Container(
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.wifi_off, size: 50),
                            Text(
                              'برجاء الاتصال بالانترنت',
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: -0.3,
                                  fontFamily: 'ElMessiri-Bold'),
                            )
                          ],
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            IconButton(onPressed: () {Get.back();}, icon: Icon(Icons.arrow_forward_rounded)),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 30, right: 15, top: 8),
                              child: Image(image: AssetImage('images/doctors.png')),
                            ),
                            Expanded(
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 15, left: 15, top: 15),
                                      child: Text(
                                        'ابحث عن دكتورك',
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            color: Appcolor().firstcolor,
                                            fontFamily: 'ElMessiri-Bold',
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                            fontStyle: FontStyle.normal,
                                            letterSpacing: -0.3),
                                      ),
                                    ),
                                    Gap(10),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 15, left: 15, bottom: 5),
                                      child: Container(
                                        width: double.infinity,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            AppTextField(
                                                dataList: [
                                                  SelectedListItem(
                                                      name: 'كل المدن'),
                                                  SelectedListItem(
                                                      name: 'المنصورة'),
                                                  SelectedListItem(
                                                      name: 'المنزلة'),
                                                  SelectedListItem(
                                                      name: 'البصراط'),
                                                  SelectedListItem(
                                                      name: 'الجمالية'),
                                                  SelectedListItem(
                                                      name: 'المطرية'),
                                                  SelectedListItem(
                                                      name: 'دكرنس'),
                                                  SelectedListItem(
                                                      name: 'الرياض'),
                                                  SelectedListItem(
                                                      name: 'الكردي'),
                                                  SelectedListItem(
                                                      name: 'منية النصر'),
                                                  SelectedListItem(
                                                      name: 'ميت سلسيل'),
                                                ],
                                                textEditingController: cites,
                                                title: 'اختر مدينة',
                                                hint: 'المدينه',
                                                isCitySelected: true),
                                            AppTextField(
                                                dataList: [
                                                  SelectedListItem(
                                                      name: 'كل التخصصات'),
                                                  SelectedListItem(
                                                      name: 'جلديه'),
                                                  SelectedListItem(
                                                      name: 'اسنان'),
                                                  SelectedListItem(
                                                      name: 'نفسي'),
                                                  SelectedListItem(
                                                      name:
                                                          'اطفال وحديثي الولادة'),
                                                  SelectedListItem(
                                                      name: 'مخ واعصاب'),
                                                  SelectedListItem(
                                                      name: 'عظام'),
                                                  SelectedListItem(
                                                      name: 'عيون'),
                                                  SelectedListItem(
                                                      name:
                                                          'علاج طبيعي اصابات ملاعب'),
                                                  SelectedListItem(
                                                      name: 'نساء وتوليد'),
                                                  SelectedListItem(
                                                      name: 'انف واذن وحنجرة'),
                                                  SelectedListItem(
                                                      name: 'قلب واوعية دموية'),
                                                  SelectedListItem(
                                                      name: 'امراض الدم'),
                                                  SelectedListItem(
                                                      name: 'اورام'),
                                                  SelectedListItem(
                                                      name: 'باطنة'),
                                                  SelectedListItem(
                                                      name: 'تخسيس وتغذية'),
                                                  SelectedListItem(
                                                      name: 'جراحة اطفال'),
                                                  SelectedListItem(
                                                      name: 'جراحة أورام'),
                                                  SelectedListItem(
                                                      name:
                                                          'جراحة أوعية دموية'),
                                                  SelectedListItem(
                                                      name: 'جراحة تجميل'),
                                                  SelectedListItem(
                                                      name:
                                                          'جراحة سمنة ومناظير'),
                                                  SelectedListItem(
                                                      name: 'جراحة عامة'),
                                                  SelectedListItem(
                                                      name: 'جراحة عمود فقرى'),
                                                  SelectedListItem(
                                                      name: 'جراحة قلب وصدر'),
                                                  SelectedListItem(
                                                      name: 'جراحة مخ وأعصاب'),
                                                  SelectedListItem(
                                                      name:
                                                          'جهاز هضمي ومناظير'),
                                                  SelectedListItem(
                                                      name: 'حساسية ومناعة'),
                                                  SelectedListItem(
                                                      name: 'ذكورة وعقم'),
                                                  SelectedListItem(
                                                      name: 'سكر وغدد صماء'),
                                                  SelectedListItem(
                                                      name: 'سمعيات'),
                                                  SelectedListItem(
                                                      name: 'صدر وجهاز تنفسي'),
                                                  SelectedListItem(
                                                      name: 'طب الأسرة'),
                                                  SelectedListItem(
                                                      name: 'روماتيزم'),
                                                  SelectedListItem(name: 'كبد'),
                                                  SelectedListItem(name: 'كلى'),
                                                  SelectedListItem(
                                                      name: 'مسالك بولية'),
                                                  SelectedListItem(
                                                      name: 'نطق وتخاطب'),
                                                ],
                                                textEditingController:
                                                    specialty,
                                                title: 'اختر تخصص',
                                                hint: 'التخصص',
                                                isCitySelected: true),
                                            buttons(
                                                'بحث',
                                                45,
                                                double.infinity,
                                                20,
                                                Appcolor().firstcolor,
                                                Appcolor().thirdcolor, () {
                                              //controller.getdataapi();
                                              if (snapshot.data ==
                                                  ConnectivityResult.none) {
                                                controller.noin = false;
                                              } else {
                                                controller.checkinternet();
                                              }
                                              if (controller.noin == true) {
                                                controller.city = cites.text;
                                                controller.special =
                                                    specialty.text;
                                                controller.getdata(context);
                                                controller.showAppAdd();
                                                controller.loaded();
                                              } else {
                                                Get.rawSnackbar(
                                                    messageText: const Text(
                                                        'قم بفحص الاتصال بالانترنت',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 14)),
                                                    isDismissible: false,
                                                    duration: const Duration(
                                                        seconds: 2),
                                                    backgroundColor:
                                                        Color(0xffff0000),
                                                    icon: const Icon(
                                                      Icons.wifi_off,
                                                      color: Colors.white,
                                                      size: 35,
                                                    ),
                                                    margin: EdgeInsets.zero,
                                                    snackStyle:
                                                        SnackStyle.GROUNDED);
                                              }
                                            }, 15),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Image(image: AssetImage('images/esm.png')),
                            Gap(20),
                          ],
                        ),
                      );
              }),
        ),
      );
    });


