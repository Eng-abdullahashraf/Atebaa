import 'package:atebaa/Screen/mix%20info.dart';
import 'package:atebaa/controller/homecontroller.dart';
import 'package:atebaa/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Roqya extends StatelessWidget {
  Roqya({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<homecontroller>(
        init: homecontroller(),
        builder: (controller) => Scaffold(
          backgroundColor: Appcolor().secondcolor,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Center(
                    child: Text(
                  "الرقية الشرعية من الكتاب والسنة",
                  style: TextStyle(
                      fontFamily: "ElMessiri-Bold",
                      color: Appcolor().thirdcolor,
                      fontSize: 18),
                )),
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  color: Appcolor().firstcolor,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                            child: Text(
                          'شروط الرقية الشرعية',
                          style: TextStyle(
                              fontFamily: 'ElMessiri-Bold',
                              color: Colors.red,
                              fontSize: 25),
                        )),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '1- أن تكون الرقية بكلام الله وصفاته.',
                          style: TextStyle(
                              fontFamily: 'ElMessiri-Bold',
                              color: Colors.black,
                              fontSize: 12),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '2- أن تكون الرقية بالغة العربية أو بما يفهم معناها من غيرها.',
                          style: TextStyle(
                              fontFamily: 'ElMessiri-Bold',
                              color: Colors.black,
                              fontSize: 12),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '3- أن لا يعتقد الراقي أن الرقية تؤثر بذاتها بل بذات الله سبحانه وتعالى.',
                          style: TextStyle(
                              fontFamily: 'ElMessiri-Bold',
                              color: Colors.black,
                              fontSize: 12),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        GetBuilder<homecontroller>(
                          init: homecontroller(),
                          builder: (controller) {
                          return Row(
                            children: [
                              Expanded(
                                child: MaterialButton(
                                  onPressed: () {
                                    controller.showAppAdd();
                                    controller.changezekrdata(0);
                                  },
                                  color: controller.zekrnmuber==1 ?Appcolor().thirdcolor : Color(0xffbebac9),
                                  child: Text('الأيات',style: TextStyle(color: Appcolor().firstcolor,fontSize: 20,fontFamily: 'ElMessiri-Bold',)),

                                ),
                              ),
                              SizedBox(width: 5,),
                              Expanded(
                                child: MaterialButton(
                                  onPressed: () {
                                    controller.showAppAdd();
                                    controller.changezekrdata(1);

                                  },
                                  color: controller.zekrnmuber==0 ?Appcolor().thirdcolor : Color(0xffbebac9),
                                  child: Text('الأدعية',style: TextStyle(color: Appcolor().firstcolor,fontSize: 20,fontFamily: 'ElMessiri-Bold',)),

                                ),
                              ),
                            ],
                          );

                        },),
                        Expanded(child: GetBuilder<homecontroller>(
                            init: homecontroller(),
                            builder: (controller) {
                              return Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(border: Border.all(color: Appcolor().firstcolor,width: 1) ),
                                  child: SingleChildScrollView(child: controller.zekrScreens[controller.zekrnmuber!]));
                            },)),
                      ]),
                ),
              ),
            ],
          ),
          floatingActionButton: GetBuilder<homecontroller>(
            init: homecontroller(),
            builder: (controller) {
            return FloatingActionButton(
              onPressed: (){
                controller.showAppAdd();
                controller.getdoaa();
                Get.to(MixInfo());
                controller.loadings();

              } ,
              child:Icon(Icons.lightbulb,color: Colors.amber,size: 40),
              backgroundColor: Appcolor().thirdcolor,
            );
          },)
        ),
      ),
    );
  }
}
