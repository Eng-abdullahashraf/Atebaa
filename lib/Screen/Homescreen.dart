import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/Apptextfield.dart';
import '../component/component.dart';
import '../controller/homecontroller.dart';
import '../theme/colors.dart';

class Homescreen extends StatelessWidget {
  Homescreen({super.key});

  TextEditingController cites = TextEditingController();
  TextEditingController specialty = TextEditingController();
//
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: StreamBuilder<ConnectivityResult>(
          stream: Connectivity().onConnectivityChanged,
          builder: (context,snapshot){
            return Scaffold(
              backgroundColor: Appcolor().secondcolor,
              body: GetBuilder<homecontroller>(
                  init: homecontroller(),
                  builder: (controller) {
                    controller.checkinternet();
                    return Padding(
                      padding: const EdgeInsets.all(25),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Padding(
                              padding: const EdgeInsets.only(top: 50,bottom: 0),
                              child: Image(
                                height: 165,
                                width: 180,
                                image: AssetImage('images/atebaa.png'),
                                //color: Appcolor().firstcolor,
                              ),
                            ),
                            Text('atebaa',style: TextStyle(fontSize: 60,color: Appcolor().firstcolor,fontFamily: 'Bebas',fontWeight: FontWeight.bold,letterSpacing: 5),),


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
                    );
                  }


              ),
            );
          })
    );
  }
}
