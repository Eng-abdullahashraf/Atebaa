//
// import 'package:flutter/cupertino.dart';
//
// Widget s()=> Padding(
//     padding: const EdgeInsets.only(bottom: 8),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.end,
//       children: [
//         Container(
//           decoration: BoxDecoration(
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black
//                       .withOpacity(0.1), // Shadow color
//                   offset: Offset(1,
//                       2), // Shadow position (horizontal and vertical offset)
//                   blurRadius: 2, // Shadow blur radius
//                   spreadRadius: 1, // Shadow spread radius
//                 ),
//               ],
//               color: Appcolor().firstcolor,
//               borderRadius: BorderRadius.only(
//                   bottomRight: Radius.circular(25),
//                   bottomLeft: Radius.circular(25))),
//           width: MediaQuery.of(context).size.width,
//           child: Padding(
//             padding: const EdgeInsets.all(10),
//             child: Text(
//               'أطباء',
//               style: TextStyle(
//                   color: Appcolor().thirdcolor,
//                   fontFamily: 'ElMessiri-Bold',
//                   fontSize: 24),
//               textAlign: TextAlign.center,
//             ),
//           ),
//         ),
//         Expanded(
//           child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment:
//                   CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(top: 10),
//                   child: Container(
//                       width: double.infinity,
//                       height: 170,
//                       child: FlutterCarousel(
//                           items: controller.gene(context),
//                           options: CarouselOptions(
//                             // height: 170,
//                             enlargeCenterPage: true,
//                             initialPage: 0,
//                             autoPlayInterval:
//                                 Duration(seconds: 3),
//                             scrollDirection:
//                                 Axis.horizontal,
//                             autoPlay: true,
//                             viewportFraction: 1.0,
//                             autoPlayCurve:
//                                 Curves.fastOutSlowIn,
//                             autoPlayAnimationDuration:
//                                 Duration(seconds: 2),
//                             showIndicator: false,
//                             enableInfiniteScroll: true,
//                           ))),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(
//                       right: 15, left: 15, top: 15),
//                   child: Text(
//                     'ابحث عن دكتورك',
//                     textAlign: TextAlign.start,
//                     style: TextStyle(
//                         color: Appcolor().firstcolor,
//                         fontFamily: 'ElMessiri-Bold',
//                         fontSize: 16,
//                         fontWeight: FontWeight.w700,
//                         fontStyle: FontStyle.normal,
//                         letterSpacing: -0.3),
//                   ),
//                 ),
//                 Gap(10),
//                 Padding(
//                   padding: const EdgeInsets.only(
//                       right: 15, left: 15, bottom: 5),
//                   child: Container(
//                     height: 160,
//                     width: double.infinity,
//                     child: Row(
//                       crossAxisAlignment:
//                           CrossAxisAlignment.center,
//                       mainAxisAlignment:
//                           MainAxisAlignment.center,
//                       children: [
//                         Expanded(
//                           child: Container(
//                             child: Column(
//                               children: [
//                                 AppTextField(
//                                     dataList: [
//                                       SelectedListItem(
//                                           name:
//                                               'كل المدن'),
//                                       SelectedListItem(
//                                           name:
//                                               'المنصورة'),
//                                       SelectedListItem(
//                                           name:
//                                               'المنزلة'),
//                                       SelectedListItem(
//                                           name:
//                                               'البصراط'),
//                                       SelectedListItem(
//                                           name:
//                                               'الجمالية'),
//                                       SelectedListItem(
//                                           name:
//                                               'المطرية'),
//                                       SelectedListItem(
//                                           name: 'دكرنس'),
//                                       SelectedListItem(
//                                           name: 'الرياض'),
//                                       SelectedListItem(
//                                           name: 'الكردي'),
//                                       SelectedListItem(
//                                           name:
//                                               'منية النصر'),
//                                       SelectedListItem(
//                                           name:
//                                               'ميت سلسيل'),
//                                     ],
//                                     textEditingController:
//                                         cites,
//                                     title: 'اختر مدينة',
//                                     hint: 'المدينه',
//                                     isCitySelected: true),
//                                 AppTextField(
//                                     dataList: [
//                                       SelectedListItem(
//                                           name:
//                                               'كل التخصصات'),
//                                       SelectedListItem(
//                                           name: 'جلديه'),
//                                       SelectedListItem(
//                                           name: 'اسنان'),
//                                       SelectedListItem(
//                                           name: 'نفسي'),
//                                       SelectedListItem(
//                                           name:
//                                               'اطفال وحديثي الولادة'),
//                                       SelectedListItem(
//                                           name:
//                                               'مخ واعصاب'),
//                                       SelectedListItem(
//                                           name: 'عظام'),
//                                       SelectedListItem(
//                                           name: 'عيون'),
//                                       SelectedListItem(
//                                           name:
//                                               'علاج طبيعي اصابات ملاعب'),
//                                       SelectedListItem(
//                                           name:
//                                               'نساء وتوليد'),
//                                       SelectedListItem(
//                                           name:
//                                               'انف واذن وحنجرة'),
//                                       SelectedListItem(
//                                           name:
//                                               'قلب واوعية دموية'),
//                                       SelectedListItem(
//                                           name:
//                                               'امراض الدم'),
//                                       SelectedListItem(
//                                           name: 'اورام'),
//                                       SelectedListItem(
//                                           name: 'باطنة'),
//                                       SelectedListItem(
//                                           name:
//                                               'تخسيس وتغذية'),
//                                       SelectedListItem(
//                                           name:
//                                               'جراحة اطفال'),
//                                       SelectedListItem(
//                                           name:
//                                               'جراحة أورام'),
//                                       SelectedListItem(
//                                           name:
//                                               'جراحة أوعية دموية'),
//                                       SelectedListItem(
//                                           name:
//                                               'جراحة تجميل'),
//                                       SelectedListItem(
//                                           name:
//                                               'جراحة سمنة ومناظير'),
//                                       SelectedListItem(
//                                           name:
//                                               'جراحة عامة'),
//                                       SelectedListItem(
//                                           name:
//                                               'جراحة عمود فقرى'),
//                                       SelectedListItem(
//                                           name:
//                                               'جراحة قلب وصدر'),
//                                       SelectedListItem(
//                                           name:
//                                               'جراحة مخ وأعصاب'),
//                                       SelectedListItem(
//                                           name:
//                                               'جهاز هضمي ومناظير'),
//                                       SelectedListItem(
//                                           name:
//                                               'حساسية ومناعة'),
//                                       SelectedListItem(
//                                           name:
//                                               'ذكورة وعقم'),
//                                       SelectedListItem(
//                                           name:
//                                               'سكر وغدد صماء'),
//                                       SelectedListItem(
//                                           name: 'سمعيات'),
//                                       SelectedListItem(
//                                           name:
//                                               'صدر وجهاز تنفسي'),
//                                       SelectedListItem(
//                                           name:
//                                               'طب الأسرة'),
//                                       SelectedListItem(
//                                           name:
//                                               'روماتيزم'),
//                                       SelectedListItem(
//                                           name: 'كبد'),
//                                       SelectedListItem(
//                                           name: 'كلى'),
//                                       SelectedListItem(
//                                           name:
//                                               'مسالك بولية'),
//                                       SelectedListItem(
//                                           name:
//                                               'نطق وتخاطب'),
//                                     ],
//                                     textEditingController:
//                                         specialty,
//                                     title: 'اختر تخصص',
//                                     hint: 'التخصص',
//                                     isCitySelected: true),
//                               ],
//                             ),
//                           ),
//                         ),
//                         Gap(15),
//                         buttons(
//                             'بحث',
//                             100,
//                             20,
//                             24,
//                             Appcolor().firstcolor,
//                             Appcolor().thirdcolor, () {
//                           //controller.getdataapi();
//                           if (snapshot.data ==
//                               ConnectivityResult.none) {
//                             controller.noin = false;
//                           } else {
//                             controller.checkinternet();
//                           }
//                           if (controller.noin == true) {
//                             controller.city = cites.text;
//                             controller.special =
//                                 specialty.text;
//                             controller.getdata(context);
//                             controller.showAppAdd();
//                             controller.loaded();
//                           } else {
//                             Get.rawSnackbar(
//                                 messageText: const Text(
//                                     'قم بفحص الاتصال بالانترنت',
//                                     style: TextStyle(
//                                         color:
//                                             Colors.white,
//                                         fontSize: 14)),
//                                 isDismissible: false,
//                                 duration: const Duration(
//                                     seconds: 2),
//                                 backgroundColor:
//                                     Color(0xffff0000),
//                                 icon: const Icon(
//                                   Icons.wifi_off,
//                                   color: Colors.white,
//                                   size: 35,
//                                 ),
//                                 margin: EdgeInsets.zero,
//                                 snackStyle:
//                                     SnackStyle.GROUNDED);
//                           }
//                         }, 15),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(
//                       right: 15, left: 15, top: 0),
//                   child: Text(
//                     'الاقسام',
//                     textAlign: TextAlign.start,
//                     style: TextStyle(
//                         color: Appcolor().firstcolor,
//                         fontFamily: 'ElMessiri-Bold',
//                         fontSize: 16,
//                         fontWeight: FontWeight.w700,
//                         fontStyle: FontStyle.normal,
//                         letterSpacing: -0.3),
//                   ),
//                 ),
//                 Container(
//                     width: double.infinity,
//                     child: Column(
//                       crossAxisAlignment:
//                           CrossAxisAlignment.center,
//                       mainAxisAlignment:
//                           MainAxisAlignment.center,
//                       children: [
//                         SingleChildScrollView(
//                           scrollDirection:
//                               Axis.horizontal,
//                           child: Row(
//                             mainAxisAlignment:
//                                 MainAxisAlignment.center,
//                             crossAxisAlignment:
//                                 CrossAxisAlignment.center,
//                             children: [
//                               InkWell(
//                                   onTap: () {
//                                     Get.to(
//                                         PharmacyPage());
//                                   },
//                                   child: departmentContainer(
//                                       'صيدليات',
//                                       'images/pharmacytab.jpg',
//                                       Colors.white,
//                                       context)),
//                               Gap(8),
//                               InkWell(
//                                   onTap: () {
//                                     Get.to(
//                                         RadiologyPage());
//                                   },
//                                   child: departmentContainer(
//                                       'مراكز',
//                                       'images/radiology.jpg',
//                                       Colors.white,
//                                       context)),
//                               Gap(8),
//                             ],
//                           ),
//                         ),
//                         Gap(15),
//                         SingleChildScrollView(
//                           scrollDirection:
//                               Axis.horizontal,
//                           child: Row(
//                             mainAxisAlignment:
//                                 MainAxisAlignment.center,
//                             crossAxisAlignment:
//                                 CrossAxisAlignment.center,
//                             children: [
//                               InkWell(
//                                   onTap: () {
//                                     Get.to(Laboratory());
//                                   },
//                                   child: departmentContainer(
//                                       'معامل',
//                                       'images/laboratory.png',
//                                       Colors.white,
//                                       context)),
//                               Gap(8),
//                               departmentContainer(
//                                   'خدمات تمريض',
//                                   'images/nursingback.jpg',
//                                   Colors.white,
//                                   context),
//                             ],
//                           ),
//                         )
//                       ],
//                     )),
//                 Padding(
//                   padding: const EdgeInsets.only(
//                       right: 15, left: 15, top: 15),
//                   child: Row(
//                     mainAxisAlignment:
//                         MainAxisAlignment.spaceEvenly,
//                     children: [
//                       Text(
//                         'خدمات التمريض',
//                         textAlign: TextAlign.start,
//                         style: TextStyle(
//                             color: Appcolor().firstcolor,
//                             fontFamily: 'ElMessiri-Bold',
//                             fontSize: 16,
//                             fontWeight: FontWeight.w700,
//                             fontStyle: FontStyle.normal,
//                             letterSpacing: -0.3),
//                       ),
//                       Expanded(child: SizedBox()),
//                       Text(
//                         'عرض الكل',
//                         textAlign: TextAlign.start,
//                         style: TextStyle(
//                             color: Colors.blueAccent,
//                             fontFamily: 'ElMessiri-Bold',
//                             fontSize: 12,
//                             fontWeight: FontWeight.w700,
//                             fontStyle: FontStyle.normal,
//                             letterSpacing: -0.3),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   height: 175,
//                   margin: EdgeInsets.all(20),
//                   width: double.infinity,
//                   child: ListView.separated(
//                       scrollDirection: Axis.horizontal,
//                       itemBuilder: (context, index) =>
//                           nursingContainer(),
//                       separatorBuilder:
//                           (context, index) => Gap(8),
//                       itemCount: 5),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(
//                       right: 15, left: 15, top: 15),
//                   child: Row(
//                     mainAxisAlignment:
//                         MainAxisAlignment.spaceEvenly,
//                     children: [
//                       Text(
//                         'صيدليات',
//                         textAlign: TextAlign.start,
//                         style: TextStyle(
//                             color: Appcolor().firstcolor,
//                             fontFamily: 'ElMessiri-Bold',
//                             fontSize: 16,
//                             fontWeight: FontWeight.w700,
//                             fontStyle: FontStyle.normal,
//                             letterSpacing: -0.3),
//                       ),
//                       Expanded(child: SizedBox()),
//                       Text(
//                         'عرض الكل',
//                         textAlign: TextAlign.start,
//                         style: TextStyle(
//                             color: Colors.blueAccent,
//                             fontFamily: 'ElMessiri-Bold',
//                             fontSize: 12,
//                             fontWeight: FontWeight.w700,
//                             fontStyle: FontStyle.normal,
//                             letterSpacing: -0.3),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   height: 150,
//                   margin: EdgeInsets.all(20),
//                   width: double.infinity,
//                   child: ListView.separated(
//                       scrollDirection: Axis.horizontal,
//                       itemBuilder: (context, index) => pharmContainer(
//                           250,
//                           controller.pharmacydata![index]
//                               ["name"],
//                           controller.pharmacydata![index]
//                               ["address"],
//                           controller.pharmacydata![index]
//                               ["delevery"],
//                           controller.pharmacydata![index]
//                               ["phone"],
//                           controller.pharmacydata![index]
//                               ["time"],
//                           controller.pharmacydata![index]
//                               ["whatsapp"]),
//                       separatorBuilder:
//                           (context, index) => Gap(8),
//                       itemCount: controller
//                           .pharmacydata!.length),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(
//                       right: 15, left: 15, top: 15),
//                   child: Row(
//                     mainAxisAlignment:
//                         MainAxisAlignment.spaceEvenly,
//                     children: [
//                       Text(
//                         'معامل',
//                         textAlign: TextAlign.start,
//                         style: TextStyle(
//                             color: Appcolor().firstcolor,
//                             fontFamily: 'ElMessiri-Bold',
//                             fontSize: 16,
//                             fontWeight: FontWeight.w700,
//                             fontStyle: FontStyle.normal,
//                             letterSpacing: -0.3),
//                       ),
//                       Expanded(child: SizedBox()),
//                       Text(
//                         'عرض الكل',
//                         textAlign: TextAlign.start,
//                         style: TextStyle(
//                             color: Colors.blueAccent,
//                             fontFamily: 'ElMessiri-Bold',
//                             fontSize: 12,
//                             fontWeight: FontWeight.w700,
//                             fontStyle: FontStyle.normal,
//                             letterSpacing: -0.3),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   height: 150,
//                   margin: EdgeInsets.all(20),
//                   width: double.infinity,
//                   child: ListView.separated(
//                       scrollDirection: Axis.horizontal,
//                       itemBuilder: (context, index) => pharmContainer(
//                           250,
//                           controller.pharmacydata![index]
//                           ["name"],
//                           controller.pharmacydata![index]
//                           ["address"],
//                           controller.pharmacydata![index]
//                           ["delevery"],
//                           controller.pharmacydata![index]
//                           ["phone"],
//                           controller.pharmacydata![index]
//                           ["time"],
//                           controller.pharmacydata![index]
//                           ["whatsapp"]),
//
//                       separatorBuilder:
//                           (context, index) => Gap(8),
//                       itemCount: 1),
//                 ),
//                 Gap(5),
//               ],
//             ),
//           ),
//         ),
//
//         // Image(image: AssetImage('images/esm.png')),
//         // Gap(20),
//       ],
//     ),
//   );


import 'package:atebaa/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_animate/flutter_animate.dart';

Widget ss()=>Container(
    width: double.infinity,
    color: Appcolor().thirdcolor,
    child: Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: Center(
                  child: Text(
                    'atebaa',
                    style: TextStyle(
                      fontSize: 85,
                      color: Appcolor().firstcolor,
                      fontFamily: 'Bebas',
                      letterSpacing: 8,
                    ),
                  )
                      .animate()
                      .scale(duration: Duration(seconds: 2),curve: Curves.easeIn),
                )),
            Text(
              'Powered by TECS ',
              style: TextStyle(
                  fontSize: 15,
                  color: Appcolor().firstcolor,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    ));


//  pharmContainer(
// MediaQuery.of(context).size.width*.8,
// controller.pharmacydata![index]
// ["name"],
// controller.pharmacydata![index]
// ["address"],
// controller.pharmacydata![index]
// ["delevery"],
// controller.pharmacydata![index]
// ["phone"],
// controller.pharmacydata![index]
// ["time"],
// controller.pharmacydata![index]
// ["whatsapp"]),
