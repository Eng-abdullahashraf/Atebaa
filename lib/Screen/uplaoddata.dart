
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




   @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(children: [

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
                    SelectedListItem(name: 'باطنة'),
                    SelectedListItem(name: 'عظام'),
                    SelectedListItem(name: 'اسنان'),
                    SelectedListItem(name: 'نساء'),
                  ],
                  textEditingController: special,
                  title: 'اختر تخصص الدكتور',
                  hint: 'التخصص',
                  isCitySelected: true),
              GetBuilder<homecontroller>(
                  init: homecontroller(),
                  builder: (controller) {
                    return  MaterialButton(onPressed: (){
                      controller.uploaddatatofirestor(name.text, add.text, phone.text, special.text, city.text, gender.text);
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
