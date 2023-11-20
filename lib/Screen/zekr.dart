import 'package:atebaa/controller/homecontroller.dart';
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
                body: SingleChildScrollView(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                    Container(width: 500,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          MaterialButton(
                            onPressed: () {
                              controller.changezekrdata(0);
                            },
                            color: Colors.amber,
                          ),
                          MaterialButton(
                            onPressed: () {
                              controller.changezekrdata(1);
                            },
                            color: Colors.cyan,
                          ),
                        ],
                      ),
                    ),
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
              )),
    );
  }
}
