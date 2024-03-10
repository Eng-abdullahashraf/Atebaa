import 'dart:io';

import 'package:atebaa/Screen/Homescreen.dart';
import 'package:atebaa/controller/homecontroller.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:atebaa/theme/colors.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class FirstScreen extends StatelessWidget {
  FirstScreen({Key? key}) : super(key: key);

  TextEditingController cites = TextEditingController();
  TextEditingController specialty = TextEditingController();
  int? screennum;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<homecontroller>(
        init: homecontroller(),
        builder: (controller) {
          return Scaffold(
            // bottomNavigationBar: CurvedNavigationBar(
            //     height: 50,
            //     backgroundColor: Appcolor().secondcolor,
            //     color: Appcolor().firstcolor,
            //     onTap: (value) {
            //       controller.changeScreen(value);
            //     },
            //     items: [
            //       Icon(
            //         Icons.home,
            //         color: Appcolor().thirdcolor,
            //       ),
            //       Icon(
            //         Icons.favorite,
            //         color: Appcolor().thirdcolor,
            //       ),
            //       Image.asset('images/handpray.png',
            //           color: Colors.white, width: 30),
            //       Icon(
            //         Icons.contact_page,
            //         color: Appcolor().thirdcolor,
            //       ),
            //     ]),
            floatingActionButton: FloatingActionButton(
                onPressed: (){
                  Get.to(Homescreen());
                  //controller.changeScreen(4);
                },child: Icon(Icons.login,color: Colors.white),shape: CircleBorder(),mini: true,backgroundColor: Appcolor().firstcolor,),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: BottomAppBar(

              height: 60,
              color: Colors.white,
              shape: CircularNotchedRectangle(),
              notchMargin: 5,
              child: Container(
                height: 60,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Row(children: [
                        Expanded(child: IconButton(onPressed: () {controller.changeScreen(0);}, icon: Icon(Icons.home,size: 30,color: controller.screennum==0? Appcolor().firstcolor:Colors.black45,))),
                        Expanded(child: IconButton(onPressed: () {controller.changeScreen(1);}, icon: Icon(Icons.favorite,size: 30,color: controller.screennum==1? Appcolor().firstcolor:Colors.black45,)))

                      ]),
                    ),
                    Expanded(
                      child: Row(children: [
                        Expanded(child: InkWell(onTap: () {controller.changeScreen(2);},child: Image.asset('images/handpray.png', color: controller.screennum==2? Appcolor().firstcolor:Colors.black45, width: 30)),),
                        Expanded(child: IconButton(onPressed: () {controller.changeScreen(3);}, icon: Icon(Icons.info,size: 30,color: controller.screennum==3? Appcolor().firstcolor:Colors.black45,)))

                      ]),
                    ),

                  ],
                ),
              ),

            ),
            body: GetBuilder<homecontroller>(
              init: homecontroller(),
              builder: (controller) => Column(
                children: [
                  Expanded(
                    child: Container(
                        color: Appcolor().secondcolor,
                        child: controller.Screennav[controller.screennum!]),
                  ),
                  controller.isloaded
                      ? SizedBox(
                          width: controller.bannerAd!.size.width.toDouble(),
                          height: controller.bannerAd!.size.height.toDouble(),
                          child: AdWidget(ad: controller.bannerAd!),
                        )
                      : SizedBox(),
                ],
              ),
            ),
          );
        });
  }
}
//
//
// bottomNavigationBar: CurvedNavigationBar(
// height: 50,
// backgroundColor: Appcolor().secondcolor,
// color: Appcolor().firstcolor,
// onTap: (value) {
// controller.changeScreen(value);
// },
// items: [
// Icon(
// Icons.home,
// color: Appcolor().thirdcolor,
// ),
// Icon(
// Icons.favorite,
// color: Appcolor().thirdcolor,
// ),
// Image.asset('images/handpray.png',
// color: Colors.white, width: 30),
// Icon(
// Icons.contact_page,
// color: Appcolor().thirdcolor,
// ),
// ]),
