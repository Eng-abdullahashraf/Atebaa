
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