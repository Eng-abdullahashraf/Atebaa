import 'package:atebaa/Screen/uplaoddata.dart';
import 'package:atebaa/controller/homecontroller.dart';
import 'package:atebaa/theme/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';

class Aboutus extends StatelessWidget {
   Aboutus({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor().secondcolor,
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
                  height: 270,
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
                SizedBox(
                  height: 10,
                ),
                Divider(
                  height: 3,
                  color: Appcolor().firstcolor,
                ),
                SizedBox(
                  height: 10,
                ),
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Image(
                            image: AssetImage('images/telephone.png'),color: Appcolor().firstcolor,
                            width: 50,
                          ),
                        ),
                        onTap: () {
                          Calling();
                        },
                      ), // phone
                      InkWell(
                        child: Image(
                          image: AssetImage('images/facebook.png'),color: Appcolor().firstcolor,
                          width: 50,

                        ),
                        onTap: () {
                          Facebook();
                        },
                      ),// face
                      InkWell(
                        child: Image(
                          image: AssetImage('images/whatsapp.png'),color: Appcolor().firstcolor,
                          width: 50,

                        ),
                        onTap: () {
                          Whatsapp();
                        },
                      ),// whatsapp
                      InkWell(
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Image(
                            image: AssetImage('images/linkedin.png'),color: Appcolor().firstcolor,
                            width: 50,

                          ),
                        ),
                        onTap: () {
                          Linkedin();
                        },
                      ),// linked in
                      InkWell(
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Image(
                            image: AssetImage('images/share.png'),color: Appcolor().firstcolor,
                            width: 50,
                          ),
                        ),
                        onTap: () {
                          Share.share('برنامج اندرويد خفيف و ذكي صمم لمنفعتك و ليسهل عليك الوصول إلى أي طبيب في مُحيطك و التواصل معه بكل بساطة'
                              'قال تعالى: ﴿ وَافْعَلُوا الْخَيْرَ لَعَلَّكُمْ تُفْلِحُونَ ﴾'
                                                           ''' [الحج: 77].
                                                           '''
                              'وعن أبي هريرة عن النبي صلى الله عليه وسلم قال:'
                              """
                             من نفَّس عن مسلم كربة من كُرب الدنيا، نفَّس الله عنه كربة من كُرب يوم القيامة، ومن يسَّر على معسر، يسَّر الله عليه في الدنيا والآخرة، ومن ستر على مسلمٍ ستر الله عليه في الدنيا والآخرة، والله في عون العبد ما كان العبد في عون أخيه.
                             
"""


                              ''' حرصناايضا في هذا البرنامج علي سهولة الاستخدام يمكن لأي شخص يتمكن من القراءة من استخدامه التطبيق بكل بساطه..
                              
'''
                              'و المميز في هذا البرنامج أنه دمج بين جميع اسباب الشفاء المادية كالذهاب للطبيب و الاستعانة بالله و هي الأهم لأن الشفاء من الله سبحانه وتعالى و ايضا الوقاية بالنصائح المحمدية الطبيه و النصائح العامة و المعرفة العمومية من خلال المقالات الطبية النافعه'

                              '''و هذا ليس كل شيء انتظروا منّا الكثير و المفيد دائما..
                              
'''
                              ''' و أخيراً.. "الدال علي الخير كفاعله" لا تدع منفعة الناس تقف عندك, انشره ليصل لأكبر عدد ممكن, فبنشره سينالك الأجر انت أيضاً'''
'''
                                                                               رابط التحميل: '''
                              'https://play.google.com/store/apps/details?id=com.tecs.atebaa )'
                          ) ;
                        },
                      ),// share
                    ],
                  ),
                ),
                // GetBuilder(
                //   init: homecontroller(),
                //   builder: (controller) =>
                //       IconButton(
                //         onPressed: () {
                //           if(controller.x==4){
                //             Get.to(Uploaddata());
                //           }
                //           else{
                //             controller.changestate();
                //           }
                //         },
                //         icon: Icon(
                //           Icons.add_circle,
                //           color: Appcolor().secondcolor,
                //         )
                //       ),
                // )
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

  Calling() async {
    const url = "tel:+01001050863";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "لا يمكن تحميل رابط URL";
    }
  }

  Whatsapp() async {
    const url = "https://wa.me/message/LNHQM734SP6CM1";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "لا يمكن تحميل رابط URL";
    }
  }

  Facebook() async {
    const url = "https://www.facebook.com/techsollution";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "لا يمكن تحميل رابط URL";
    }
  }
  // Share() async {
  //   const url = "https://www.facebook.com/techsollution";
  //   if (await canLaunch(url)) {
  //     await launch(url);
  //   } else {
  //     throw "لا يمكن تحميل رابط URL";
  //   }
  // }
  Linkedin() async {
    const url = "https://www.linkedin.com/in/tecs-techsolution/";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "لا يمكن تحميل رابط URL";
    }
  }

}
