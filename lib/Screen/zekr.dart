import 'package:atebaa/controller/homecontroller.dart';
import 'package:atebaa/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Zekr extends StatelessWidget {
  const Zekr({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<homecontroller>(
          init: homecontroller(),
          builder: (controller) => Scaffold(
                body: Column(
                  children: [
                    Container(width: 500,
                        color: Appcolor().firstcolor,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MaterialButton(
                              onPressed: () {
                                controller.changezekrdata(0);
                              },
                              child: Text(" آياتٌ الشِّفاءُ",style: TextStyle(color: Appcolor().thirdcolor,fontSize: 30),
                              ),)
                            ,
                            Container(color: Colors.white,child: SizedBox(width: 1,height: 30,)),
                            //  Divider(,color: Colors.black,thickness: 20),
                            // SizedBox(width: 2,),
                            MaterialButton(
                              onPressed: () {
                                controller.changezekrdata(1);
                              },
                              child: Text(" أدْعِيَّةٌ الشِّفاءُ",style: TextStyle(color: Appcolor().thirdcolor,fontSize: 30)),)
                          ],
                        )
                    ),
                    SingleChildScrollView(
                      child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                        SizedBox(height: 20,),
                        Column(
                          children: [
                            Container(
                              height: 1000,
                              child: controller.zekrScreens[controller.zekrnmuber!],
                            ),
                          ],
                        ),
                      ]),
                    ),
                  ],
                ),
              )),
    );
  }
}
