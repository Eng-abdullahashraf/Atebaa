import 'package:atebaa/controller/homecontroller.dart';
import 'package:atebaa/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class InfoDoctor extends StatelessWidget {
  const InfoDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    int? i;

    return SafeArea(
      child: GetBuilder<homecontroller>(
          init: homecontroller(),
          builder: (controller) {
            return Scaffold(
              backgroundColor: Colors.white54,
              body: Column(children: [
                Stack(
                  alignment: AlignmentDirectional(0, 1),
                  children: [
                    Container(height:300,width:double.infinity,child: Image.asset("images/zaharn.png",
                      fit: BoxFit.cover,)),
                    Container(
                      width: double.infinity,
                      child: Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              focusColor: Colors.white,
                              child: Container(
                                child: Center(
                                    child: Text(
                                      'بيانات العياده',
                                      style: TextStyle(color: Colors.white, fontSize: 20),
                                    )),
                                height: 50,
                                decoration: BoxDecoration(
                                    color: Colors.deepPurpleAccent,
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(15)),
                                    border:
                                    Border.all(color: Colors.white, width: 2)),
                              ),
                              onTap: () {
                                controller.changedatainfo(0);
                              },
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              hoverColor: Colors.white,
                              child: Container(
                                child: Center(
                                    child: Text(
                                      'العروض و الخصومات',
                                      style: TextStyle(color: Colors.white, fontSize: 20),
                                    )),
                                height: 50,
                                decoration: BoxDecoration(
                                    color: Colors.deepPurpleAccent,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15)),
                                    border:
                                    Border.all(color: Colors.white, width: 2)),
                              ),
                              onTap: () {
                                controller.changedatainfo(1);
                              },
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Expanded(
                    child: controller.datainfo[controller.datainfoindex]),

              ]),
            );
          },),
    );
  }
}
