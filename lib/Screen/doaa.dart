import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../component.dart';
import '../controller/homecontroller.dart';
class DoaaScreen extends StatelessWidget {
  const DoaaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: SafeArea(
      child: GetBuilder<homecontroller>(
        init: homecontroller(),
        builder: (controller) =>  Column(
          children: [
            containerApp("بسم الله", "المقالة اليوميه",TextAlign.center),
            SizedBox(
              height: 10,
            ),
            containerApp("اللهم ارحمنا","المقالة اليوميه", TextAlign.center)
          ],
        ),
      ),
    ));
  }
}
