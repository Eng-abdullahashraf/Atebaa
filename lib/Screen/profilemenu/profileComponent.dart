

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../component/component.dart';
import '../../component/second component.dart';
import '../../theme/colors.dart';

Widget Social(name)=>Container(
  child: SingleChildScrollView(
    child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Gap(15),
          Text('وسائل التواصل الاجتماعى',style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontFamily: 'ElMessiri-Bold')),
          Gap(13),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Container(
                height: 60,
                child: textInputform(
                    IconColor: Appcolor().firstcolor,
                    FillColor: Colors.white,
                    PrefIcon: Icon(Icons.facebook),
                    LableText: 'رابط حساب فيس بوك',
                    HintText: 'رابط حساب فيس بوك',
                    Scure: false,
                    radius: 10,
                    controller: name)),
          ),
          Gap(13),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Container(
                height: 60,
                child: textInputform(
                    IconColor: Appcolor().firstcolor,
                    FillColor: Colors.white,
                    PrefIcon: Icon(Icons.phone),
                    LableText: 'رقم واتس اب',
                    HintText: 'رقم واتس اب',
                    Scure: false,
                    radius: 10,
                    controller: name)),
          ),
          Gap(13),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Container(
                height: 60,
                child: textInputform(
                    IconColor: Appcolor().firstcolor,
                    FillColor: Colors.white,
                    PrefIcon: Icon(Icons.folder_special),
                    LableText: 'رابط حساب انستجرام',
                    HintText: 'رابط حساب انستجرام',
                    Scure: false,
                    radius: 10,
                    controller: name)),
          ),
          Gap(13),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: buttons('حفظ', 50, double.infinity, 24, Appcolor().firstcolor, Colors.white, () { }, 24),
          ),
          Gap(13),

        ]),
  ),
);

Widget changePass(name)=>Container(
  child: SingleChildScrollView(
    child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Gap(13),
          Text('تغيير كلمة السر',style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontFamily: 'ElMessiri-Bold')),
          Gap(13),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Container(
                height: 60,
                child: textInputform(
                    IconColor: Appcolor().firstcolor,
                    FillColor: Colors.white,
                    PrefIcon: Icon(Icons.password),
                    LableText: 'كلمة السر القديمة',
                    HintText: '*********',
                    Scure: true,
                    radius: 10,
                    controller: name)),
          ),
          Gap(13),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Container(
                height: 60,
                child: textInputform(
                    IconColor: Appcolor().firstcolor,
                    FillColor: Colors.white,
                    PrefIcon: Icon(Icons.password),
                    LableText: 'كلمة السر الجديدة',
                    HintText: '*********',
                    Scure: true,
                    radius: 10,
                    controller: name)),
          ),
          Gap(13),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Container(
                height: 60,
                child: textInputform(
                    IconColor: Appcolor().firstcolor,
                    FillColor: Colors.white,
                    PrefIcon: Icon(Icons.password),
                    LableText: 'تاكيد كلمة السر الجديدة',
                    HintText: '*********',
                    Scure: true,
                    radius: 10,
                    controller: name)),
          ),
          Gap(13),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: buttons('حفظ', 50, double.infinity, 24, Appcolor().firstcolor, Colors.white, () { }, 24),
          ),
          Gap(13),

        ]),
  ),
);