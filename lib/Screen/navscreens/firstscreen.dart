import 'dart:io';

import 'package:atebaa/Screen/navscreens/Homescreen.dart';
import 'package:atebaa/Screen/navscreens/profilescreen.dart';
import 'package:atebaa/controller/homecontroller.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:atebaa/theme/colors.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../LoginScreens/LoginPage.dart';

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

            floatingActionButton: SizedBox(
              width: 50,
              height: 50,
              child: FloatingActionButton(

                  onPressed: (){
                    controller.changeScreen(0);
                  },child: Icon(Icons.home,color: Colors.white),shape: CircleBorder(),mini: true,backgroundColor: Appcolor().firstcolor,),
            ),
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
                        Expanded(child: IconButton(
                            hoverColor: Colors.transparent,
                            onPressed: () {
                          if(controller.logged==true){
                            controller.changeScreen(5);
                          }
                          else{
                            controller.changeScreen(4);
                          }
                        }, icon: controller.logged==true?Icon(Icons.account_circle,size: 30,color:Colors.black45,):Icon(Icons.login,size: 30,color:Colors.black45,))),
                        Expanded(child: IconButton(
                            hoverColor: Colors.transparent,
                            onPressed: () {controller.changeScreen(1);}, icon: Icon(Icons.favorite,size: 30,color: controller.screennum==1? Appcolor().firstcolor:Colors.black45,)))

                      ]),
                    ),
                    Expanded(
                      child: Row(children: [
                        Expanded(child: InkWell(
                            hoverColor: Colors.transparent,
                            onTap: () {controller.changeScreen(2);},child: Image.asset('images/handpray.png', color: controller.screennum==2? Appcolor().firstcolor:Colors.black45, width: 30)),),
                        Expanded(child: IconButton(
                          hoverColor: Colors.transparent,
                            onPressed: () {controller.changeScreen(3);}, icon: Icon(Icons.info,size: 30,color: controller.screennum==3? Appcolor().firstcolor:Colors.black45,)))

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
