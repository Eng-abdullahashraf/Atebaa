import 'package:atebaa/Screen/navscreens/firstscreen.dart';
import 'package:atebaa/component/component.dart';
import 'package:atebaa/controller/homecontroller.dart';
import 'package:atebaa/onboarding/OnboardingModel.dart';
import 'package:atebaa/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class onboarding extends StatelessWidget {
  const onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder(
        init: homecontroller(),
        builder: (controller) {
          // return controller.onboardingindex<=3?onboardingstyle(
          //     onboardinglist, controller.onboardingindex, context):FirstScreen();
          return FirstScreen();
        },
      ),
    );
  }
}

Widget onboardingstyle(items, index, context) => GetBuilder<homecontroller>(
      init: homecontroller(),
      builder: (controller) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(image: AssetImage(items[index].image!),
                  height: MediaQuery.of(context).size.width,
                  width: MediaQuery.of(context).size.width),
              Gap(14),
              Text(items[index].title!,
                  style: TextStyle(
                      color: Appcolor().firstcolor,
                      fontSize: 24,
                      fontFamily: 'ElMessiri-Bold')),
              Gap(14),
              Text(items[index].text!,
                  style: TextStyle(
                      color: Appcolor().firstcolor,
                      fontSize: 18,
                      fontFamily: 'ElMessiri-Bold'),
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center),
              Gap(14),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(4,
                      (index) => buildDot(index, controller.onboardingindex))),
              Gap(10),
              buttons('التالى', 45, double.infinity, 18, Appcolor().firstcolor,
                  Appcolor().thirdcolor, () {
                controller.onboardingnext(context);
              }, 10),
              SizedBox(
                child: controller.onboardingindex == 3
                    ? Center()
                    : TextButton(
                        onPressed: () {
                          controller.onboardingscape();
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FirstScreen(),
                              ));
                        },
                        child: Text(
                          'تخطى',
                          style: TextStyle(
                              color: Appcolor().firstcolor,
                              fontSize: 18,
                              fontFamily: 'ElMessiri-Bold'),
                        )),
              )
            ],
          ),
        );
      },
    );

Widget buildDot(index, currentIndex) => Container(
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: index == currentIndex ? 20 : 6,
      decoration: BoxDecoration(
          color: index == currentIndex ? Appcolor().firstcolor : Colors.grey,
          borderRadius: BorderRadius.circular(3)),
    );
