import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../constant/Apptextfield.dart';
import '../controller/homecontroller.dart';
import '../theme/colors.dart';
import 'component.dart';

Widget homePage() => StreamBuilder<ConnectivityResult>(
    stream: Connectivity().onConnectivityChanged,
    builder: (context, snapshot) {
      return Scaffold(
        backgroundColor: Appcolor().secondcolor,
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
                          Icon(Icons.wifi_off,size: 50),
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
                    padding: const EdgeInsets.all(20),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Gap(25),
                            Center(
                              child: Image(
                                height: 130,
                                width: 150,
                                image: AssetImage('images/atebaa.png'),
                                //color: Appcolor().firstcolor,
                              ),
                            ),
                            Center(child: Text('atebaa',style: TextStyle(fontSize: 45,color: Appcolor().firstcolor,fontFamily: 'Bebas',fontWeight: FontWeight.bold,letterSpacing: 5),)),
                            // Container(
                            //   height: 200,
                            //   child:FlutterCarousel(
                            //       items: controller.gene(),
                            //       options: CarouselOptions(
                            //         height: 170,
                            //         enlargeCenterPage: true,
                            //         initialPage: 0,
                            //         autoPlayInterval: Duration(seconds: 5),
                            //         scrollDirection: Axis.horizontal,
                            //         autoPlay: true,
                            //         viewportFraction: 1.0,
                            //         autoPlayCurve: Curves.fastOutSlowIn,
                            //         autoPlayAnimationDuration: Duration(seconds: 2),
                            //         showIndicator: false,
                            //         // reverse: true,
                            //         enableInfiniteScroll: true
                            //       )
                            //   )
                            // ),
                            Gap(10),
                            Text('ابحث عن دكتورك', textAlign: TextAlign.start ,
                              style: TextStyle(color: Appcolor().firstcolor,fontFamily: 'ElMessiri-Bold',fontSize: 16,fontWeight: FontWeight.w700,fontStyle: FontStyle.normal,letterSpacing: -0.3) ,
                            ),
                            Gap(10),
                            Container(
                              width: double.infinity,
                              child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AppTextField(
                                    dataList: [
                                      SelectedListItem(name: 'كل المدن'),
                                      SelectedListItem(name: 'المنزلة'),
                                      SelectedListItem(name: 'البصراط'),
                                      SelectedListItem(name: 'الجمالية'),
                                      SelectedListItem(name: 'دكرنس'),
                                      SelectedListItem(name: 'منية النصر'),
                                      SelectedListItem(name: 'ميت سلسيل'),
                                      SelectedListItem(name: 'المطرية'),
                                    ],
                                    textEditingController: cites,
                                    title: 'اختر مدينة',
                                    hint: 'المدينه',
                                    isCitySelected: true),
                                AppTextField(
                                    dataList: [
                                      SelectedListItem(name: 'كل التخصصات'),
                                      SelectedListItem(name: 'جلديه'),
                                      SelectedListItem(name: 'اسنان'),
                                      SelectedListItem(name: 'نفسي'),
                                      SelectedListItem(name: 'اطفال وحديثي الولادة'),
                                      SelectedListItem(name: 'مخ واعصاب'),
                                      SelectedListItem(name: 'عظام'),
                                      SelectedListItem(name: 'عيون'),
                                      SelectedListItem(name: 'علاج طبيعي اصابات ملاعب'),
                                      SelectedListItem(name: 'نساء وتوليد'),
                                      SelectedListItem(name: 'انف واذن وحنجرة'),
                                      SelectedListItem(name: 'قلب واوعية دموية'),
                                      SelectedListItem(name: 'امراض الدم'),
                                      SelectedListItem(name: 'اورام'),
                                      SelectedListItem(name: 'باطنة'),
                                      SelectedListItem(name: 'تخسيس وتغذية'),
                                      SelectedListItem(name: 'جراحة اطفال'),
                                      SelectedListItem(name: 'جراحة أورام'),
                                      SelectedListItem(name: 'جراحة أوعية دموية'),
                                      SelectedListItem(name: 'جراحة تجميل'),
                                      SelectedListItem(name: 'جراحة سمنة ومناظير'),
                                      SelectedListItem(name: 'جراحة عامة'),
                                      SelectedListItem(name: 'جراحة عمود فقرى'),
                                      SelectedListItem(name: 'جراحة قلب وصدر'),
                                      SelectedListItem(name: 'جراحة مخ وأعصاب'),
                                      SelectedListItem(name: 'جهاز هضمي ومناظير'),
                                      SelectedListItem(name: 'حساسية ومناعة'),
                                      SelectedListItem(name: 'ذكورة وعقم'),
                                      SelectedListItem(name: 'سكر وغدد صماء'),
                                      SelectedListItem(name: 'سمعيات'),
                                      SelectedListItem(name: 'صدر وجهاز تنفسي'),
                                      SelectedListItem(name: 'طب الأسرة'),
                                      SelectedListItem(name: 'حساسية ومناعة'),
                                      SelectedListItem(name: 'ذكورة وعقم'),
                                      SelectedListItem(name: 'روماتيزم'),
                                      SelectedListItem(name: 'كبد'),
                                      SelectedListItem(name: 'كلى'),
                                      SelectedListItem(name: 'مسالك بولية'),
                                      SelectedListItem(name: 'نطق وتخاطب'),
                                    ],
                                    textEditingController: specialty,
                                    title: 'اختر تخصص',
                                    hint: 'التخصص',
                                    isCitySelected: true),
                                buttons('بحث', 45, double.infinity, 20,
                                    Appcolor().firstcolor, Appcolor().thirdcolor, () {
                                      // Connectivity _connectivity = Connectivity();
                                      // _connectivity.onConnectivityChanged.listen(controller.updateConnectionStatus);
                                      if(snapshot.data==ConnectivityResult.none){
                                        controller.noin=false;
                                      }
                                      else{
                                        controller.checkinternet();
                                      }
                                      if (controller.noin == true) {
                                        controller.city = cites.text;
                                        controller.special = specialty.text;
                                        controller.getdata(context);
                                        specialty.clear();
                                        cites.clear();
                                      }
                                      else{
                                        Get.rawSnackbar(
                                            messageText: const Text(
                                                'قم بفحص الاتصال بالانترنت',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 14
                                                )
                                            ),
                                            isDismissible: false,
                                            duration: const Duration(seconds: 2),
                                            backgroundColor: Color(0xffff0000),
                                            icon : const Icon(Icons.wifi_off, color: Colors.white, size: 35,),
                                            margin: EdgeInsets.zero,
                                            snackStyle: SnackStyle.GROUNDED
                                        );
                                      }
                                    }, 15),
                              ],
                            ),
                            ),
                            Gap(20),
                            Row(
                              children: [
                                Text('اعلانات', textAlign: TextAlign.start ,
                                  style: TextStyle(color: Appcolor().firstcolor,fontFamily: 'ElMessiri-Bold',fontSize: 16,fontWeight: FontWeight.w700,fontStyle: FontStyle.normal,letterSpacing: -0.3) ,
                                ),
                                Expanded(child: Gap(0)),
                                Text('اعرف المزيد', textAlign: TextAlign.start ,
                                  style: TextStyle(color: Appcolor().firstcolor,fontFamily: 'ElMessiri-Bold',fontSize: 14,fontWeight: FontWeight.w400,fontStyle: FontStyle.normal,letterSpacing: -0.3) ,
                                ),

                              ],
                            ),
                            Container(
                              height: 150,
                              width: double.infinity,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 10,
                                itemBuilder: (context, index) => Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image(image: AssetImage('images/Research2.jpg'))),
                                ),),
                            )

                            // Text(
                            //   'atebaa',
                            //   style: TextStyle(
                            //       fontSize: 60,
                            //       color: Appcolor().firstcolor,
                            //       fontFamily: 'Bebas',
                            //       fontWeight: FontWeight.bold,
                            //       letterSpacing: 5),
                            // ),
                            // AppTextField(
                            //     dataList: [
                            //       SelectedListItem(name: 'كل المدن'),
                            //       SelectedListItem(name: 'المنزلة'),
                            //       SelectedListItem(name: 'البصراط'),
                            //       SelectedListItem(name: 'الجمالية'),
                            //       SelectedListItem(name: 'دكرنس'),
                            //       SelectedListItem(name: 'منية النصر'),
                            //       SelectedListItem(name: 'ميت سلسيل'),
                            //       SelectedListItem(name: 'المطرية'),
                            //     ],
                            //     textEditingController: cites,
                            //     title: 'اختر مدينة',
                            //     hint: 'المدينه',
                            //     isCitySelected: true),
                            // AppTextField(
                            //     dataList: [
                            //       SelectedListItem(name: 'كل التخصصات'),
                            //       SelectedListItem(name: 'جلديه'),
                            //       SelectedListItem(name: 'اسنان'),
                            //       SelectedListItem(name: 'نفسي'),
                            //       SelectedListItem(name: 'اطفال وحديثي الولادة'),
                            //       SelectedListItem(name: 'مخ واعصاب'),
                            //       SelectedListItem(name: 'عظام'),
                            //       SelectedListItem(name: 'عيون'),
                            //       SelectedListItem(name: 'علاج طبيعي اصابات ملاعب'),
                            //       SelectedListItem(name: 'نساء وتوليد'),
                            //       SelectedListItem(name: 'انف واذن وحنجرة'),
                            //       SelectedListItem(name: 'قلب واوعية دموية'),
                            //       SelectedListItem(name: 'امراض الدم'),
                            //       SelectedListItem(name: 'اورام'),
                            //       SelectedListItem(name: 'باطنة'),
                            //       SelectedListItem(name: 'تخسيس وتغذية'),
                            //       SelectedListItem(name: 'جراحة اطفال'),
                            //       SelectedListItem(name: 'جراحة أورام'),
                            //       SelectedListItem(name: 'جراحة أوعية دموية'),
                            //       SelectedListItem(name: 'جراحة تجميل'),
                            //       SelectedListItem(name: 'جراحة سمنة ومناظير'),
                            //       SelectedListItem(name: 'جراحة عامة'),
                            //       SelectedListItem(name: 'جراحة عمود فقرى'),
                            //       SelectedListItem(name: 'جراحة قلب وصدر'),
                            //       SelectedListItem(name: 'جراحة مخ وأعصاب'),
                            //       SelectedListItem(name: 'جهاز هضمي ومناظير'),
                            //       SelectedListItem(name: 'حساسية ومناعة'),
                            //       SelectedListItem(name: 'ذكورة وعقم'),
                            //       SelectedListItem(name: 'سكر وغدد صماء'),
                            //       SelectedListItem(name: 'سمعيات'),
                            //       SelectedListItem(name: 'صدر وجهاز تنفسي'),
                            //       SelectedListItem(name: 'طب الأسرة'),
                            //       SelectedListItem(name: 'حساسية ومناعة'),
                            //       SelectedListItem(name: 'ذكورة وعقم'),
                            //       SelectedListItem(name: 'روماتيزم'),
                            //       SelectedListItem(name: 'كبد'),
                            //       SelectedListItem(name: 'كلى'),
                            //       SelectedListItem(name: 'مسالك بولية'),
                            //       SelectedListItem(name: 'نطق وتخاطب'),
                            //     ],
                            //     textEditingController: specialty,
                            //     title: 'اختر تخصص',
                            //     hint: 'التخصص',
                            //     isCitySelected: true),
                            // buttons('بحث', 45, double.infinity, 20,
                            //     Appcolor().firstcolor, Appcolor().thirdcolor, () {
                            //   // Connectivity _connectivity = Connectivity();
                            //   // _connectivity.onConnectivityChanged.listen(controller.updateConnectionStatus);
                            //   if (snapshot.data == ConnectivityResult.none) {
                            //     controller.noin = false;
                            //   } else {
                            //     controller.checkinternet();
                            //   }
                            //   if (controller.noin == true) {
                            //     controller.city = cites.text;
                            //     controller.special = specialty.text;
                            //     controller.getdata(context);
                            //     specialty.clear();
                            //     cites.clear();
                            //   } else {
                            //     Get.rawSnackbar(
                            //         messageText: const Text(
                            //             'قم بفحص الاتصال بالانترنت',
                            //             style: TextStyle(
                            //                 color: Colors.white, fontSize: 14)),
                            //         isDismissible: false,
                            //         duration: const Duration(seconds: 2),
                            //         backgroundColor: Color(0xffff0000),
                            //         icon: const Icon(
                            //           Icons.wifi_off,
                            //           color: Colors.white,
                            //           size: 35,
                            //         ),
                            //         margin: EdgeInsets.zero,
                            //         snackStyle: SnackStyle.GROUNDED);
                            //   }
                            // }, 15),
                          ],
                        ),
                    ),
                  );
            }),
      );
    });
