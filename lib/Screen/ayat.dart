import 'package:atebaa/component.dart';
import 'package:atebaa/controller/homecontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AyatScreen extends StatelessWidget {
  const AyatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: GetBuilder<homecontroller>(
      init: homecontroller(),
      builder: (controller) =>  Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
              children: [
                containerApp("بسم الله", "المقالة اليوميه",TextAlign.center),
                SizedBox(
                  height: 10,
                ),
                containerApp(" وَنُنَزِّلُ مِنَ الْقُرْآنِ مَا هُوَ شِفَاءٌ وَرَحْمَةٌ لِلْمُؤْمِنِينَ وَلَا يَزِيدُ الظَّالِمِينَ إِلَّا خَسَارًا {الإسراء:82}."
                "[ الإسراء:" "82" "]","المقالة اليوميه",TextAlign.center),
                SizedBox(height: 10,),
                containerApp("قَاتِلُوهُمْ يُعَذِّبْهُمُ اللَّهُ بِأَيْدِيكُمْ وَيُخْزِهِمْ وَيَنْصُرْكُمْ عَلَيْهِمْ وَيَشْفِ صُدُورَ قَوْمٍ مُؤْمِنِينَ {التوبة:14}.","المقالة اليوميه", TextAlign.center),
                SizedBox(
                  height: 10,
                ),
                containerApp(" ثُمَّ كُلِي مِنْ كُلِّ الثَّمَرَاتِ فَاسْلُكِي سُبُلَ رَبِّكِ ذُلُلًا يَخْرُجُ مِنْ بُطُونِهَا شَرَابٌ مُخْتَلِفٌ أَلْوَانُهُ فِيهِ شِفَاءٌ لِلنَّاسِ إِنَّ فِي ذَلِكَ لَآيَةً لِقَوْمٍ يَتَفَكَّرُونَ {النحل:69}. ","المقالة اليوميه",TextAlign.center),
                SizedBox(height: 10,),
                containerApp("وَالَّذِي هُوَ يُطْعِمُنِي وَيَسْقِينِ * وَإِذَا مَرِضْتُ فَهُوَ يَشْفِينِ {الشعراء:79-80}.","المقالة اليوميه", TextAlign.center),
                SizedBox(height: 10,),
                containerApp("وَلَوْ جَعَلْنَاهُ قُرْآنًا أَعْجَمِيًّا لَقَالُوا لَوْلَا فُصِّلَتْ آيَاتُهُ أَأَعْجَمِيٌّ وَعَرَبِيٌّ قُلْ هُوَ لِلَّذِينَ آمَنُوا هُدًى وَشِفَاءٌ وَالَّذِينَ لَا يُؤْمِنُونَ فِي آذَانِهِمْ وَقْرٌ وَهُوَ عَلَيْهِمْ عَمًى أُولَئِكَ يُنَادَوْنَ مِنْ مَكَانٍ بَعِيدٍ {فصلت:44}.","المقالة اليوميه", TextAlign.center)
              ],
            ),
        ),
      ),
      ),
    );
  }
}
