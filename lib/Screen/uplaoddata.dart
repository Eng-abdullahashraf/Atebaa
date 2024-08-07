
import 'package:atebaa/component/component.dart';
import 'package:atebaa/controller/homecontroller.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../constant/Apptextfield.dart';
import '../theme/colors.dart';
class Uploaddata extends StatelessWidget {
   Uploaddata({super.key});

  TextEditingController name = TextEditingController();
   TextEditingController add = TextEditingController();
   TextEditingController city = TextEditingController();
   TextEditingController phone = TextEditingController();
   TextEditingController special = TextEditingController();
   TextEditingController gender = TextEditingController();
   TextEditingController doc = TextEditingController();

   //...................................................
   TextEditingController enwan=TextEditingController();
   TextEditingController metwaa=TextEditingController();
   //.......................................................

   TextEditingController type=TextEditingController();

   TextEditingController namepharm=TextEditingController();
   TextEditingController addressph=TextEditingController();
   TextEditingController delevery=TextEditingController();
   TextEditingController phoneph=TextEditingController();
   TextEditingController time=TextEditingController();
   TextEditingController whatsapp=TextEditingController();









   @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(children: [
              textFormApp('doc', doc,TextInputType.text),
              SizedBox(height: 10,),
              textFormApp('name', name,TextInputType.text),
              SizedBox(height: 10,),
              textFormApp('address', add,TextInputType.text),
              SizedBox(height: 10,),
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
                  textEditingController: city,
                  title: 'اختر مدينتك',
                  hint: 'مدينتك',
                  isCitySelected: true),
              SizedBox(height: 10,),
              textFormApp('phone', phone,TextInputType.number),
              SizedBox(height: 10,),
              AppTextField(
                  dataList: [
                    SelectedListItem(name: 'ذكر'),
                    SelectedListItem(name: 'انثي'),
                  ],
                  textEditingController: gender,
                  title: 'اختر نوع البني ادم',
                  hint: 'النوع',
                  isCitySelected: true),
              SizedBox(height: 10,),

              AppTextField(
                  dataList: [

                    SelectedListItem(name: 'الكل'),
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
                  textEditingController: special,
                  title: 'اختر تخصص الدكتور',
                  hint: 'التخصص',
                  isCitySelected: true),
              GetBuilder<homecontroller>(
                  init: homecontroller(),
                  builder: (controller) {
                    return  MaterialButton(onPressed: (){
                      controller.uploaddatatofirestor(name.text, add.text, phone.text, special.text, city.text, gender.text,doc.text);
                      name.clear();
                      add.clear();
                      city.clear();
                      phone.clear();
                      gender.clear();
                      special.clear();
                      doc.clear();
                    },child: Text('add',style: TextStyle(fontSize: 35),),color: Appcolor().thirdcolor);

                  },),

              AppTextField(
                  dataList: [
                    SelectedListItem(name: 'أية اليوم'),
                    SelectedListItem(name: 'حديث اليوم'),
                    SelectedListItem(name: 'النصيحة اليومية'),
                    SelectedListItem(name: 'المقالة اليومية'),
                  ],
                  textEditingController: enwan,
                  title: 'اختر مدينتك',
                  hint: 'مدينتك',
                  isCitySelected: true),
              textFormApp('محتوى', metwaa,TextInputType.text),
              GetBuilder<homecontroller>(
                init: homecontroller(),
                builder: (controller) {
                  return  MaterialButton(onPressed: (){
                    controller.uploaddatatofirestors(enwan.text, metwaa.text);
                    enwan.clear();
                    metwaa.clear();

                  },child: Text('add',style: TextStyle(fontSize: 35),),color: Appcolor().thirdcolor);

                },),

              Gap(25),
              AppTextField(
                  dataList: [
                    SelectedListItem(name: 'laboratory'),
                    SelectedListItem(name: 'pharmacy'),
                    SelectedListItem(name: 'Radio'),
                  ],
                  textEditingController: type,
                  title: 'اختر مدينتك',
                  hint: 'مدينتك',
                  isCitySelected: true),
              GetBuilder<homecontroller>(
                init: homecontroller(),
                builder: (controller) {
                  return  Container(
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
                      ));
                },),
              textFormApp('doc', doc,TextInputType.text),
              SizedBox(height: 10,),
              textFormApp('name', namepharm,TextInputType.text),
              textFormApp('address', addressph,TextInputType.text),
              textFormApp('time', time,TextInputType.text),
              textFormApp('delevery', delevery,TextInputType.text),
              textFormApp('phone', phoneph,TextInputType.number),
              textFormApp('whatsapp', whatsapp,TextInputType.number),

              GetBuilder<homecontroller>(
                init: homecontroller(),
                builder: (controller) {
                  return  MaterialButton(onPressed: (){
                    controller.uploaddatafirestors(namepharm.text,addressph.text,controller.dropvalue,delevery.text,phoneph.text,time.text,whatsapp.text,doc.text,type.text);
                    namepharm.clear();
                    addressph.clear();
                    time.clear();
                    delevery.clear();
                    phoneph.clear();
                    whatsapp.clear();

                  },child: Text('add',style: TextStyle(fontSize: 35),),color: Appcolor().thirdcolor);

                },),





            ]),
          ),
        ),
      ),
    );
  }
}
