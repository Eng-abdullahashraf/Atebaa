import 'package:animated_conditional_builder/animated_conditional_builder.dart';
import 'package:atebaa/Screen/Advertisingscreen.dart';
import 'package:atebaa/Screen/tabbedscreens/laboratory.dart';
import 'package:atebaa/Screen/tabbedscreens/nursingpage.dart';
import 'package:atebaa/Screen/tabbedscreens/pharmacypage.dart';
import 'package:atebaa/Screen/tabbedscreens/radiologypage.dart';
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

// class SearchDoctors extends StatelessWidget {
//   const SearchDoctors({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: GetBuilder<homecontroller>(
//           init: homecontroller(),
//           builder: (controller) => AnimatedConditionalBuilder(
//               condition: controller.loaddatapharmacy!,
//               builder: (BuildContext context) => Container(child: Text('data'),),
//               fallback: (BuildContext context)=>Center(child: CircularProgressIndicator())
//           ),),
//     );
//   }
// }
Widget searchDoctors() => StreamBuilder<ConnectivityResult>(
    stream: Connectivity().onConnectivityChanged,
    builder: (context, snapshot) {
      return Container(
        color: Appcolor().firstcolor,
        child: SafeArea(
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
                      : Container(
                          child: controller.loaddatapharmacy!
                              ? Padding(
                                  padding: const EdgeInsets.only(bottom: 8),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black.withOpacity(
                                                    0.1), // Shadow color
                                                offset: Offset(1,
                                                    2), // Shadow position (horizontal and vertical offset)
                                                blurRadius:
                                                    2, // Shadow blur radius
                                                spreadRadius:
                                                    1, // Shadow spread radius
                                              ),
                                            ],
                                            color: Appcolor().firstcolor,
                                            borderRadius: BorderRadius.only(
                                                bottomRight:
                                                    Radius.circular(25),
                                                bottomLeft:
                                                    Radius.circular(25))),
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Text(
                                            'أطباء',
                                            style: TextStyle(
                                                color: Appcolor().thirdcolor,
                                                fontFamily: 'ElMessiri-Bold',
                                                fontSize: 24),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: SingleChildScrollView(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 15,
                                                    left: 15,
                                                    top: 15),
                                                child: Row(
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    Text(
                                                      'إعلان ',
                                                      textAlign: TextAlign.start,
                                                      style: TextStyle(
                                                          color:
                                                          Colors.grey[700],
                                                          fontFamily:
                                                          'ElMessiri-Bold',
                                                          fontSize: 12,
                                                          fontWeight:
                                                          FontWeight.w700,
                                                          fontStyle:
                                                          FontStyle.normal,
                                                          letterSpacing: -0.3),
                                                    ),
                                                    CircleAvatar(backgroundColor:Colors.grey[700] ,radius: 1.3,),
                                                    Text(
                                                      ' 4.9 ',
                                                      textAlign: TextAlign.start,
                                                      style: TextStyle(
                                                          color:
                                                          Colors.grey[600],
                                                          fontFamily:
                                                          'ElMessiri-Bold',
                                                          fontSize: 12,
                                                          fontWeight:
                                                          FontWeight.w700,
                                                          fontStyle:
                                                          FontStyle.normal,
                                                          letterSpacing: -0.3),
                                                    ),
                                                    Icon(Icons.star,color:
                                                    Colors.grey[600],size: 12,)
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 10),
                                                child: Container(
                                                    width: double.infinity,
                                                    height: 170,
                                                    child: FlutterCarousel(
                                                        items: controller
                                                            .gene(context),
                                                        options:
                                                            CarouselOptions(
                                                          // height: 170,
                                                          enlargeCenterPage:
                                                              true,
                                                          initialPage: 0,
                                                          autoPlayInterval:
                                                              Duration(
                                                                  seconds: 3),
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          autoPlay: true,
                                                          viewportFraction: 1.0,
                                                          autoPlayCurve: Curves
                                                              .fastOutSlowIn,
                                                          autoPlayAnimationDuration:
                                                              Duration(
                                                                  seconds: 2),
                                                          showIndicator: false,
                                                          enableInfiniteScroll:
                                                              true,
                                                        ))),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 15,
                                                    left: 15,
                                                    top: 15),
                                                child: Text(
                                                  'ابحث عن دكتورك',
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                      color:
                                                          Appcolor().firstcolor,
                                                      fontFamily:
                                                          'ElMessiri-Bold',
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      letterSpacing: -0.3),
                                                ),
                                              ),
                                              Gap(10),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 15,
                                                    left: 15,
                                                    bottom: 5),
                                                child: Container(
                                                  height: 160,
                                                  width: double.infinity,
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Expanded(
                                                        child: Container(
                                                          child: Column(
                                                            children: [
                                                              AppTextField(
                                                                  dataList: [
                                                                    SelectedListItem(
                                                                        name:
                                                                            'كل المدن'),
                                                                    SelectedListItem(
                                                                        name:
                                                                            'المنصورة'),
                                                                    SelectedListItem(
                                                                        name:
                                                                            'المنزلة'),
                                                                    SelectedListItem(
                                                                        name:
                                                                            'البصراط'),
                                                                    SelectedListItem(
                                                                        name:
                                                                            'الجمالية'),
                                                                    SelectedListItem(
                                                                        name:
                                                                            'المطرية'),
                                                                    SelectedListItem(
                                                                        name:
                                                                            'دكرنس'),
                                                                    SelectedListItem(
                                                                        name:
                                                                            'الرياض'),
                                                                    SelectedListItem(
                                                                        name:
                                                                            'الكردي'),
                                                                    SelectedListItem(
                                                                        name:
                                                                            'منية النصر'),
                                                                    SelectedListItem(
                                                                        name:
                                                                            'ميت سلسيل'),
                                                                  ],
                                                                  textEditingController:
                                                                      cites,
                                                                  title:
                                                                      'اختر مدينة',
                                                                  hint:
                                                                      'المدينه',
                                                                  isCitySelected:
                                                                      true),
                                                              AppTextField(
                                                                  dataList: [
                                                                    SelectedListItem(
                                                                        name:
                                                                            'كل التخصصات'),
                                                                    SelectedListItem(
                                                                        name:
                                                                            'جلديه'),
                                                                    SelectedListItem(
                                                                        name:
                                                                            'اسنان'),
                                                                    SelectedListItem(
                                                                        name:
                                                                            'نفسي'),
                                                                    SelectedListItem(
                                                                        name:
                                                                            'اطفال وحديثي الولادة'),
                                                                    SelectedListItem(
                                                                        name:
                                                                            'مخ واعصاب'),
                                                                    SelectedListItem(
                                                                        name:
                                                                            'عظام'),
                                                                    SelectedListItem(
                                                                        name:
                                                                            'عيون'),
                                                                    SelectedListItem(
                                                                        name:
                                                                            'علاج طبيعي اصابات ملاعب'),
                                                                    SelectedListItem(
                                                                        name:
                                                                            'نساء وتوليد'),
                                                                    SelectedListItem(
                                                                        name:
                                                                            'انف واذن وحنجرة'),
                                                                    SelectedListItem(
                                                                        name:
                                                                            'قلب واوعية دموية'),
                                                                    SelectedListItem(
                                                                        name:
                                                                            'امراض الدم'),
                                                                    SelectedListItem(
                                                                        name:
                                                                            'اورام'),
                                                                    SelectedListItem(
                                                                        name:
                                                                            'باطنة'),
                                                                    SelectedListItem(
                                                                        name:
                                                                            'تخسيس وتغذية'),
                                                                    SelectedListItem(
                                                                        name:
                                                                            'جراحة اطفال'),
                                                                    SelectedListItem(
                                                                        name:
                                                                            'جراحة أورام'),
                                                                    SelectedListItem(
                                                                        name:
                                                                            'جراحة أوعية دموية'),
                                                                    SelectedListItem(
                                                                        name:
                                                                            'جراحة تجميل'),
                                                                    SelectedListItem(
                                                                        name:
                                                                            'جراحة سمنة ومناظير'),
                                                                    SelectedListItem(
                                                                        name:
                                                                            'جراحة عامة'),
                                                                    SelectedListItem(
                                                                        name:
                                                                            'جراحة عمود فقرى'),
                                                                    SelectedListItem(
                                                                        name:
                                                                            'جراحة قلب وصدر'),
                                                                    SelectedListItem(
                                                                        name:
                                                                            'جراحة مخ وأعصاب'),
                                                                    SelectedListItem(
                                                                        name:
                                                                            'جهاز هضمي ومناظير'),
                                                                    SelectedListItem(
                                                                        name:
                                                                            'حساسية ومناعة'),
                                                                    SelectedListItem(
                                                                        name:
                                                                            'ذكورة وعقم'),
                                                                    SelectedListItem(
                                                                        name:
                                                                            'سكر وغدد صماء'),
                                                                    SelectedListItem(
                                                                        name:
                                                                            'سمعيات'),
                                                                    SelectedListItem(
                                                                        name:
                                                                            'صدر وجهاز تنفسي'),
                                                                    SelectedListItem(
                                                                        name:
                                                                            'طب الأسرة'),
                                                                    SelectedListItem(
                                                                        name:
                                                                            'روماتيزم'),
                                                                    SelectedListItem(
                                                                        name:
                                                                            'كبد'),
                                                                    SelectedListItem(
                                                                        name:
                                                                            'كلى'),
                                                                    SelectedListItem(
                                                                        name:
                                                                            'مسالك بولية'),
                                                                    SelectedListItem(
                                                                        name:
                                                                            'نطق وتخاطب'),
                                                                  ],
                                                                  textEditingController:
                                                                      specialty,
                                                                  title:
                                                                      'اختر تخصص',
                                                                  hint:
                                                                      'التخصص',
                                                                  isCitySelected:
                                                                      true),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Gap(15),
                                                      buttons(
                                                          'بحث',
                                                          100,
                                                          20,
                                                          24,
                                                          Appcolor().firstcolor,
                                                          Appcolor().thirdcolor,
                                                          () {
                                                        //controller.getdataapi();
                                                        if (snapshot.data ==
                                                            ConnectivityResult
                                                                .none) {
                                                          controller.noin =
                                                              false;
                                                        } else {
                                                          controller
                                                              .checkinternet();
                                                        }
                                                        if (controller.noin ==
                                                            true) {
                                                          controller.city =
                                                              cites.text;
                                                          controller.special =
                                                              specialty.text;
                                                          controller
                                                              .getdata(context);
                                                          controller
                                                              .showAppAdd();
                                                          controller.loaded();
                                                        } else {
                                                          Get.rawSnackbar(
                                                              messageText: const Text(
                                                                  'قم بفحص الاتصال بالانترنت',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          14)),
                                                              isDismissible:
                                                                  false,
                                                              duration: const Duration(
                                                                  seconds: 2),
                                                              backgroundColor:
                                                                  Color(
                                                                      0xffff0000),
                                                              icon: const Icon(
                                                                Icons.wifi_off,
                                                                color: Colors
                                                                    .white,
                                                                size: 35,
                                                              ),
                                                              margin: EdgeInsets
                                                                  .zero,
                                                              snackStyle:
                                                                  SnackStyle
                                                                      .GROUNDED);
                                                        }
                                                      }, 15),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 15,
                                                    left: 15,
                                                    top: 0),
                                                child: Text(
                                                  'الاقسام',
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                      color:
                                                          Appcolor().firstcolor,
                                                      fontFamily:
                                                          'ElMessiri-Bold',
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      letterSpacing: -0.3),
                                                ),
                                              ),
                                              Container(
                                                  width: double.infinity,
                                                  child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      SingleChildScrollView(
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            InkWell(
                                                                onTap: () {
                                                                  controller.dropvalue='اختر البلد';
                                                                  controller.name="";
                                                                  Get.to(PharmacyPage());
                                                                  controller.getPharmacyData();
                                                                  // controller.getLaboratoryData();
                                                                  // controller.getNursingData();
                                                                  // controller.getRadiologyData();
                                                                  // controller.getAdvertisingData();
                                                                },
                                                                child: departmentContainer(
                                                                    'صيدليات',
                                                                    'images/pharmacytab.jpg',
                                                                    Colors
                                                                        .white,
                                                                    context)),
                                                            Gap(8),
                                                            InkWell(
                                                                onTap: () {
                                                                  controller.dropvalue='اختر البلد';
                                                                  controller.name="";
                                                                  Get.to(
                                                                      RadiologyPage());
                                                                  // controller.getPharmacyData();
                                                                  // controller.getLaboratoryData();
                                                                  // controller.getNursingData();
                                                                   controller.getRadiologyData();
                                                                  // controller.getAdvertisingData();
                                                                },
                                                                child: departmentContainer(
                                                                    'مراكز',
                                                                    'images/radiology.jpg',
                                                                    Colors
                                                                        .white,
                                                                    context)),
                                                            Gap(8),
                                                          ],
                                                        ),
                                                      ),
                                                      Gap(15),
                                                      SingleChildScrollView(
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            InkWell(
                                                                onTap: () {
                                                                  controller.dropvalue='اختر البلد';

                                                                  controller.name="";
                                                                  Get.to(
                                                                      Laboratory());
                                                                  // controller.getPharmacyData();
                                                                  controller.getLaboratoryData();
                                                                  // controller.getNursingData();
                                                                  // controller.getRadiologyData();
                                                                  // controller.getAdvertisingData();
                                                                },
                                                                child: departmentContainer(
                                                                    'معامل',
                                                                    'images/laboratory.png',
                                                                    Colors
                                                                        .white,
                                                                    context)),
                                                            Gap(8),
                                                            InkWell(
                                                              onTap: () {
                                                                controller.dropvalue='اختر البلد';
                                                                controller.name="";
                                                                Get.to(Nursingpage());
                                                                // controller.getPharmacyData();
                                                                // controller.getLaboratoryData();
                                                                controller.getNursingData();
                                                                // controller.getRadiologyData();
                                                                // controller.getAdvertisingData();
                                                              },
                                                              child: departmentContainer(
                                                                  'خدمات تمريض',
                                                                  'images/nursingback.jpg',
                                                                  Colors.white,
                                                                  context),
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  )),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 15,
                                                    left: 15,
                                                    top: 15),
                                                child: Text(
                                                  'خدمات التمريض',
                                                  textAlign:
                                                      TextAlign.start,
                                                  style: TextStyle(
                                                      color: Appcolor()
                                                          .firstcolor,
                                                      fontFamily:
                                                          'ElMessiri-Bold',
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      letterSpacing: -0.3),
                                                ),
                                              ),
                                              Container(
                                                height: 185,
                                                margin: EdgeInsets.all(20),
                                                width: double.infinity,
                                                child: ListView.separated(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    itemBuilder:
                                                        (context, index) =>
                                                            nursingContainer(
                                                              '${controller.nursingdata![index]["name"]}',
                                                              controller.nursingdata![index]["phone"],
                                                                controller.nursingdata![index]["whatsapp"],
                                                                'العنوان / ${controller.nursingdata![index]["address"]}',
                                                                controller.nursingdata![index]["about"],
                                                              MediaQuery.of(context).size.width*.8
                                                            ),
                                                    separatorBuilder:
                                                        (context, index) =>
                                                            Gap(8),
                                                    itemCount: controller.nursingdata!.length),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 15,
                                                    left: 15,
                                                    top: 5),
                                                child: Text(
                                                  'صيدليات',
                                                  textAlign:
                                                      TextAlign.start,
                                                  style: TextStyle(
                                                      color: Appcolor()
                                                          .firstcolor,
                                                      fontFamily:
                                                          'ElMessiri-Bold',
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      letterSpacing: -0.3),
                                                ),
                                              ),
                                              Container(
                                                height: 190,
                                                margin: EdgeInsets.all(20),
                                                width: double.infinity,
                                                child: ListView.separated(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    itemBuilder: (context, index) => pharmContainer(
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            .8,
                                                        'صيدلية / ${controller.pharmacydata![index]["name"]}',
                                                        controller.pharmacydata![index]
                                                            ["address"],
                                                        controller.pharmacydata![index]
                                                            ["delevery"],
                                                        controller.pharmacydata![index]
                                                            ["phone"],
                                                        controller.pharmacydata![index]
                                                            ["city"],
                                                        controller
                                                                .pharmacydata![index]
                                                            ["whatsapp"],'images/pharmalogo.png'),
                                                    separatorBuilder:
                                                        (context, index) =>
                                                            Gap(8),
                                                    itemCount: controller.pharmacydata!.length < 5? controller.pharmacydata!.length : 5),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 15,
                                                    left: 15,
                                                    top: 15),
                                                child: Text(
                                                  'معامل',
                                                  textAlign:
                                                      TextAlign.start,
                                                  style: TextStyle(
                                                      color: Appcolor()
                                                          .firstcolor,
                                                      fontFamily:
                                                          'ElMessiri-Bold',
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      letterSpacing: -0.3),
                                                ),
                                              ),
                                              Container(
                                                height: 190,
                                                margin: EdgeInsets.all(20),
                                                width: double.infinity,
                                                child: ListView.separated(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    itemBuilder: (context, index) => pharmContainer(
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            .8,
                                                        'معمل / ${controller.laboratorydata![index]["name"]}',
                                                        controller.laboratorydata![index]
                                                            ["address"],
                                                        controller.laboratorydata![index]
                                                            ["delevery"],
                                                        controller.laboratorydata![index]
                                                            ["phone"],
                                                        controller.laboratorydata![index]
                                                            ["city"],
                                                        controller
                                                                .laboratorydata![index]
                                                            ["whatsapp"],'images/lab.png'),
                                                    separatorBuilder:
                                                        (context, index) =>
                                                            Gap(8),
                                                    itemCount: controller.laboratorydata!.length < 5? controller.laboratorydata!.length : 5),
                                              ),
                                              Gap(5),
                                            ],
                                          ),
                                        ),
                                      ),

                                      // Image(image: AssetImage('images/esm.png')),
                                      // Gap(20),
                                    ],
                                  ),
                                )
                              : Center(child: CircularProgressIndicator()),
                        );
                }),
          ),
        ),
      );
    });
