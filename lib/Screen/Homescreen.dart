import 'package:atebaa/component/pages.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../constant/Apptextfield.dart';
import '../component/component.dart';
import '../controller/homecontroller.dart';
import '../theme/colors.dart';

class Homescreen extends StatelessWidget {
  Homescreen({super.key});

  TextEditingController cites = TextEditingController();
  TextEditingController specialty = TextEditingController();
//
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: StreamBuilder<ConnectivityResult>(
            stream: Connectivity().onConnectivityChanged,
            builder: (context, snapshot) {
              return Scaffold(
                backgroundColor: Appcolor().thirdcolor,
                body: GetBuilder<homecontroller>(
                    init: homecontroller(),
                    builder: (controller) {
                      controller.checkinternet();
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 30, right: 15, top: 8),
                            child: Container(
                              height: 50,
                              child: Row(children: [
                                Image(
                                  image: AssetImage('images/atebaa.png'),
                                ),
                                Expanded(child: Gap(0)),
                                Text(
                                  'atebaa',
                                  style: TextStyle(
                                      fontSize: 45,
                                      color: Appcolor().firstcolor,
                                      fontFamily: 'Bebas',
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 5),
                                )
                              ]),
                            ),
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: Container(
                                        width: double.infinity,
                                        height: 170,
                                        child: FlutterCarousel(
                                            items: controller.gene(context),
                                            options: CarouselOptions(
                                              height: 170,
                                              enlargeCenterPage: true,
                                              initialPage: 0,
                                              autoPlayInterval:
                                                  Duration(seconds: 3),
                                              scrollDirection: Axis.horizontal,
                                              autoPlay: true,
                                              viewportFraction: 1.0,
                                              autoPlayCurve:
                                                  Curves.fastOutSlowIn,
                                              autoPlayAnimationDuration:
                                                  Duration(seconds: 2),
                                              showIndicator: false,
                                              enableInfiniteScroll: true,
                                            ))),
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        Expanded(child: Gap(0)),
                                        TextButton(
                                            onPressed: () {},
                                            child: Text(
                                              'عرض الكل',
                                              style: TextStyle(
                                                  color: Color(0xff051fa2),
                                                  fontSize: 14),
                                            )),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15, right: 15),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: InkWell( child: tab(123, 'images/doctorstab.jpg', 'أطباء'), onTap: () {Get.to(searchdoctors());},),
                                        ),
                                        Gap(10),
                                        Expanded(
                                            child: tab(123, 'images/pharmacytab.jpg', 'صيدليات')
                                        ),

                                      ],
                                    ),

                                  ),
                                  Gap(10),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15, right: 15),
                                    child: Row(
                                      children: [
                                        Expanded(
                                            child: tab(123, 'images/radiology.jpg', 'مراكز')
                                        ),
                                        Gap(10),
                                        Expanded(
                                            child: tab(123, 'images/laboratory.png', 'معامل تحاليل')
                                        ),

                                      ],
                                    ),

                                  ),
                                  Gap(10),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15, right: 15),
                                    child: tab(123, 'images/offers.jpg', 'عروض وخصومات'),
                                  ),
                                  Gap(10),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
              );
            }));
  }
}
