import 'package:animated_conditional_builder/animated_conditional_builder.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controller/homecontroller.dart';
import '../doctorss.dart';
import '../theme/colors.dart';

class doctorsn extends StatelessWidget {
  doctorsn({super.key});

  TextEditingController search = TextEditingController();
  String? name;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Appcolor().secondcolor,
      body: GetBuilder<homecontroller>(
          init: homecontroller(),
          builder: (controller) {
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
                  padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                  child: Container(
                    height: 50,
                    // decoration: BoxDecoration(border: Border.all(color: Appcolor().firstcolor),borderRadius: BorderRadius.circular(15)),
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
                Expanded(child: Container(
                  child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance.collection('doctors').snapshots(),
                      builder: (context,snapshot){
                        if(snapshot.hasError){
                          return Text('error');
                        }
                        if(snapshot.connectionState == ConnectionState.waiting){
                          return Center(child: //CircularProgressIndicator()
                             Text('data')
                           );
                        }
                        else{
                          controller.gotodoctor();
                          return ListView.builder(
                              itemCount: controller.data!.length,
                              itemBuilder: (context, i) {
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
                                        left: 10, right: 10, bottom: 10),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Appcolor().thirdcolor,
                                          border: Border.all(color: Appcolor().firstcolor,width: 1),
                                          borderRadius: BorderRadius.circular(25)),
                                      height: 150.0,
                                      width: double.infinity,
                                      child: Row(crossAxisAlignment: CrossAxisAlignment.stretch,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: controller.data![i]['gender'] == 'ذكر'
                                                ? Image.asset('images/mpa.png', width: 100,)
                                                : Image.asset('images/doctora.jpg', width: 100),
                                          ),
                                          const SizedBox(width: 5.0),
                                          Expanded(
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "د/ ${controller.data![i]["name"]}",
                                                  style: TextStyle(
                                                      color:
                                                      Colors.black,
                                                      fontFamily:
                                                      "ElMessiri-Bold",
                                                      fontSize: 15,
                                                      fontWeight:
                                                      FontWeight.bold),
                                                ),
                                                Container(
                                                  width: double.infinity,
                                                  height: 30,
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Expanded(
                                                        child: Container(
                                                            decoration: BoxDecoration(color: Appcolor().secondcolor,
                                                                borderRadius: BorderRadius.circular(10)),
                                                            child: Padding(padding: const EdgeInsets.only(left: 10, right: 10),
                                                              child: Text("${controller.data![i]["special"]}",
                                                                overflow: TextOverflow.ellipsis,
                                                                maxLines: 1,
                                                                style: TextStyle(fontSize: 15,color: Appcolor().firstcolor,fontWeight: FontWeight.bold),
                                                              ),
                                                            )),
                                                      ),
                                                      Padding(
                                                        padding:
                                                        const EdgeInsets
                                                            .only(left: 15),
                                                        // child: Addbutton(data: controller.data![i]["name"]),
                                                        child: IconButton(
                                                            onPressed: () {
                                                              controller
                                                                  .readdata();
                                                              controller
                                                                  .checkinlist(
                                                                controller
                                                                    .data![
                                                                i]["name"],
                                                              );
                                                              if (controller
                                                                  .z!) {
                                                                // controller.delete(x);
                                                                ScaffoldMessenger.of(
                                                                    context)
                                                                    .showSnackBar(SnackBar(
                                                                    content:
                                                                    Text('العنصر مضاف سابقا لازالته من قائمة المفضلة')));
                                                              } else {
                                                                if (controller.doctors.length < 10) {
                                                                  controller.doctors!.add(Doctorss(
                                                                      name: controller.data![i]["name"],
                                                                      special: controller.data![i]["special"],
                                                                      phone: controller.data![i]["phone"],
                                                                      address: controller.data![i]["address"],
                                                                      city: controller.data![i]["city"]
                                                                  ));
                                                                  controller.savetocache();
                                                                }
                                                                else {
                                                                  ScaffoldMessenger.of(
                                                                      context)
                                                                      .showSnackBar(SnackBar(
                                                                      content:
                                                                      Text('القائمة المفضلة لديك ممتلئة')));
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
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Text(
                                                    controller.data![i]["city"],
                                                    style: TextStyle(
                                                      fontSize: 15,color: Appcolor().firstcolor,fontFamily: 'ElMessiri-Bold',)),
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
                                                                  .fourthcolor,fontWeight: FontWeight.bold),
                                                          maxLines: 2,
                                                          overflow: TextOverflow
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
                                                            .phone_enabled,color: Colors.green),
                                                        Expanded(
                                                          child: Text(
                                                            "${controller.data![i]["phone"]}",
                                                            style: TextStyle(
                                                                fontSize: 15,fontWeight: FontWeight.bold),
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
                                } else if (controller.data![i]["name"].toString().contains(controller.name!)) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10, bottom: 10),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Appcolor().thirdcolor,
                                          border: Border.all(color: Appcolor().firstcolor,width: 1),
                                          borderRadius: BorderRadius.circular(25)),
                                      height: 150.0,
                                      width: double.infinity,
                                      child: Row(crossAxisAlignment: CrossAxisAlignment.stretch,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: controller.data![i]['gender'] == 'ذكر'
                                                ? Image.asset(
                                              'images/pngegg.png',
                                              width: 100,
                                            )
                                                : Image.asset(
                                                'images/doctora.png',
                                                width: 100),
                                          ),
                                          const SizedBox(width: 5.0),
                                          Expanded(
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "د/ ${controller.data![i]["name"]}",
                                                  style: TextStyle(
                                                      color:
                                                      Colors.black,
                                                      fontFamily:
                                                      "ElMessiri-Bold",
                                                      fontSize: 15,
                                                      fontWeight:
                                                      FontWeight.bold),
                                                ),
                                                Container(
                                                  width: double.infinity,
                                                  height: 30,
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Expanded(
                                                        child: Container(
                                                            decoration: BoxDecoration(color: Appcolor().secondcolor,
                                                                borderRadius: BorderRadius.circular(10)),
                                                            child: Padding(padding: const EdgeInsets.only(left: 10, right: 10),
                                                              child: Text("${controller.data![i]["special"]}",
                                                                overflow: TextOverflow.ellipsis,
                                                                maxLines: 1,
                                                                style: TextStyle(fontSize: 15,color: Appcolor().firstcolor,fontWeight: FontWeight.bold),
                                                              ),
                                                            )),
                                                      ),
                                                      Padding(
                                                        padding:
                                                        const EdgeInsets
                                                            .only(left: 15),
                                                        // child: Addbutton(data: controller.data![i]["name"]),
                                                        child: IconButton(
                                                            onPressed: () {
                                                              controller
                                                                  .readdata();
                                                              controller
                                                                  .checkinlist(
                                                                controller
                                                                    .data![
                                                                i]["name"],
                                                              );
                                                              if (controller
                                                                  .z!) {
                                                                // controller.delete(x);
                                                                ScaffoldMessenger.of(
                                                                    context)
                                                                    .showSnackBar(SnackBar(
                                                                    content:
                                                                    Text('العنصر مضاف سابقا لازالته من قائمة المفضلة')));
                                                              } else {
                                                                if (controller.doctors.length < 10) {
                                                                  controller.doctors!.add(Doctorss(
                                                                      name: controller.data![i]["name"],
                                                                      special: controller.data![i]["special"],
                                                                      phone: controller.data![i]["phone"],
                                                                      address: controller.data![i]["address"],
                                                                      city: controller.data![i]["city"]
                                                                  ));
                                                                  controller.savetocache();
                                                                }
                                                                else {
                                                                  ScaffoldMessenger.of(
                                                                      context)
                                                                      .showSnackBar(SnackBar(
                                                                      content:
                                                                      Text('القائمة المفضلة لديك ممتلئة')));
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
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Text(
                                                    controller.data![i]["city"],
                                                    style: TextStyle(
                                                      fontSize: 15,color: Appcolor().firstcolor,fontFamily: 'ElMessiri-Bold',)),
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
                                                                  .fourthcolor,fontWeight: FontWeight.bold),
                                                          maxLines: 2,
                                                          overflow: TextOverflow
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
                                                            .phone_enabled,color: Colors.green),
                                                        Expanded(
                                                          child: Text(
                                                            "${controller.data![i]["phone"]}",
                                                            style: TextStyle(
                                                                fontSize: 15,fontWeight: FontWeight.bold),
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
                                else {
                                  return SizedBox(height: 0,);
                                }
                              },);
                        }

                      }
                      ),
                )
                ),
              ],
            );
          }),
    ));
  }
}
