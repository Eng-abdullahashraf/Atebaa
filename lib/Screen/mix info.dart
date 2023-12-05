import 'package:animated_conditional_builder/animated_conditional_builder.dart';
import 'package:atebaa/component.dart';
import 'package:atebaa/controller/homecontroller.dart';
import 'package:atebaa/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MixInfo extends StatelessWidget {
  MixInfo({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<homecontroller>(
        init: homecontroller(),
        builder: (controller) => Scaffold(
          backgroundColor: Appcolor().secondcolor,
          body: AnimatedConditionalBuilder(
              condition: controller.load!,
              builder: (BuildContext context){
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Center(
                          child: Text(
                            "تذكرة",
                            style: TextStyle(
                                fontFamily: "ElMessiri-Bold",
                                color: Appcolor().thirdcolor,
                                fontSize: 25),
                          )),
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10)),
                        color: Appcolor().firstcolor,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(child: Container(
                      child: ListView.separated(
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, i) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10,bottom: 10),
                              child: containerApp(controller.doaadata![i]["المحتوي"], controller.doaadata![i]["العنوان"], TextAlign.center,homecontroller().colorCon!),
                            );
                          },
                          separatorBuilder: (context, i) =>
                              SizedBox(height: 0),
                          itemCount: controller.doaadata!.length),
                    )),

                    /* containerApp("وَإِذَا مَرِضْتُ فَهُوَ يَشْفِينِ  (80 الشعراء)","اّيه:",
                  TextAlign.center),
              SizedBox(height: 8),

              containerApp(
                  "«إذا أَصَابَتْ أَحَدَكُمْ الحُمَّى وَإنَّ الحُمَّى قِطْعةٌ مِنَ ا"
                  "لنَّارِ فَلْيُطفئهَا بالمَاءِ البَارِدِ، ويَسْتَقبِلْ نَهْراً جارياً، فَلْيستقبلْ جَرْيَةَ ال"
                  "مَاءِ بعدَ الفَجْرِ وقَبْلَ طُلُوعِ الشَّمْسِ، وليقلْ: بِسْمِ اللهِ، اللَّهُمَّ اشْفِ عَبْد"
                  "َكَ، وصَدِّقْ رَسُولَك. وينغمِسُ فيهِ ثلاثَ غَمَسَاتٍ ثلاثةَ أيامٍ، فإنْ برئَ، وإل"
                  "ا ففِى خمسٍ، فإن لمْ يبرَأْ في خمس، فسبع، فإن لم يبرأ في "
                  "سبع فتسع، فإنها لا تكادُ تُجاوز تسعاً بإذنِ اللهِ».","نصيحه نبويه:",
                  TextAlign.center),
              SizedBox(
                height: 8,
              ),

              containerApp(
                  "1 -شرب الكثير من المياه\n"
                  '2 -اتبع نظاما غذائيا صحيا بما يناسبك مما تحبه من الطعام.\n'
                  "3 -نام ما لا يقل عن 8 ساعات يوميا.\n"
                  "4 -ارتد الثياب النظيفة ذات الرائحة العطرة.\n"
                  "5 -الاستحمام على الأقل مرة فى اليوم.","نصيحه اليوم:",
                  TextAlign.start),
              SizedBox(
                height: 8,
              ),

              containerApp(
                  "ما هي أسباب مرض الزهري؟"
                  " واتس ابشاركغرد "
                  "            يُعدّ الزهري (Syphilis) من الأمراض المنقولة جنسيًا، وإنّ حالات الإصابة بهذا المرض في ازدياد وخاصة في الدول الغربية."
                  " وهو من الأمراض التي تُسبب مشاكل صحية خطيرة إذا تُركت دون علاج"
                  "    أسباب الإصابة بمرض الزهري"
                  "    إنّ سبب الإصابة بمرض الزهري هو عدوى بكتيرية؛ بمعنى إذا أصابت هذه البكتيريا الشخص فإنّه يُصاب بمرض الزهري"
                  "، وهذه البكتيريا اسمها الجرثومة الملتوية اللولبية الشاحبة (Treponema pallidum)."
                  "    قد تتساءل كيف تصل هذه البكتيريا إلى الإنسان؟ والجواب مفصل في الآتي:"
                  "    إنّ أكثر طريقة شائعة تصل فيها بكتيريا الزهري للإنسان هي العلاقة الجنسية مع شخص مصاب بالمرض."
                  "    تدخل البكتيريا أثناء العلاقة الجنسية عن طريق أي جرح أو قرحة موجودة، سواء بالأعضاء الجنسية أو الفم أو حتى فتحة الشرج."
                  "    قد تدخل البكتيريا إلى الجسم بمجرد ملامسة أو تقبيل المصاب؛ إذا كان ذلك على موضع فيه جرح أو قرحة."
                  "    يمكن أن تنتقل العدوى من الأم إلى ابنها خلال الحمل أو أثناء الولادة."
                  " في بعض الأحيان تنتقل العدوى من الأم إلى ابنها عن طريق الرضاعة الطبيعية."
                  "    لا تنتقل العدوى بمجرد ملامسة الأشياء التي لامسها المصاب بالزهري، حتى وإن كانت يد المصاب فيها قروح الزهري."
                  "    لا تنتقل العدوى باستخدام المرحاض أو أدوات الطعام أو برك السباحة التي استخدمها المصاب."
                  "    إذا تعالج المصاب وشفي تمامًا من الزهري فلن تعود العدوى إليه مرة أخرى إلا إذا خالط المصابين بالزهري (بالطرق المذكورة)."
                  "  عوامل تزيد فرصة الإصابة بالزهري "
                  "    إنّ فرصة الإصابة بالزهري ترتفع كثيرًا في حال ممارسة العلاقات الجنسية المحرمة دينيًا؛ كالعلاقات الجنسية مع غير الأزواج،"
                  " أو العلاقات الجنسية الشاذة، وكذلك تكون فرصة المصابين بالإيدز أعلى مقارنة من غير المصابين."
                  " حتى متى يبقى مريض الزهري معديًا؟"
                  "    بداية يجب أن نعرف أنّ أعراض الزهري لا تظهر بعد الإصابة بالمرض مباشرة، وإنّما تحتاج تقريبًا إلى 3 أسابيع حتى تظهر، بمعنى أنّ الشخص يتعرض للبكتيريا ويصاب بها ولكن تظهر عليه الأعراض بعد 21 يوميًا من ذلك"
                  ". وربما تظهر الأعراض في وقت أبكر من ذلك أو أكثر."
                  "    وللإجابة بتفصيل عن موضوع العدوى اقرأ النقاط الآتية من فضلك:"
                  "    يُعتبر الشخص مُعديًا وناقلًا للمرض بمجرد إصابته بالمرض حتى لو لم تظهر عليه أي أعراض (علمًا بأنّ بعض المصابين لا يُلاحظون الأعراض لأنها ممكن أن تكون قرحة مخفية في الأعضاء التناسلية."
                  "    يبقى الشخص مُعديًا حتى يتعالج باستخدام المضادات الحيوية المناسبة"
                  "    أغلب حالات الزهري لا تكون معدية في المرحلة الثالثة من المرض (هذه المرحلة لا يصلها جميع المصابين، وفي هذه المرحلة تظهر المضاعفات وأعراض تلف الأعضاء)."
                  " "
                  "    ملخص المقال"
                  "    إنّ سبب الإصابة بمرض الزهري هو وصول بكتيريا الجرثومة الملتوية اللولبية إلى الجسم؛ وذلك عن طريق ممارسة العلاقة الجنسية مع شخص مصاب بالزهري؛ إذ تنتقل البكتيريا عبر القروح أو الجروح من المصاب إلى السليم فتُسبب له العدوى. وترتفع فرصة الإصابة بهذا المرض بين الأشخاص الذين يمارسون العلاقات المحرمة شرعًا.",
                  "المقالة اليوميه",TextAlign.center),*/
                  ],
                );
              },
              fallback: (BuildContext context) =>
              Center(child: CircularProgressIndicator()))

        ),
      ),
    );
  }
}
