import 'package:atebaa/component.dart';
import 'package:atebaa/controller/homecontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AyatScreen extends StatelessWidget {
  const AyatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: GetBuilder<homecontroller>(
      init: homecontroller(),
      builder: (controller) =>  Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            children: [
              containerApp("بسم الله", TextAlign.center),
              SizedBox(
                height: 25,
              ),
              containerApp("",TextAlign.center),
            ],
          ),
      ),
      ),
    );
  }
}
