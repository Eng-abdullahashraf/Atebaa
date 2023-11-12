import 'package:atebaa/controller/homecontroller.dart';
import 'package:atebaa/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../component.dart';


class Doctors extends StatelessWidget {
   Doctors({Key? key}) : super(key: key);

  TextEditingController search=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: GetBuilder<homecontroller>(
        init: homecontroller(),
          builder: (controller)=>Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: Text("Atebaa",
                      style: TextStyle(
                          color: Appcolor().firstcolor,
                          fontSize: 35.5,
                          fontWeight: FontWeight.w400,
                          wordSpacing: 2))),
              Padding(
                padding: const EdgeInsets.only(top: 10,left: 10,right: 10),
                child: textwrite(Iconcolor: Appcolor().gray, Fillcolor: Appcolor().thirdcolor, PrefIcon: Icon(Icons.search), LableText: 'search', HintText: 'search', Scure: false, radius: 10, controller: search, form: TextInputType.text),
              ),
              SizedBox(height: 10,),
              Expanded(child: Container(child: ListView.separated(scrollDirection: Axis.vertical,itemBuilder: (context,i)=>doctorItem(), separatorBuilder: (context,i)=>SizedBox(height: 10), itemCount: 10))),
            ],
          ),),
    ));
  }
}
