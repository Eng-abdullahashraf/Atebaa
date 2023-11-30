
import 'package:atebaa/component.dart';
import 'package:atebaa/controller/homecontroller.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Apptextfield.dart';
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
                    SelectedListItem(name: 'المنزلة'),
                    SelectedListItem(name: 'البصراط'),
                    SelectedListItem(name: 'الجمالية'),
                    SelectedListItem(name: 'المطرية'),
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
                    SelectedListItem(name: 'تخسيس وتغئية'),
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
                    SelectedListItem(name: 'روماتيزم'),
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
                    },child: Text('add',style: TextStyle(fontSize: 35),),color: Appcolor().firstcolor);

                  },),


            ]),
          ),
        ),
      ),
    );
  }
}
