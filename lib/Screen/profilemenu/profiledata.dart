import 'package:atebaa/component/component.dart';
import 'package:atebaa/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import '../../component/second component.dart';

class ProfileData extends StatelessWidget {
  ProfileData({super.key});

  TextEditingController name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
            IconButton(onPressed: () {Get.back();}, icon: Icon(Icons.arrow_forward_rounded)),
            Gap(20),
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(150),
                child:
                    Image(image: AssetImage('images/pngegg.png'), width: 150),
              ),
            ),
            Gap(8),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Container(
                  height: 60,
                  child: textInputform(
                      IconColor: Appcolor().firstcolor,
                      FillColor: Colors.white,
                      PrefIcon: Icon(Icons.person),
                      LableText: 'الاسم الشخصي',
                      HintText: 'محمد كامل ابو مسعد',
                      Scure: false,
                      radius: 10,
                      controller: name)),
            ),
            Gap(8),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Container(
                  height: 60,
                  child: textInputform(
                      IconColor: Appcolor().firstcolor,
                      FillColor: Colors.white,
                      PrefIcon: Icon(Icons.location_on_outlined),
                      LableText: 'العنوان',
                      HintText: 'العنوان تفصيلي',
                      Scure: false,
                      radius: 10,
                      controller: name)),
            ),
            Gap(8),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Container(
                height: 60,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(0.0),
                      child: Icon(
                        Icons.phone_enabled,
                        color: Appcolor().firstcolor,
                      ),
                    ),
                    hintText: 'رقم الهاتف',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
            ),

            Gap(8),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Container(
                  height: 60,
                  child: textInputform(
                      IconColor: Appcolor().firstcolor,
                      FillColor: Colors.white,
                      PrefIcon: Icon(Icons.folder_special),
                      LableText: 'التخصص',
                      HintText: 'باطنه',
                      Scure: false,
                      radius: 10,
                      controller: name)),
            ),
            Gap(8),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Container(
                  height: 60,
                  child: textInputform(
                      IconColor: Appcolor().firstcolor,
                      FillColor: Colors.white,
                      PrefIcon: Icon(Icons.location_on_outlined),
                      LableText: 'المحافظة',
                      HintText: 'المحافظة',
                      Scure: false,
                      radius: 10,
                      controller: name)),
            ),
            Gap(8),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Container(
                  height: 60,
                  child: textInputform(
                      IconColor: Appcolor().firstcolor,
                      FillColor: Colors.white,
                      PrefIcon: Icon(Icons.location_on_outlined),
                      LableText: 'المدينة',
                      HintText: 'المدينة',
                      Scure: false,
                      radius: 10,
                      controller: name)),
            ),
            Gap(12),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: buttons('حفظ', 50, double.infinity, 24, Appcolor().firstcolor, Colors.white, () { }, 24),
            )
          ]),
        ),
      ),
    );
  }
}
