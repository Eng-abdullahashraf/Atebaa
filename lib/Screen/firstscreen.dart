import 'package:atebaa/controller/homecontroller.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:atebaa/theme/colors.dart';
import 'package:get/get.dart';



class FirstScreen extends StatelessWidget {
  FirstScreen({Key? key}) : super(key: key);

  TextEditingController cites = TextEditingController();
  TextEditingController specialty = TextEditingController();
  int? screennum;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<homecontroller>(
        init: homecontroller(),
        builder:(controller) {
          return SafeArea(
            child: Scaffold(
              bottomNavigationBar: CurvedNavigationBar(
                  height: 50,
                  backgroundColor: Appcolor().thirdcolor,
                  color: Appcolor().firstcolor,
                  onTap: (value) {
                    controller.changeScreen(value);
                  },
                  items: [
                    Icon(Icons.home,color: Appcolor().thirdcolor,),
                    Icon(Icons.favorite,color: Appcolor().thirdcolor,),
                    Icon(Icons.contact_page,color: Appcolor().thirdcolor,),

                  ]
              ),
              body: GetBuilder<homecontroller>(
                init: homecontroller(),
                builder: (controller) => Padding(
                  padding: const EdgeInsets.all(5),
                  child: controller.Screennav[controller.screennum!],
                ),
              ),
            ),
          );
        });
    /*SafeArea(
      child: Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          height: 50,
          backgroundColor: Appcolor().thirdcolor,
            color: Appcolor().firstcolor,
            onTap: (value) {
            print(value);
            homecontroller controller=homecontroller();
            controller.changeScreen(value);
            },
            items: [
              Icon(Icons.home,color: Appcolor().thirdcolor,),
              Icon(Icons.favorite,color: Appcolor().thirdcolor,),
              Icon(Icons.contact_page,color: Appcolor().thirdcolor,),

            ]
        ),
        body: GetBuilder<homecontroller>(
          init: homecontroller(),
          builder: (controller) => Padding(
            padding: const EdgeInsets.all(25),
            child: controller.Screennav[controller.screennum!],
          ),
        ),
      ),
    );*/
  }
}
