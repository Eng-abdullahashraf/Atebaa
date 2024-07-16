import 'package:atebaa/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

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
  return TextField(
      decoration: InputDecoration(
          prefixIconColor: IconColor,
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(radius!)),
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
}) =>
    ElevatedButton(
      onPressed: ontap,
      style: ElevatedButton.styleFrom(
        backgroundColor: ButtonColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius!)),
        minimumSize: Size(width!, height!),
        //primary: ButtonColor,
      ),

      child: Text(
        '$TextButton',
        style: TextStyle(
            color: TextColor, fontSize: TextFont, fontFamily: 'ElMessiri-Bold'),
      ),
    );

Widget InputInfoDocForm({
  required Widget? PrefIcon,
  required String? LableText,
  required String? HintText,
  required bool Scure,
  required TextEditingController? controller,
  required TextInputType TybeInput,
}) {
  return Padding(
    padding: const EdgeInsets.only(right: 16, left: 16, top: 13),
    child: Container(
      height: 50,
      child: TextField(
          keyboardType: TybeInput,
          decoration: InputDecoration(
              prefixIconColor: Appcolor().firstcolor,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
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

Widget cardField() => Center(
      child: Container(
        height: 200,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.grey,
                  offset: Offset(1, 1),
                  spreadRadius: .2,
                  blurRadius: 2)
            ],
            color: Appcolor().thirdcolor,
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      height: 120,
                      width: 80,
                      child: Image(
                          fit: BoxFit.fitHeight,
                          image: AssetImage(
                            "images/pngegg.png",
                          ))),
                ),
                Gap(10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Appcolor().secondcolor,
                              boxShadow: [
                                BoxShadow(
                                    color: Appcolor().firstcolor,
                                    offset: Offset(1, 1)),
                              ],
                              borderRadius: BorderRadius.horizontal(
                                  left: Radius.circular(20),
                                  right: Radius.circular(20))),
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            children: [
                              Icon(
                                Icons.check_circle,
                                size: 15,
                                color: Appcolor().firstcolor,
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Text(
                                "مشترك",
                                style: TextStyle(
                                    color: Appcolor().firstcolor, fontSize: 15),
                              )
                            ],
                          ),
                        ),
                        Gap(100),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.favorite,
                              color: Appcolor().firstcolor),
                        )
                      ],
                    ),
                    Text(
                      "د.محمد عادل",
                      style: TextStyle(
                          fontSize: 22, color: Colors.black87, height: .7,fontFamily: 'ElMessiri-Bold'),
                    ),
                    Text(
                      "باطنة",
                      style: TextStyle(
                          fontSize: 18,
                          color: Appcolor().firstcolor,
                          height: 2,fontFamily: 'ElMessiri-Bold'),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.star_rate,
                          color: Colors.yellow,
                        ),
                        Icon(
                          Icons.star_rate,
                          color: Colors.yellow,
                        ),
                        Icon(
                          Icons.star_rate,
                          color: Colors.yellow,
                        ),
                        Icon(
                          Icons.star_rate,
                          color: Colors.yellow,
                        ),
                        Icon(
                          Icons.star_rate,
                          color: Colors.yellow,
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 3),
                          child: Text("٤.٩",
                              style: TextStyle(

                                  fontSize: 15.5,
                                  color: Appcolor().firstcolor,
                                  fontWeight: FontWeight.w400)),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          "٥٨ مراجعة",
                          style: TextStyle(
                              fontSize: 12,
                              color: Appcolor().gray,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
            Container(
              width: 300,
              height: 35,
              child: Center(
                  child: Text(
                "عرض التفاصيل..",
                style: TextStyle(color: Appcolor().firstcolor,fontFamily: 'ElMessiri-Bold'),
              )),
              decoration: BoxDecoration(
                color: Appcolor().secondcolor,
                boxShadow: [
                  BoxShadow(
                      color: Appcolor().gray,
                      blurRadius: 1,
                      offset: Offset(.5, .5)),
                ],
              ),
            )
          ],
        ),
      ),
    );
