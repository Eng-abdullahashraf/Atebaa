import 'package:animated_conditional_builder/animated_conditional_builder.dart';
import 'package:atebaa/constant/addvertisingmodels.dart';
import 'package:atebaa/controller/homecontroller.dart';
import 'package:atebaa/constant/doctorss.dart';
import 'package:atebaa/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';
import 'package:url_launcher/url_launcher.dart';

import '../component/component.dart';

class Doctors extends StatelessWidget {
  Doctors({Key? key}) : super(key: key);

  TextEditingController search = TextEditingController();
  String? name;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Appcolor().secondcolor,
      body: GetBuilder<homecontroller>(
        init: homecontroller(),
        builder: (controller) => AnimatedConditionalBuilder(
            condition: controller.load!,
            builder: (BuildContext context) {
              controller.showInterstitialAd();
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Appcolor().firstcolor,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(15),
                            bottomLeft: Radius.circular(15))),
                    height: 50,
                    width: double.infinity,
                    child: Row(
                      children: [
                        Expanded(
                          child: Center(
                              child: Padding(
                            padding: const EdgeInsets.only(right: 25),
                            child: Text(
                              '${controller.city!} - ${controller.special!}',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Appcolor().thirdcolor,
                                  fontFamily: 'ElMessiri-Bold'),
                            ),
                          )),
                        ),
                        IconButton(
                          onPressed: () {
                            controller.name = "";
                            controller.special = "";
                            controller.city = "";
                            Get.back();
                          },
                          icon: Icon(Icons.arrow_forward_ios,
                              color: Appcolor().thirdcolor),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 10, right: 10),
                    child: Container(
                      height: 50,
                      // decoration: BoxDecoration(border: Border.all(color: Appcolor().firstcolor),borderRadius: BorderRadius.circular(15)),
                      child: TextField(
                        decoration: InputDecoration(
                          prefixIconColor: Appcolor().gray,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                          hintText: "بحث",
                          prefixIcon: Icon(Icons.search),
                        ),
                        onChanged: (value) {
                          controller.search(value);
                        },
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                      child: Container(
                          child: ListView.separated(
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, i) {
                                controller.readdata();
                                bool? z = false;
                                for (var s in controller.doctors) {
                                  if (s.name == controller.data![i]["name"]) {
                                    print('object');
                                    z = true;
                                    break;
                                  } else {
                                    z = false;
                                  }
                                }
                                if (controller.name!.isEmpty) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10, bottom: 12),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Appcolor().thirdcolor,
                                          // border: Border.all(
                                          //     color: Appcolor().firstcolor,
                                          //     width: 1),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black12, // Shadow color
                                              spreadRadius: 1, // Spread the shadow
                                              blurRadius: 1, // Blur effect
                                              offset: Offset(.7, .7), // No offset to have shadow on all sides
                                            ),
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      // height: 170.0,
                                      width: double.infinity,
                                      child: Stack(
                                        clipBehavior: Clip.none,
                                        alignment: Alignment.topLeft,
                                        children: [
                                          advernumber.contains(
                                                  controller.data![i]["phone"])
                                              ? Positioned(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 5),
                                                    child: Image(
                                                        image: AssetImage(
                                                            'images/star.png'),
                                                        width: 25),
                                                  ),
                                                  top: 6)
                                              : Column(
                                                children: [
                                                  Row(
                                                    // crossAxisAlignment:
                                                    //     CrossAxisAlignment
                                                    //         .stretch,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets.only(left:10,right: 10,bottom: 5,top: 10),
                                                        child: controller.data![
                                                                        i][
                                                                    'gender'] ==
                                                                'ذكر'
                                                            ? Image.asset(
                                                                'images/mpa.png',
                                                                width: 70,
                                                              )
                                                            : Image.asset(
                                                                'images/doctora.jpg',
                                                                width: 70),
                                                      ),
                                                      const SizedBox(
                                                          width: 5.0),
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  top: 5,
                                                                  bottom: 5),
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                "د/ ${controller.data![i]["name"]}",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontFamily:
                                                                        "ElMessiri-Bold",
                                                                    fontSize:
                                                                        17,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                              Gap(5),
                                                              Container(
                                                                  decoration: BoxDecoration(
                                                                      color: Appcolor()
                                                                          .secondcolor,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10)),
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsets
                                                                        .only(
                                                                        left:
                                                                            10,
                                                                        right:
                                                                            10),
                                                                    child:
                                                                        Text(
                                                                      "${controller.data![i]["special"]}",
                                                                      overflow:
                                                                          TextOverflow.ellipsis,
                                                                      maxLines:
                                                                          1,
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              15,
                                                                          color:
                                                                              Appcolor().firstcolor,
                                                                          fontWeight: FontWeight.bold),
                                                                    ),
                                                                  )),
                                                              Gap(5),
                                                              Container(
                                                                width: double
                                                                    .infinity,
                                                                height: 30,
                                                                child: Row(
                                                                  children: [
                                                                    Expanded(
                                                                      child: Text(
                                                                          controller.data![i][
                                                                              "city"],
                                                                          style:
                                                                              TextStyle(
                                                                            fontSize: 15,
                                                                            color: Appcolor().firstcolor,
                                                                            fontFamily: 'ElMessiri-Bold',
                                                                          )),
                                                                    ),
                                                                    IconButton(
                                                                        onPressed:
                                                                            () {
                                                                          //controller.readdata();
                                                                          controller.checkinlist(
                                                                            controller.data![i]["name"],
                                                                          );
                                                                          if (controller.z!) {
                                                                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('العنصر مضاف سابقا لازالته من قائمة المفضلة')));
                                                                          } else {
                                                                            if (controller.doctors.length < 10) {
                                                                              controller.doctors!.add(Doctorss(name: controller.data![i]["name"], special: controller.data![i]["special"], phone: controller.data![i]["phone"], address: controller.data![i]["address"], city: controller.data![i]["city"], gender: controller.data![i]["gender"]));
                                                                              controller.savetocache();
                                                                            } else {
                                                                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('القائمة المفضلة لديك ممتلئة')));
                                                                            }
                                                                          }
                                                                          controller.z =
                                                                              false;
                                                                        },
                                                                        icon: z!
                                                                            ? Icon(
                                                                                Icons.favorite,
                                                                                color: Appcolor().firstcolor,
                                                                              )
                                                                            : Icon(Icons.favorite_border, color: Appcolor().firstcolor)),
                                                                  ],
                                                                ),
                                                              ),
                                                              Gap(5),
                                                              Container(
                                                                width: double
                                                                    .infinity,
                                                                child: Row(
                                                                  children: [
                                                                    Icon(
                                                                      Icons
                                                                          .place,
                                                                      color: Appcolor()
                                                                          .fourthcolor,
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Text(
                                                                        "${controller.data![i]["address"]}",
                                                                        style: TextStyle(
                                                                            fontSize: 13,
                                                                            color: Appcolor().fourthcolor,
                                                                            fontWeight: FontWeight.bold),
                                                                        maxLines:
                                                                            2,
                                                                        overflow:
                                                                            TextOverflow.ellipsis,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              // InkWell(
                                                              //     onTap: () {
                                                              //       controller
                                                              //           .loadRewardedAd();
                                                              //       launch(
                                                              //           'tel:${controller.data![i]["phone"]}');
                                                              //     },
                                                              //     child:
                                                              //         Padding(
                                                              //       padding: const EdgeInsets
                                                              //           .only(
                                                              //           left:
                                                              //               15),
                                                              //       child:
                                                              //           ElevatedButton(
                                                              //         onPressed:
                                                              //             () {
                                                              //           controller
                                                              //               .loadRewardedAd();
                                                              //           launch(
                                                              //               'tel:${controller.data![i]["phone"]}');
                                                              //         },
                                                              //         style: ElevatedButton
                                                              //             .styleFrom(
                                                              //           backgroundColor:
                                                              //               Colors.green,
                                                              //           shape:
                                                              //               RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                                              //           minimumSize: Size(
                                                              //               double.infinity,
                                                              //               30),
                                                              //         ),
                                                              //         child:
                                                              //             Text(
                                                              //           'إتصل',
                                                              //           style: TextStyle(
                                                              //               color: Appcolor().thirdcolor,
                                                              //               fontSize: 18,
                                                              //               fontFamily: 'ElMessiri-Bold'),
                                                              //         ),
                                                              //       ),
                                                              //     )
                                                              //     // Container(
                                                              //     //   width:
                                                              //     //       double.infinity,
                                                              //     //   child: Row(
                                                              //     //     children: [
                                                              //     //       Image(
                                                              //     //           image: AssetImage('images/newphone.png'), width: 30),
                                                              //     //       // Gap(5),
                                                              //     //       // Expanded(
                                                              //     //       //   child: Text(
                                                              //     //       //     "${controller.data![i]["phone"]}",
                                                              //     //       //     style: TextStyle(
                                                              //     //       //         fontSize:
                                                              //     //       //             12,
                                                              //     //       //         fontWeight:
                                                              //     //       //             FontWeight
                                                              //     //       //                 .bold),
                                                              //     //       //   ),
                                                              //     //       // ),
                                                              //     //     ],
                                                              //     //   ),
                                                              //     // ),
                                                              //     ),
                                                            ],
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(left: 10,right: 10,bottom: 10),
                                                    child: InkWell(
                                                      child: Container(
                                                        width:double.infinity,
                                                        height:40,
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(3),
                                                          // Rounded corners
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color: Colors.black.withOpacity(0.2), // Shadow color
                                                              spreadRadius: .5, // Spread the shadow
                                                              blurRadius: .5, // Blur effect
                                                              offset: Offset(1, 1), // No offset to have shadow on all sides
                                                            ),
                                                          ],
                                                          color: Colors.green,
                                                        ),

                                                        child: Center(
                                                          child: Text(
                                                            'إتصال',
                                                            style: TextStyle(
                                                                color: Appcolor().thirdcolor,
                                                                fontSize: 20,
                                                                fontFamily: 'ElMessiri-Bold'),
                                                          ),
                                                        ),
                                                      ),
                                                      onTap: (){
                                                        controller
                                                            .loadRewardedAd();
                                                        launch(
                                                            'tel:${controller.data![i]["phone"]}');
                                                      },
                                                    ),
                                                  ),

                                                ],
                                              ),
                                        ],
                                      ),
                                    ),
                                  );
                                } else if (controller.data![i]["name"]
                                    .toString()
                                    .contains(controller.name!)) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10, bottom: 10),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Appcolor().thirdcolor,
                                          border: Border.all(
                                              color: Appcolor().firstcolor,
                                              width: 1),
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      height: 155.0,
                                      width: double.infinity,
                                      child: Stack(
                                        clipBehavior: Clip.none,
                                        alignment: Alignment.topLeft,
                                        children: [
                                          advernumber.contains(
                                                  controller.data![i]["phone"])
                                              ? Positioned(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 5),
                                                    child: Image(
                                                        image: AssetImage(
                                                            'images/star.png'),
                                                        width: 25),
                                                  ),
                                                  top: 6)
                                              : Gap(0),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(10),
                                                child: controller.data![i]
                                                            ['gender'] ==
                                                        'ذكر'
                                                    ? Image.asset(
                                                        'images/mpa.png',
                                                        width: 100,
                                                      )
                                                    : Image.asset(
                                                        'images/doctora.jpg',
                                                        width: 100),
                                              ),
                                              const SizedBox(width: 5.0),
                                              Expanded(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 5, bottom: 5),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "د/ ${controller.data![i]["name"]}",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontFamily:
                                                                "ElMessiri-Bold",
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
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
                                                              "${controller.data![i]["special"]}",
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              maxLines: 1,
                                                              style: TextStyle(
                                                                  fontSize: 15,
                                                                  color: Appcolor()
                                                                      .firstcolor,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                          )),
                                                      Container(
                                                        width: double.infinity,
                                                        height: 30,
                                                        child: Row(
                                                          children: [
                                                            Expanded(
                                                              child: Text(
                                                                  controller
                                                                          .data![i]
                                                                      ["city"],
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        15,
                                                                    color: Appcolor()
                                                                        .firstcolor,
                                                                    fontFamily:
                                                                        'ElMessiri-Bold',
                                                                  )),
                                                            ),
                                                            IconButton(
                                                                onPressed: () {
                                                                  //controller.readdata();
                                                                  controller
                                                                      .checkinlist(
                                                                    controller
                                                                            .data![i]
                                                                        [
                                                                        "name"],
                                                                  );
                                                                  if (controller
                                                                      .z!) {
                                                                    ScaffoldMessenger.of(
                                                                            context)
                                                                        .showSnackBar(SnackBar(
                                                                            content:
                                                                                Text('العنصر مضاف سابقا لازالته من قائمة المفضلة')));
                                                                  } else {
                                                                    if (controller
                                                                            .doctors
                                                                            .length <
                                                                        10) {
                                                                      controller.doctors!.add(Doctorss(
                                                                          name: controller.data![i][
                                                                              "name"],
                                                                          special: controller.data![i]
                                                                              [
                                                                              "special"],
                                                                          phone: controller.data![i]
                                                                              [
                                                                              "phone"],
                                                                          address: controller.data![i]
                                                                              [
                                                                              "address"],
                                                                          city: controller.data![i]
                                                                              ["city"],
                                                                          gender: controller.data![i]["gender"]));
                                                                      controller
                                                                          .savetocache();
                                                                    } else {
                                                                      ScaffoldMessenger.of(
                                                                              context)
                                                                          .showSnackBar(
                                                                              SnackBar(content: Text('القائمة المفضلة لديك ممتلئة')));
                                                                    }
                                                                  }
                                                                  controller.z =
                                                                      false;
                                                                },
                                                                icon: z!
                                                                    ? Icon(
                                                                        Icons
                                                                            .favorite,
                                                                        color: Colors
                                                                            .red,
                                                                      )
                                                                    : Icon(
                                                                        Icons
                                                                            .favorite_border,
                                                                        color: Colors
                                                                            .red)),
                                                          ],
                                                        ),
                                                      ),
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
                                                                "${controller.data![i]["address"]}",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                    color: Appcolor()
                                                                        .fourthcolor,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
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
                                                          controller
                                                              .loadRewardedAd();
                                                          launch(
                                                              'tel:${controller.data![i]["phone"]}');
                                                        },
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          child: Row(
                                                            children: [
                                                              Container(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(3),
                                                                decoration: BoxDecoration(
                                                                    border: Border.all(
                                                                        color: Color(
                                                                            0xFFEAE9E9),
                                                                        width:
                                                                            1),
                                                                    shape: BoxShape
                                                                        .circle,
                                                                    color: Colors
                                                                        .white),
                                                                child:
                                                                    CircleAvatar(
                                                                  backgroundColor:
                                                                      Appcolor()
                                                                          .thirdcolor,
                                                                  child: Icon(
                                                                    Icons
                                                                        .phone_enabled,
                                                                    size: 15,
                                                                    color: Colors
                                                                        .green,
                                                                  ),
                                                                  minRadius: 10,
                                                                ),
                                                              ),
                                                              Gap(5),
                                                              Expanded(
                                                                child: Text(
                                                                  "${controller.data![i]["phone"]}",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          12,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                } else {
                                  return SizedBox(
                                    height: 0,
                                  );
                                }
                              },
                              separatorBuilder: (context, i) =>
                                  SizedBox(height: 0),
                              itemCount: controller.data!.length))),
                  controller.isloaded
                      ? SizedBox(
                    width: controller.bannerAd!.size.width.toDouble(),
                    height: controller.bannerAd!.size.height.toDouble(),
                    child: AdWidget(ad: controller.bannerAd!),
                  )
                      : SizedBox(),
                ],
              );
            },
            fallback: (BuildContext context) =>
                Center(child: CircularProgressIndicator())),
      ),
    ));
  }
}
