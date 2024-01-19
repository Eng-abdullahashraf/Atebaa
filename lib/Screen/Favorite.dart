import 'package:atebaa/controller/homecontroller.dart';
import 'package:atebaa/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:url_launcher/url_launcher.dart';

class Favourite extends StatelessWidget {
  const Favourite({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<homecontroller>(
          init: homecontroller(),
          builder: (controller) {
            controller.readdata();
            return Container(
              color: Appcolor().secondcolor,
              child: Column(
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "المفضلة",
                            style: TextStyle(
                            fontFamily: "ElMessiri-Bold",
                            color: Appcolor().thirdcolor,
                            fontSize: 20),
                          ),
                        ),
                        Expanded(child: Gap(0)),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('( 10/${controller.doctors.length} )',style: TextStyle(color: Colors.white,fontSize: 20, fontFamily: "ElMessiri-Bold")),
                        ),

                      ],
                    ),
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                      color: Appcolor().firstcolor,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: Container(
                      child: controller.doctors.isEmpty
                          ? Center(
                            child: Text(
                                'قائمتك المفضلة فارغة',
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Appcolor().firstcolor,
                                  fontFamily: 'ElMessiri-Bold'
                                ),

                              ),
                          )
                          : ListView.separated(
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, i) {
                                return Padding(
                                  padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                                  child: Container(

                                    decoration: BoxDecoration(
                                        color: Appcolor().thirdcolor,
                                        border: Border.all(color: Appcolor().firstcolor,width: 1),
                                        borderRadius: BorderRadius.circular(15)),
                                    height: 155.0,
                                    width: double.infinity,
                                    child: Row(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: controller.doctors![i].gender == 'ذكر'
                                              ? Image.asset('images/mpa.png', width: 100,)
                                              : Image.asset('images/doctora.jpg', width: 100),
                                        ),
                                        SizedBox(width: 5.0),
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "د/${controller.doctors![i].name}",
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
                                                  decoration: BoxDecoration(color: Appcolor().secondcolor,
                                                      borderRadius: BorderRadius.circular(10)),
                                                  child: Padding(padding:
                                                    const EdgeInsets.only(left: 10, right: 10),
                                                    child: Text(
                                                      "${controller.doctors![i].special}",
                                                      overflow: TextOverflow.ellipsis,
                                                      maxLines: 1,
                                                      style: TextStyle(fontSize: 15,color: Appcolor().firstcolor,fontWeight: FontWeight.bold),
                                                    ),
                                                  )),
                                              Container(
                                                width: double.infinity,
                                                height: 30,
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                  children: [
                                                    Expanded(
                                                      child: Text('${controller.doctors![i].city}',
                                                          style: TextStyle(
                                                            fontSize: 15,color: Appcolor().firstcolor,fontFamily: 'ElMessiri-Bold',)),
                                                    ),
                                                    IconButton(
                                                        onPressed: () {
                                                          // box.delete(i);
                                                          controller.delete(i);
                                                        },
                                                        icon: Icon(Icons.delete_forever)),

                                                  ],
                                                ),
                                              ),
                                              Container(
                                                width: double.infinity,
                                                child: Row(
                                                  children: [
                                                    Icon(
                                                      Icons.place,
                                                      color:
                                                      Appcolor().fourthcolor,
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                        "${controller.doctors![i].address}",
                                                        style: TextStyle(
                                                            fontSize: 12,fontWeight: FontWeight.bold,
                                                            color: Appcolor()
                                                                .fourthcolor),
                                                        maxLines: 2,
                                                        overflow:
                                                        TextOverflow.ellipsis,
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
                                                      Container(
                                                        padding:EdgeInsets.all(3),
                                                        decoration:BoxDecoration(
                                                            border: Border.all(color: Color(
                                                                0xFFEAE9E9),width: 1),
                                                            shape: BoxShape.circle,color: Colors.white),
                                                        child: CircleAvatar(
                                                          backgroundColor: Appcolor().thirdcolor,
                                                          child: Icon(Icons.phone_enabled,size: 15,color: Colors.green, ),
                                                          minRadius: 10,
                                                        ),
                                                      ),
                                                      Gap(5),
                                                      Expanded(
                                                        child: Text(
                                                          "${controller.doctors![i].phone}",
                                                          style: TextStyle(
                                                              fontSize: 12,fontWeight: FontWeight.bold),
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
                              itemCount: controller.doctors!.length)
                    ),
                  ),
                  Gap(15)
                ],
              ),
            );
          }),
    );
  }
}
