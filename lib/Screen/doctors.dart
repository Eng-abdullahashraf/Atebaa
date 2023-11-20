import 'package:animated_conditional_builder/animated_conditional_builder.dart';
import 'package:atebaa/controller/homecontroller.dart';
import 'package:atebaa/doctorss.dart';
import 'package:atebaa/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
            builder: (BuildContext context) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 5),
                        child: Center(
                            child: Text(
                          '${controller.city!} - ${controller.special!}',
                          style: TextStyle(
                              fontSize: 18,
                              color: Appcolor().thirdcolor,
                              fontFamily: 'ElMessiri-Bold'),
                        )),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 10, right: 10),
                      child: Row(
                        children: [
                          Expanded(
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
                            width: 20,
                          ),
                          IconButton(
                            onPressed: () {
                              controller.name = "";
                              controller.special = "";
                              controller.city = "";
                              Get.back();
                            },
                            icon: Icon(Icons.arrow_forward_ios),
                          ),
                        ],
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
                                  var data = controller.data![i]
                                      as Map<String, dynamic>;
                                  if (controller.name!.isEmpty) {
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
                                                    "${controller.data![i]["name"]}",
                                                    style: TextStyle(
                                                        color: Appcolor()
                                                            .firstcolor,
                                                        fontFamily:
                                                            "ElMessiri-Bold",
                                                        fontSize: 20),
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
                                                          child: IconButton(onPressed: (){
                                                            print('object');

                                                            controller
                                                                .readdata();
                                                            controller.doctors.add(Doctorss(
                                                                name: controller
                                                                    .data![i]
                                                                ["name"],
                                                                special: controller
                                                                    .data![i][
                                                                "special"],
                                                                phone: controller
                                                                    .data![i]
                                                                ["phone"],
                                                                address: controller
                                                                    .data![i][
                                                                "address"],
                                                                city: controller
                                                                    .data![i]
                                                                ["city"]));
                                                            controller
                                                                .savetocache();
                                                            print(controller.doctors);
                                                          }, icon: Icon(Icons.add_circle)),
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
                                                              "${controller.data![i]["phone"]} (2+) ",
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
                                  if (data!["name"]
                                      .toString()
                                      .contains(controller.name!)) {
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
                                                    "${controller.data![i]["name"]}",
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
                                                          "${controller.data![i]["special"]}",
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
                                                              "${controller.data![i]["phone"]} (2+) ",
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
                                    return SizedBox();
                                  }
                                },
                                separatorBuilder: (context, i) =>
                                    SizedBox(height: 10),
                                itemCount: controller.data!.length)
                            /*child: ListView.builder(
                          itemCount: controller.data!.length,
                          itemBuilder: (context, i) {
                            var data =
                                controller.data![i] as Map<String, dynamic>;
                            if (controller.name!.isEmpty) {
                              print("2");

                              return Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Appcolor().thirdcolor,
                                      borderRadius: BorderRadius.circular(25)),
                                  height: 150.0,
                                  width: double.infinity,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Container(
                                          height: 110,
                                          child: Icon(
                                            Icons.person,
                                            size: 110,
                                          )),
                                      SizedBox(width: 5.0),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${data["name"]}",
                                            style: TextStyle(
                                                color: Appcolor().firstcolor,
                                                fontFamily: "ElMessiri-Bold",
                                                fontSize: 20),
                                          ),
                                          Container(
                                              decoration: BoxDecoration(
                                                  color: Appcolor().secondcolor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10, right: 10),
                                                child: Text(
                                                  "${data["special"]}",
                                                  style:
                                                      TextStyle(fontSize: 18),
                                                ),
                                              )),
                                          Text(
                                            "${data["address"]}",
                                            style: TextStyle(fontSize: 18),
                                          ),
                                          Text(
                                            "(+20) ${data["phone"]}",
                                            style: TextStyle(fontSize: 18),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }
                            if (data!["name"]
                                .toString()
                                .startsWith(controller.name!)) {
                              print("1");
                              return Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Appcolor().thirdcolor,
                                      borderRadius: BorderRadius.circular(25)),
                                  height: 150.0,
                                  width: double.infinity,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Container(
                                          height: 110,
                                          child: Icon(
                                            Icons.person,
                                            size: 110,
                                          )),
                                      SizedBox(width: 5.0),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${data["name"]}",
                                            style: TextStyle(
                                                color: Appcolor().firstcolor,
                                                fontFamily: "ElMessiri-Bold",
                                                fontSize: 20),
                                          ),
                                          Container(
                                              decoration: BoxDecoration(
                                                  color: Appcolor().secondcolor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10, right: 10),
                                                child: Text(
                                                  "${data["special"]}",
                                                  style:
                                                      TextStyle(fontSize: 18),
                                                ),
                                              )),
                                          Text(
                                            "${data["address"]}",
                                            style: TextStyle(fontSize: 18),
                                          ),
                                          Text(
                                            "(+20) ${data["phone"]}",
                                            style: TextStyle(fontSize: 18),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }
                            else{
                              return SizedBox();
                            }
                          }),*/
                            )),
                  ],
                ),
            fallback: (BuildContext context) =>
                Center(child: CircularProgressIndicator())),
      ),
    ));
  }
}
