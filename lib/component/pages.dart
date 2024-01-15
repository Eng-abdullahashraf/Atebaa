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
import 'package:url_launcher/url_launcher.dart';

import '../constant/Apptextfield.dart';
import '../constant/addvertisingmodels.dart';
import '../controller/homecontroller.dart';
import '../theme/colors.dart';
import 'component.dart';

Widget homePage() => StreamBuilder<ConnectivityResult>(
    stream: Connectivity().onConnectivityChanged,
    builder: (context, snapshot) {
      return SafeArea(
        child: Scaffold(
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
                    : SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Center(
                          //   child: Image(
                          //     height: 130,
                          //     width: 150,
                          //     image: AssetImage('images/atebaa.png'),
                          //     //color: Appcolor().firstcolor,
                          //   ),
                          // ),
                          // Center(
                          //     child: Text(
                          //   'atebaa',
                          //   style: TextStyle(
                          //       fontSize: 45,
                          //       color: Appcolor().firstcolor,
                          //       fontFamily: 'Bebas',
                          //       fontWeight: FontWeight.bold,
                          //       letterSpacing: 5),
                          // )),
                          Padding(
                            padding: const EdgeInsets.only(left: 30,right: 15,top: 8),
                            child: Container(
                              width: double.infinity,
                              height: 50,
                             // decoration: BoxDecoration(color: Appcolor().firstcolor),
                              child: Row(
                                  children: [
                                    
                                  Image(
                                      image: AssetImage('images/atebaa.png'),
                                      //color: Appcolor().firstcolor,
                                    ),
                                Expanded(child: Gap(0)),
                                Text(
                                    'atebaa',
                                    style: TextStyle(
                                  fontSize: 45,
                                  color: Appcolor().firstcolor,
                                  fontFamily: 'Bebas',
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 5),
                                  )
                              ]
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: Container(
                              height: 250,
                              child:FlutterCarousel(
                                  items: controller.gene(context),
                                  options: CarouselOptions(
                                    height: 170,
                                    enlargeCenterPage: true,
                                    initialPage: 0,
                                    autoPlayInterval: Duration(seconds: 5),
                                    scrollDirection: Axis.horizontal,
                                    autoPlay: true,
                                    viewportFraction: 1.0,
                                    autoPlayCurve: Curves.fastOutSlowIn,
                                    autoPlayAnimationDuration: Duration(seconds: 2),
                                    showIndicator: true,
                                    enableInfiniteScroll: true,

                                  )
                              )
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 15,left: 15),
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
                            padding: const EdgeInsets.all(15),
                            child: Container(
                              width: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AppTextField(
                                      dataList: [
                                        SelectedListItem(name: 'كل المدن'),
                                        SelectedListItem(name: 'المنصورة'),
                                        SelectedListItem(name: 'المنزلة'),
                                        SelectedListItem(name: 'البصراط'),
                                        SelectedListItem(name: 'الجمالية'),
                                        SelectedListItem(name: 'المطرية'),
                                        SelectedListItem(name: 'دكرنس'),
                                        SelectedListItem(name: 'الرياض'),
                                        SelectedListItem(name: 'الكردي'),
                                        SelectedListItem(name: 'منية النصر'),
                                        SelectedListItem(name: 'ميت سلسيل'),
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
                                  buttons(
                                      'بحث',
                                      45,
                                      double.infinity,
                                      20,
                                      Appcolor().firstcolor,
                                      Appcolor().thirdcolor, () {
                                    if (snapshot.data ==
                                        ConnectivityResult.none) {
                                      controller.noin = false;
                                    } else {
                                      controller.checkinternet();
                                    }
                                    if (controller.noin == true) {
                                      controller.city = cites.text;
                                      controller.special = specialty.text;
                                      controller.getdata(context);
                                      specialty.clear();
                                      cites.clear();
                                    } else {
                                      Get.rawSnackbar(
                                          messageText: const Text(
                                              'قم بفحص الاتصال بالانترنت',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14)),
                                          isDismissible: false,
                                          duration: const Duration(seconds: 2),
                                          backgroundColor: Color(0xffff0000),
                                          icon: const Icon(
                                            Icons.wifi_off,
                                            color: Colors.white,
                                            size: 35,
                                          ),
                                          margin: EdgeInsets.zero,
                                          snackStyle: SnackStyle.GROUNDED);
                                    }
                                    //controller.getImage();
                                  }, 15),
                                ],
                              ),
                            ),
                          ),
                          // Container(
                          //   height: 150,
                          //   width: double.infinity,
                          //   child: ListView.builder(
                          //     scrollDirection: Axis.horizontal,
                          //     itemCount: addvertingmodel.length,
                          //     itemBuilder: (context, index) => Padding(
                          //       padding:
                          //           const EdgeInsets.only(left: 10, top: 10),
                          //       child: InkWell(
                          //           onTap: () {
                          //             showDialog(
                          //                 context: context,
                          //                 builder:
                          //                     (BuildContext context) {
                          //                   return Dialog(
                          //                     shape:
                          //                         RoundedRectangleBorder(
                          //                             borderRadius:
                          //                                 BorderRadius
                          //                                     .circular(
                          //                                         40)),
                          //                     child: Stack(
                          //                         alignment: Alignment.bottomCenter,
                          //                         clipBehavior: Clip.none,
                          //                         children: [
                          //                           ClipRRect(
                          //                             child: Image(image: AssetImage(addvertingmodel[index].image!),fit: BoxFit.cover),
                          //                             borderRadius:
                          //                                 BorderRadius
                          //                                     .circular(
                          //                                         40),
                          //                           ),
                          //                           Positioned(
                          //                             child: Row(
                          //                               children: [
                          //                                 InkWell(
                          //
                          //                                   child: CircleAvatar(
                          //                                     backgroundColor:
                          //                                         Colors.green,
                          //                                     child: Icon(
                          //                                         Icons.call),
                          //                                   ),
                          //                                   onTap: () {
                          //                                     launch('tel:${addvertingmodel[index].phone}');
                          //                                   },
                          //                                 ),
                          //                                 Gap(20),
                          //                                 InkWell(
                          //                                   child: Icon(
                          //                                       Icons.facebook,color: Colors.blueAccent,size: 45),
                          //                                   onTap: () {
                          //                                     launch('${addvertingmodel[index].whatsapp}');
                          //                                   },
                          //                                 ),
                          //
                          //                               ],
                          //                             ),
                          //                             bottom: -50,
                          //                           )
                          //                         ]),
                          //                   );
                          //                 });
                          //
                          //
                          //             // Get.to(AdvertisingScreen());
                          //           },
                          //           child: ClipRRect(
                          //             borderRadius: BorderRadius.circular(20),
                          //             child: Image(
                          //                 image: AssetImage(
                          //                     'images/doctorsadd.jpg')
                          //
                          //             ),
                          //           )),
                          //     ),
                          //   ),
                          // )
                        ],
                      ),
                    );
              }),
        ),
      );
    });