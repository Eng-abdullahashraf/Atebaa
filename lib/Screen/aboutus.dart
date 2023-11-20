import 'package:atebaa/theme/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Aboutus extends StatelessWidget {
  const Aboutus({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( backgroundColor: Appcolor().secondcolor,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image(
              height: 300,
              image: AssetImage('images/docoo.png'),
            ),
            Column(
              children: [
                /*Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 18),
                    child:
                    Image(
                      height: 150,
                      image: AssetImage('images/atebaa.png'),
                      color: Appcolor().firstcolor,
                    ),
                  ),
                ),*/
                SizedBox(
                  height:270,
                ),
                Text(
                  'عنا',
                  style: TextStyle(fontSize: 40, fontFamily: "ElMessiri-Bold"),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    textAlign: TextAlign.center,
                    'لان سلامتك وراحتك غايتنا وهدفنا دائما قمنا بانشاء تطبيق اطباء الذى يسمح لك بالعثور على اى طبيب ف محيطك والتواصل معه باسهل طريقة..\n دمتم سالمين.',
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: "ElMessiri-Bold",
                        color: Colors.black),
                  ),
                ),
                SizedBox(height: 10,),
                Divider(height: 3,color: Appcolor().firstcolor,),
                SizedBox(height: 10,),
                Text(
                  'تواصل معنا',
                  style: TextStyle(fontSize: 30, fontFamily: "ElMessiri-Bold"),
                ),

                Container(
                  height: 70,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Appcolor().secondcolor,
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        child: CircleAvatar(backgroundColor:  Appcolor().thirdcolor,
                            child: Image(
                          image: AssetImage('images/face.png'),
                        )),onTap: (){
                          Facebook();
                      },
                      ),
                      InkWell(
                        child: CircleAvatar(backgroundColor: Appcolor().thirdcolor,
                            child: Image(
                              image: AssetImage('images/whats.png'),
                            )),onTap: (){
                          Whatsapp();
                      },
                      ),
                      InkWell(
                        child: CircleAvatar(backgroundColor: Appcolor().thirdcolor,
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Image(
                                image: AssetImage('images/phone.png'),
                              ),
                            )),
                        onTap: (){
                          Calling();
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
      /* Padding(
                              padding: const EdgeInsets.only(top: 200),
                              child: RichText(text: TextSpan(
                                children: [
                                  TextSpan(text: "صفحة الفيس بوك",style: TextStyle(color: Colors.black,fontSize: 22)),
                                  TextSpan(text: "اضغط هنا",style: TextStyle(color: Appcolor().firstcolor,fontSize: 15),
                                  recognizer: TapGestureRecognizer()..onTap =() async{
                                    var url ="https://www.facebook.com/techsollution";
                                    if(await canLaunch(url)){
                                      await launch(url);
                                    }
                                    else{
                                      throw "لا يمكن تحميل رابط URL";
                                    }
                                  })
                                ],
                              )),
                            )*/
    );
  }
  Calling()async{
    const url = "tel:+201220288992";
    if(await canLaunch(url)){
      await launch(url);
    }
    else{
      throw "لا يمكن تحميل رابط URL";
    }
  }
  Whatsapp()async{
    const url = "https://wa.me/qr/ZTCNIH7GQWRZL1";
    if(await canLaunch(url)){
      await launch(url);
    }
    else{
      throw "لا يمكن تحميل رابط URL";
    }
  }
  Facebook()async{
    const url = "https://www.facebook.com/techsollution";
    if(await canLaunch(url)){
      await launch(url);
    }
    else{
      throw "لا يمكن تحميل رابط URL";
    }
  }
}
