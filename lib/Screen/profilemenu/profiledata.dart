import 'package:atebaa/component/component.dart';
import 'package:atebaa/controller/homecontroller.dart';
import 'package:atebaa/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import '../../component/second component.dart';

class ProfileData extends StatelessWidget {
  ProfileData({super.key});

  TextEditingController name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: GetBuilder<homecontroller>(
      init: homecontroller(),
      builder: (controller) {
        return Scaffold(
          body: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
              IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(Icons.arrow_forward_rounded)),
              Gap(20),
              Center(
                child: InkWell(
                    onTap: () {
                      controller.getimage();
                    },
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: controller.fImage == null
                                ? Container(
                                    width: 150,
                                    height: 150,
                                    color: Appcolor().firstcolor,
                                  )
                                : Image.file(controller.fImage!,
                                    width: 150, height: 150, fit: BoxFit.cover),
                            //Image(image: AssetImage('images/pngegg.png'), width: 150),
                          ),
                        ),
                        Positioned(
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(150),
                              child: Container(
                                width: 35,height: 35,
                                  color: Appcolor().firstcolor,
                                  child: Icon(Icons.camera_alt, size: 18,color: Appcolor().thirdcolor,))),
                          right: 0,
                          bottom: 10,
                        ),
                      ],
                    )),
              ),
              Gap(13),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Container(
                    height: 60,
                    child: textInputform(
                        IconColor: Appcolor().firstcolor,
                        FillColor: Colors.white,
                        PrefIcon: Icon(Icons.person),
                        LableText: 'الاسم الشخصي',
                        HintText: 'محمد كامل ابو مسعد',
                        Scure: false,
                        radius: 10,
                        controller: name)),
              ),
              Gap(13),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Container(
                    height: 60,
                    child: textInputform(
                        IconColor: Appcolor().firstcolor,
                        FillColor: Colors.white,
                        PrefIcon: Icon(Icons.map),
                        LableText: 'العنوان بالتفصيل',
                        HintText: 'العنوان بالتفصيل',
                        Scure: false,
                        radius: 10,
                        controller: name)),
              ),
              Gap(13),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Container(
                  height: 60,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Appcolor().thirdcolor,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(0.0),
                        child: Icon(
                          Icons.phone_enabled,
                          color: Appcolor().firstcolor,
                        ),
                      ),
                      hintText: 'رقم الهاتف',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
              ),
              Gap(13),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Container(
                    height: 60,
                    child: textInputform(
                        IconColor: Appcolor().firstcolor,
                        FillColor: Colors.white,
                        PrefIcon: Icon(Icons.location_on_outlined),
                        LableText: 'المحافظة',
                        HintText: 'المحافظة',
                        Scure: false,
                        radius: 10,
                        controller: name)),
              ),
              Gap(8),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Container(
                    height: 60,
                    child: textInputform(
                        IconColor: Appcolor().firstcolor,
                        FillColor: Colors.white,
                        PrefIcon: Icon(Icons.location_on_outlined),
                        LableText: 'المدينة',
                        HintText: 'المدينة',
                        Scure: false,
                        radius: 10,
                        controller: name)),
              ),
              Gap(13),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: TextFormField(
                  maxLines: 4,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.pending_actions,color: Appcolor().firstcolor,),
                    labelText: 'نبذه',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    fillColor: Appcolor().thirdcolor,
                    filled: true,
                  ),

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'نبذه';
                    }
                    return null;
                  },
                ),
              ),

              Gap(13),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: buttons('حفظ', 50, double.infinity, 24,
                    Appcolor().firstcolor, Colors.white, () {}, 24),
              ),
                  Gap(15),

            ]),
          ),
        );
      },
    ));
  }
}
