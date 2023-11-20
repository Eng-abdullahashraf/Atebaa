import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:atebaa/theme/colors.dart';

Widget textwrite({
  @required Color? Iconcolor,
  @required Color? Fillcolor,
  @required Widget? PrefIcon,
  @required String? LableText,
  @required String? HintText,
  @required String? value,
  required bool Scure,
  @required double? radius,
  @required TextEditingController? controller,
  required TextInputType form,
}) {
  return Container(
    child: TextField(
        keyboardType: form,
        decoration: InputDecoration(
            prefixIconColor: Iconcolor,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius!)),
            filled: true,
            fillColor: Fillcolor,
            prefixIcon: PrefIcon,
            labelText: LableText,
            hintText: HintText),
        obscureText: Scure,
        controller: controller),
  );
}

Widget buttons(
  @required String? textbutton,
  @required double? height,
  @required double? width,
  @required double? textfont,
  @required Color? buttoncolor,
  @required Color? textcolor,
  @required VoidCallback? ontap,
  @required double? radius,
) =>
    ElevatedButton(
      onPressed: ontap,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius!)),
        minimumSize: Size(width!, height!),
        primary: buttoncolor,
      ),
      child: Text(
        '$textbutton',
        style: TextStyle(
            color: textcolor, fontSize: textfont, fontFamily: 'ElMessiri'),
      ),
    );

Widget doctorItem(doctors,i) => Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Container(
        decoration: BoxDecoration(
            color: Appcolor().thirdcolor,
            borderRadius: BorderRadius.circular(25)),
        height: 150.0,
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
                height: 110,
                child: Icon(
                  Icons.person,
                  size: 110,
                )),
            SizedBox(width: 5.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${doctors[i]["name"]}",
                  style: TextStyle(
                      color: Appcolor().firstcolor,
                      fontFamily: "ElMessiri-Bold",
                      fontSize: 20),
                ),
                Container(
                    decoration: BoxDecoration(
                      color: Appcolor().secondcolor,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10,right: 10),
                      child: Text(
                        "${doctors[i]["special"]}",
                        style: TextStyle(fontSize: 18),
                      ),
                    )),
                Text("${doctors[i]["address"]}",style: TextStyle(fontSize: 18),),
                Text("(+20) ${doctors[i]["phone"]}",style: TextStyle(fontSize: 18),),
              ],
            )
          ],
        ),
      ),
    );

Widget circular()=>CircularProgressIndicator();

Widget collu(var data)=>Column(
  children: [
    SizedBox(
      height: 10,
    ),
    Expanded(
        child: Container(
            child: ListView.separated(
                scrollDirection: Axis.vertical,
                itemBuilder: (context, i) =>
                    doctorItem(data, i),
                separatorBuilder: (context, i) =>
                    SizedBox(height: 10),
                itemCount: data!.length))),
  ],
);
Widget containerApp(String textcontain,TextAlign textAlignCont){
  return Center(
    child: Container(
      decoration: BoxDecoration(boxShadow: [BoxShadow(
          color: Colors.black54,
          offset: Offset(4, 4),
          spreadRadius: 1,
          blurRadius: 15
      )],
          borderRadius: BorderRadius.circular(15),
          color: Appcolor().gray),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(textcontain,textAlign: textAlignCont,
          style: TextStyle(fontFamily: "ElMessiri-Bold",fontWeight: FontWeight.w200,color: Appcolor().thirdcolor),),
      ),
    ),
  );
  

}
Widget titleApp(String titleCont){
return Text(titleCont,style: TextStyle(fontFamily: "ElMessiri-Bold",color: Colors.black87,fontSize: 18),);
}
