
import 'package:atebaa/controller/homecontroller.dart';
import 'package:atebaa/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
class Favourite extends StatelessWidget {
  const Favourite({super.key});

  @override
  Widget build(BuildContext context) {

    return GetBuilder<homecontroller>(
        init: homecontroller(),
        builder: (controller) {
          controller.readdata();


          return ListView.separated(
              scrollDirection: Axis.vertical,
              itemBuilder: (context, i) {
                return Padding(
                  padding: const EdgeInsets.only(
                      left: 10, right: 10),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Appcolor().thirdcolor,
                        borderRadius:
                        BorderRadius.circular(25)),
                    height: 150.0,
                    width: double.infinity,
                    child: Row(
                      crossAxisAlignment:
                      CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Image.asset(
                              'images/pngegg.png'),
                        ),
                        SizedBox(width: 5.0),
                        Expanded(
                          child: Column(
                            mainAxisAlignment:
                            MainAxisAlignment
                                .spaceEvenly,
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${controller.doctors![i].name}",
                                style: TextStyle(
                                    color: Appcolor()
                                        .firstcolor,
                                    fontFamily:
                                    "ElMessiri-Bold",
                                    fontSize: 20),
                              ),
                              Container(
                                  decoration: BoxDecoration(
                                      color: Appcolor()
                                          .secondcolor,
                                      borderRadius:
                                      BorderRadius
                                          .circular(
                                          10)),
                                  child: Padding(
                                    padding:
                                    const EdgeInsets
                                        .only(
                                        left: 10,
                                        right: 10),
                                    child: Text(
                                      "${controller.doctors![i].special}",
                                      style: TextStyle(
                                          fontSize: 18),
                                    ),
                                  )),
                              Container(
                                width: double.infinity,
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.place,
                                      color: Appcolor()
                                          .fourthcolor,
                                    ),
                                    Expanded(
                                      child: Text(
                                        "${controller.doctors![i].address}",
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Appcolor()
                                                .fourthcolor),
                                        maxLines: 2,
                                        overflow:
                                        TextOverflow
                                            .ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  launch(
                                      'tel:${controller.doctors![i].phone}');
                                },
                                child: Container(
                                  width: double.infinity,
                                  child: Row(
                                    children: [
                                      Icon(Icons
                                          .phone_enabled),
                                      Expanded(
                                        child: Text(
                                          "${controller.doctors![i].phone} (2+) ",
                                          style: TextStyle(
                                              fontSize: 18),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );

              },
              separatorBuilder: (context, i) =>
                  SizedBox(height: 10),
              itemCount: controller.doctors!.length);
        });
  }
}
