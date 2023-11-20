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
      builder: (controller) =>  Column(
          children: [
            containerApp("بسم الله", TextAlign.center),
            SizedBox(
              height: 10,
            ),
            containerApp("بسم الله", TextAlign.center)
          ],
        ),
      ),
    );
  }
}
