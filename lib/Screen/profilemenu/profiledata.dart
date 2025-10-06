import 'package:atebaa/component/component.dart';
import 'package:atebaa/controller/homecontroller.dart';
import 'package:atebaa/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import '../../component/second component.dart';

class ProfileData extends StatelessWidget {
  ProfileData({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController whatsappController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<homecontroller>(
        init: homecontroller(),
        builder: (controller) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () => Get.back(),
                    icon: const Icon(Icons.arrow_forward_rounded),
                  ),
                  const Gap(20),
                  Center(
                    child: InkWell(
                      onTap: controller.getimage,
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
                                  : Image.file(
                                controller.fImage!,
                                width: 150,
                                height: 150,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            right: 0,
                            bottom: 10,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(150),
                              child: Container(
                                width: 35,
                                height: 35,
                                color: Appcolor().firstcolor,
                                child: Icon(
                                  Icons.camera_alt,
                                  size: 18,
                                  color: Appcolor().thirdcolor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Gap(13),
                  buildInputField('الاسم الشخصي', 'محمد كامل ابو مسعد', Icons.person, nameController),
                  Gap(13),
                  buildInputField('العنوان بالتفصيل', 'العنوان بالتفصيل', Icons.map, addressController),
                  Gap(13),
                  buildNumberField('رقم الهاتف', phoneController),
                  Gap(13),
                  buildNumberField('رقم الواتساب', whatsappController),
                  Gap(13),
                  buildInputField('البريد الالكتروني', 'mail@comp.com', Icons.location_on_outlined, emailController),
                  Gap(13),
                  buildDropdownField(controller.dropGovvalue, controller.dropGoverItems!, controller.changgovdrop),
                  Gap(13),
                  buildDropdownField(controller.dropCityvalue, controller.dropCityItems, controller.changcityedrop),
                  const Gap(13),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: buttons(
                      'حفظ',
                      50,
                      double.infinity,
                      24,
                      Appcolor().firstcolor,
                      Colors.white,
                          () {},
                      24,
                    ),
                  ),
                  const Gap(15),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildInputField(String label, String hint, IconData icon, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SizedBox(
        height: 60,
        child: textInputform(
          IconColor: Appcolor().firstcolor,
          FillColor: Colors.white,
          PrefIcon: Icon(icon),
          LableText: label,
          HintText: hint,
          Scure: false,
          radius: 10,
          controller: controller,
        ),
      ),
    );
  }

  Widget buildNumberField(String hint, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SizedBox(
        height: 60,
        child: TextFormField(
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            filled: true,
            fillColor: Appcolor().thirdcolor,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            prefixIcon: Padding(
              padding: EdgeInsets.zero,
              child: Icon(
                Icons.phone_enabled,
                color: Appcolor().firstcolor,
              ),
            ),
            hintText: hint,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildDropdownField(String? value, List<String> items, Function(String?) onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Appcolor().thirdcolor,
          border: Border.all(color: Colors.black87),
          borderRadius: BorderRadius.circular(10),
        ),
        child: DropdownButtonFormField<String>(
          decoration: const InputDecoration(
            focusedBorder: InputBorder.none,
            border: InputBorder.none,
          ),
          value: value,
          items: items.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
