
import 'package:atebaa/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget textInputform({
  @required Color? IconColor,
  @required Color? FillColor,
  @required Widget? PrefIcon,
  @required String? LableText,
  @required String? HintText,
  required bool Scure,
  @required double? radius,
  @required TextEditingController? controller,

}) {
  return  TextField(
      decoration: InputDecoration(
          prefixIconColor: IconColor,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(radius!)),
          filled: true,
          fillColor: FillColor,
          prefixIcon: PrefIcon,
          labelText: LableText,
          hintText: HintText),
      obscureText: Scure,
      controller: controller);
}

Widget IconButtons({
  @required String? TextButton,
  @required double? height,
  @required double? width,
  @required double? TextFont,
  @required Color? ButtonColor,
  @required Color? TextColor,
  @required VoidCallback? ontap,
  @required double? radius,
}) => ElevatedButton(onPressed: ontap,
  style: ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius!)),
    minimumSize: Size(width!, height!),
    primary: ButtonColor,
  ),
  child: Text(
    '$TextButton',
    style: TextStyle(
        color: TextColor, fontSize: TextFont, fontFamily: 'ElMessiri-Bold'),
  ),);

Widget InputInfoDocForm({

  required Widget? PrefIcon,
  required String? LableText,
  required String? HintText,
  required bool Scure,
  required TextEditingController? controller,
  required TextInputType TybeInput,

}) {
  return  Padding(
    padding: const EdgeInsets.only(right: 16,left: 16,top: 13),
    child: Container(
      height: 50,
      child: TextField(
        keyboardType: TybeInput,
          decoration: InputDecoration(
              prefixIconColor: Appcolor().firstcolor,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              filled: true,
              fillColor: Appcolor().thirdcolor,
              prefixIcon: PrefIcon,
              labelText: LableText,
              hintText: HintText),
          obscureText: Scure,
          controller: controller),
    ),
  );
}
