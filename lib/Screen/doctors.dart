import 'package:animated_conditional_builder/animated_conditional_builder.dart';
import 'package:atebaa/controller/homecontroller.dart';
import 'package:atebaa/doctorss.dart';
import 'package:atebaa/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:url_launcher/url_launcher.dart';

import '../component.dart';

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
              controller.readdata();
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
                            child: Text(
                              '${controller.city!} - ${controller.special!}',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Appcolor().thirdcolor,
                                  fontFamily: 'ElMessiri-Bold'),
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
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIconColor: Appcolor().gray,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        hintText: "Search",
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
                              bool? z=false;
                              for(var s in controller.doctors){
                                if(s.name==controller.data![i]["name"]){
                                  print('object');
                                  z=true;
                                  break;
                                }
                                else{
                                  z=false;
                                }
                              }
                              if (controller.name!.isEmpty) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10,bottom: 10),
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
                                          child: controller.data![i]
                                          ['gender'] ==
                                              'ذكر'
                                              ? Image.asset(
                                              'images/pngegg.png',width: 100,)
                                              : Image.asset(
                                              'images/doctora.png',width: 100),
                                        ),
                                        const SizedBox(width: 5.0),
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .spaceEvenly,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "د/ ${controller.data![i]["name"]}",
                                                style: TextStyle(
                                                    color: Appcolor()
                                                        .firstcolor,
                                                    fontFamily:
                                                    "ElMessiri-Bold",
                                                    fontSize: 15,
                                                    fontWeight:
                                                    FontWeight.bold),
                                              ),
                                              Container(
                                                width: double.infinity,
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                                  children: [
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
                                                              right:
                                                              10),
                                                          child: Text(
                                                            "${controller.data![i]["special"]}",
                                                            overflow: TextOverflow.ellipsis,
                                                            maxLines: 2,
                                                            style: TextStyle(
                                                                fontSize:
                                                                15),
                                                          ),
                                                        )),
                                                    Padding(
                                                      padding:
                                                      const EdgeInsets
                                                          .only(
                                                          left: 15),
                                                      // child: Addbutton(data: controller.data![i]["name"]),
                                                      child: IconButton(
                                                          onPressed: () {
                                                            controller.readdata();
                                                            controller.checkinlist(controller.data![i]["name"],);
                                                            if(controller.z!){
                                                             // controller.delete(x);
                                                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('العنصر مضاف سابقا')));
                                                            }
                                                            else{
                                                              if (controller.doctors.length < 10) {
                                                                controller.doctors!.add(Doctorss(
                                                                    name: controller.data![i][
                                                                    "name"],
                                                                    special: controller.data![i][
                                                                    "special"],
                                                                    phone: controller.data![i][
                                                                    "phone"],
                                                                    address: controller.data![i]
                                                                    [
                                                                    "address"],
                                                                    city: controller
                                                                        .data![i]
                                                                    ["city"]));
                                                                controller.savetocache();
                                                              } else {
                                                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('القائمة المفضلة لديك ممتلئة')));
                                                              }
                                                            }
                                                            controller.z=false;

                                                          },
                                                          icon: z! ?Icon(Icons.favorite,color: Colors.red,):Icon(Icons.favorite_border,color: Colors.red)),
                                                    ),
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
                                                      'tel:${controller.data![i]["phone"]}');
                                                },
                                                child: Container(
                                                  width: double.infinity,
                                                  child: Row(
                                                    children: [
                                                      Icon(Icons
                                                          .phone_enabled),
                                                      Expanded(
                                                        child: Text(
                                                          "${controller.data![i]["phone"]}",
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
                              }
                              else if (controller.data![i]["name"].toString().contains(controller.name!)) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10,bottom: 10),
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
                                          child: controller.data![i]
                                          ['gender'] ==
                                              'ذكر'
                                              ? Image.asset(
                                              'images/pngegg.png')
                                              : Image.asset(
                                              'images/doctora.png'),
                                        ),
                                        const SizedBox(width: 5.0),
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .spaceEvenly,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "د/ ${controller.data![i]["name"]}",
                                                style: TextStyle(
                                                    color: Appcolor()
                                                        .firstcolor,
                                                    fontFamily:
                                                    "ElMessiri-Bold",
                                                    fontSize: 15,
                                                    fontWeight:
                                                    FontWeight.bold),
                                              ),
                                              Container(
                                                width: double.infinity,
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                                  children: [
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
                                                              right:
                                                              10),
                                                          child: Text(
                                                            "${controller.data![i]["special"]}",
                                                            style: TextStyle(
                                                                fontSize:
                                                                18),
                                                          ),
                                                        )),
                                                    Padding(
                                                      padding:
                                                      const EdgeInsets
                                                          .only(
                                                          left: 15),
                                                      // child: Addbutton(data: controller.data![i]["name"]),
                                                      child: IconButton(
                                                          onPressed: () {
                                                            controller.readdata();
                                                            controller.checkinlist(controller.data![i]["name"],);
                                                            if(controller.z!){
                                                              // controller.delete(x);
                                                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('العنصر مضاف سابقا')));
                                                            }
                                                            else{
                                                              if (controller.doctors.length < 10) {
                                                                controller.doctors!.add(Doctorss(
                                                                    name: controller.data![i][
                                                                    "name"],
                                                                    special: controller.data![i][
                                                                    "special"],
                                                                    phone: controller.data![i][
                                                                    "phone"],
                                                                    address: controller.data![i]
                                                                    [
                                                                    "address"],
                                                                    city: controller
                                                                        .data![i]
                                                                    ["city"]));
                                                                controller.savetocache();
                                                              } else {
                                                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('القائمة المفضلة لديك ممتلئة')));
                                                              }
                                                            }
                                                            controller.z=false;

                                                          },
                                                          icon: z! ?Icon(Icons.favorite,color: Colors.red,):Icon(Icons.favorite_border,color: Colors.red)),
                                                    ),
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
                                                      'tel:${controller.data![i]["phone"]}');
                                                },
                                                child: Container(
                                                  width: double.infinity,
                                                  child: Row(
                                                    children: [
                                                      Icon(Icons
                                                          .phone_enabled),
                                                      Expanded(
                                                        child: Text(
                                                          "${controller.data![i]["phone"]}",
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
                              } else {
                                return SizedBox(height: 0,);
                              }
                            },
                            separatorBuilder: (context, i) =>
                                SizedBox(height: 0),
                            itemCount: controller.data!.length))),
              ],
            );} ,
            fallback: (BuildContext context) =>
                Center(child: CircularProgressIndicator())),
      ),
    ));
  }
}
