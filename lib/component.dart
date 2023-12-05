import 'package:atebaa/controller/homecontroller.dart';
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
        height: 170.0,
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

Widget containerApp(String textcontain,String text,TextAlign textAlignCont,Color colorContainer){
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(boxShadow: [BoxShadow(
            color: Colors.black54,
           // offset: Offset(2, 2),
            spreadRadius: 1,
            blurRadius: 3
        )],
            borderRadius: BorderRadius.circular(15),
            color: colorContainer),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              titleApp(text),
              Text(textcontain,textAlign: textAlignCont,
                style: TextStyle(fontFamily: "ElMessiri-Bold",color: Colors.black),),
            ],
          ),
        ),
      ),
    ),
  );
  

}
Widget titleApp(String titleCont){
return Text(titleCont,style: TextStyle(fontFamily: "ElMessiri-Bold",color: Colors.black,fontSize: 18),);
}

Widget textFormApp(
    @required String name,
    @required TextEditingController? controller,
    @required TextInputType type

){
  return  TextField(
    decoration: InputDecoration(
      prefixIconColor: Appcolor().gray,
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15)),
      hintText: name,
      prefixIcon: Icon(Icons.search),
    ),
    controller: controller,
    keyboardType: type,
  );
}

Widget ayat()=>
    Column(
      children: [
        containerApp('{ الْحَمْدُ لِلَّهِ رَبِّ الْعَالَمِينَ * الرَّحْمَنِ الرَّحِيمِ * مَالِكِ يَوْمِ الدِّينِ * إِيَّاكَ نَعْبُدُ وَإِيَّاكَ نَسْتَعِينُ * اهْدِنَا الصِّرَاطَ الْمُسْتَقِيمَ * صِرَاطَ الَّذِينَ أَنْعَمْتَ عَلَيْهِمْ غَيْرِ الْمَغْضُوبِ عَلَيْهِمْ وَلا الضَّالِّينَ }', 'بسم الله الرحمن الرحيم', TextAlign.center,Colors.white),
        containerApp('{ الم * ذَلِكَ الْكِتَابُ لا رَيْبَ فِيهِ هُدًى لِلْمُتَّقِينَ * الَّذِينَ يُؤْمِنُونَ بِالْغَيْبِ وَيُقِيمُونَ الصَّلاة وَمِمَّا رَزَقْنَاهُمْ يُنفِقُونَ * وَالَّذِينَ يُؤْمِنُونَ بِمَا أُنْزِلَ إِلَيْكَ وَمَا أُنْزِلَ مِنْ قَبْلِكَ وَبِالآخرَةِ هُمْ يُوقِنُونَ * أُوْلَئِكَ عَلَى هُدًى مِنْ رَبِّهِمْ وَأُوْلَئِكَ هُمْ الْمُفْلِحُونَ }', 'بسم الله الرحمن الرحيم', TextAlign.center,Colors.white),
        containerApp(' { إِنَّ فِي خَلْقِ السَّمَوَاتِ وَالأَرْضِ وَاخْتِلافِ اللَّيْلِ وَالنَّهَارِ وَالْفُلْكِ الَّتِي تَجْرِي فِي الْبَحْرِ بِمَا يَنفَعُ النَّاسَ وَمَا أَنزَلَ اللَّهُ مِنْ السَّمَاءِ مِنْ مَاءٍ فَأَحْيَا بِهِ الأَرْضَ بَعْدَ مَوْتِهَا وَبَثَّ فِيهَا مِنْ كُلِّ دَابَّةٍ وَتَصْرِيفِ الرِّيَاحِ وَالسَّحَابِ الْمُسَخَّرِ بَيْنَ السَّمَاءِ وَالأَرْضِ لآيَاتٍ لِقَوْمٍ يَعْقِلُونَ }', 'بسم الله الرحمن الرحيم', TextAlign.center,Colors.white),
        containerApp('• { اللَّهُ لا إِلَهَ إِلاَّ هُوَ الْحَيُّ الْقَيُّومُ لا تَأْخُذُهُ سِنَةٌ وَلا نَوْمٌ لَهُ مَا فِي السَّمَوَاتِ وَمَا فِي الأَرْضِ مَنْ ذَا الَّذِي يَشْفَعُ عِنْدَهُ إِلاَّ بِإِذْنِهِ يَعْلَمُ مَا بَيْنَ أَيْدِيهِمْ وَمَا خَلْفَهُمْ وَلا يُحِيطُونَ بِشَيْءٍ مِنْ عِلْمِهِ إِلاَّ بِمَا شَاءَ وَسِعَ كُرْسِيُّهُ السَّمَوَاتِ وَالأَرْضَ وَلا يَئُودُهُ حِفْظُهُمَا وَهُوَ الْعَلِيُّ الْعَظِيمُ }', 'بسم الله الرحمن الرحيم', TextAlign.center,Colors.white),
        containerApp('• { آمَنَ الرَّسُولُ بِمَا أُنزِلَ إِلَيْهِ مِنْ رَبِّهِ وَالْمُؤْمِنُونَ كُلٌّ آمَنَ بِاللَّهِ وَمَلائِكَتِهِ وَكُتُبِهِ وَرُسُلِهِ لا نُفَرِّقُ بَيْنَ أَحَدٍ مِنْ رُسُلِهِ وَقَالُوا سَمِعْنَا وَأَطَعْنَا غُفْرَانَكَ رَبَّنَا وَإِلَيْكَ الْمَصِيرُ * لا يُكَلِّفُ اللَّهُ نَفْساً إِلاَّ وُسْعَهَا لَهَا مَا كَسَبَتْ وَعَلَيْهَا مَا اكْتَسَبَتْ رَبَّنَا لا تُؤَاخِذْنَا إِنْ نَسِينَا أَوْ أَخْطَأْنَا رَبَّنَا وَلا تَحْمِلْ عَلَيْنَا إِصْراً كَمَا حَمَلْتَهُ عَلَى الَّذِينَ مِنْ قَبْلِنَا رَبَّنَا وَلا تُحَمِّلْنَا مَا لا طَاقَةَ لَنَا بِهِ وَاعْفُ عَنَّا وَاغْفِرْ لَنَا وَارْحَمْنَا أَنْتَ مَوْلانَا فَانصُرْنَا عَلَى الْقَوْمِ الْكَافِرِينَ }','بسم الله الرحمن الرحيم', TextAlign.center,Colors.white),
        containerApp('{ إِنَّ رَبَّكُمْ اللَّهُ الَّذِي خَلَقَ السَّمَوَاتِ وَالأَرْضَ فِي سِتَّةِ أَيَّامٍ ثُمَّ اسْتَوَى عَلَى الْعَرْشِ يُغْشِي اللَّيْلَ النَّهَارَ يَطْلُبُهُ حَثِيثاً وَالشَّمْسَ وَالْقَمَرَ وَالنُّجُومَ مُسَخَّرَاتٍ بِأَمْرِهِ أَلا لَهُ الْخَلْقُ وَالأَمْرُ تَبَارَكَ اللَّهُ رَبُّ الْعَالَمِينَ }',  'بسم الله الرحمن الرحيم', TextAlign.center,Colors.white),
        containerApp('{ إِنَّ فِي خَلْقِ السَّمَوَاتِ وَالأَرْضِ وَاخْتِلافِ اللَّيْلِ وَالنَّهَارِ لآيَاتٍ لأُولِي الأَلْبَابِ * الَّذِينَ يَذْكُرُونَ اللَّهَ قِيَاماً وَقُعُوداً وَعَلَى جُنُوبِهِمْ وَيَتَفَكَّرُونَ فِي خَلْقِ السَّمَوَاتِ وَالأَرْضِ رَبَّنَا مَا خَلَقْتَ هَذَا بَاطِلاً سُبْحَانَكَ فَقِنَا عَذَابَ النَّارِ }',  'بسم الله الرحمن الرحيم', TextAlign.center,Colors.white),
        containerApp('{ أَفَحَسِبْتُمْ أَنَّمَا خَلَقْنَاكُمْ عَبَثاً وَأَنَّكُمْ إِلَيْنَا لا تُرْجَعُونَ * فَتَعَالَى اللَّهُ الْمَلِكُ الْحَقُّ لا إِلَهَ إِلاَّ هُوَ رَبُّ الْعَرْشِ الْكَرِيمِ * وَمَنْ يَدْعُ مَعَ اللَّهِ إِلَهاً آخَرَ لا بُرْهَانَ لَهُ بِهِ فَإِنَّمَا حِسَابُهُ عِنْدَ رَبِّهِ إِنَّهُ لا يُفْلِحُ الْكَافِرُونَ * وَقُلْ رَبِّ اغْفِرْ وَارْحَمْ وَأَنْتَ خَيْرُ الرَّاحِمِينَ }', 'بسم الله الرحمن الرحيم', TextAlign.center,Colors.white),
        containerApp('{ وَأَوْحَيْنَا إِلَى مُوسَى أَنْ أَلْقِ عَصَاكَ فَإِذَا هِيَ تَلْقَفُ مَا يَأْفِكُونَ * فَوَقَعَ الْحَقُّ وَبَطَلَ مَا كَانُوا يَعْمَلُونَ * فَغُلِبُوا هُنَالِكَ وَانقَلَبُوا صَاغِرِينَ }', 'بسم الله الرحمن الرحيم', TextAlign.center,Colors.white),
        containerApp(' { وَقَالَ فِرْعَوْنُ ائْتُونِي بِكُلِّ سَاحِرٍ عَلِيمٍ * فَلَمَّا جَاءَ السَّحَرَةُ قَالَ لَهُمْ مُوسَى أَلْقُوا مَا أَنْتُمْ مُلْقُونَ * فَلَمَّا أَلْقَوْا قَالَ مُوسَى مَا جِئْتُمْ بِهِ السِّحْرُ إِنَّ اللَّهَ سَيُبْطِلُهُ إِنَّ اللَّهَ لا يُصْلِحُ عَمَلَ الْمُفْسِدِينَ * وَيُحِقُّ اللَّهُ الْحَقَّ بِكَلِمَاتِهِ وَلَوْ كَرِهَ الْمُجْرِمُونَ }', 'بسم الله الرحمن الرحيم', TextAlign.center,Colors.white),
        containerApp(' { قَالُوا يَا مُوسَى إِمَّا أَنْ تُلْقِيَ وَإِمَّا أَنْ نَكُونَ أَوَّلَ مَنْ أَلْقَى * قَالَ بَلْ أَلْقُوا فَإِذَا حِبَالُهُمْ وَعِصِيُّهُمْ يُخَيَّلُ إِلَيْهِ مِنْ سِحْرِهِمْ أَنَّهَا تَسْعَى * فَأَوْجَسَ فِي نَفْسِهِ خِيفَةً مُوسَى * قُلْنَا لا تَخَفْ إِنَّكَ أَنْتَ الأَعْلَى * وَأَلْقِ مَا فِي يَمِينِكَ تَلْقَفْ مَا صَنَعُوا إِنَّمَا صَنَعُوا كَيْدُ سَاحِرٍ وَلا يُفْلِحُ السَّاحِرُ حَيْثُ أَتَى }',  'بسم الله الرحمن الرحيم', TextAlign.center,Colors.white),
        containerApp('{ وَالصَّافَّاتِ صَفّاً * فَالزَّاجِرَاتِ زَجْراً * فَالتَّالِيَاتِ ذِكْراً * إِنَّ إِلَهَكُمْ لَوَاحِدٌ * رَبُّ السَّمَوَاتِ وَالأَرْضِ وَمَا بَيْنَهُمَا وَرَبُّ الْمَشَارِقِ * إِنَّا زَيَّنَّا السَّمَاءَ الدُّنْيَا بِزِينَةٍ الْكَوَاكِبِ * وَحِفْظاً مِنْ كُلِّ شَيْطَانٍ مَارِدٍ * لا يَسَّمَّعُونَ إِلَى الْمَلإٍ الأَعْلَى وَيُقْذَفُونَ مِنْ كُلِّ جَانِبٍ * دُحُوراً وَلَهُمْ عَذَابٌ وَاصِبٌ * إِلاَّ مَنْ خَطِفَ الْخَطْفَةَ فَأَتْبَعَهُ شِهَابٌ ثَاقِبٌ }', 'بسم الله الرحمن الرحيم', TextAlign.center,Colors.white),
        containerApp('{ هُوَ اللَّهُ الَّذِي لا إِلَهَ إِلاَّ هُوَ عَالِمُ الْغَيْبِ وَالشَّهَادَةِ هُوَ الرَّحْمَنُ الرَّحِيمُ * هُوَ اللَّهُ الَّذِي لا إِلَهَ إِلاَّ هُوَ الْمَلِكُ الْقُدُّوسُ السَّلامُ الْمُؤْمِنُ الْمُهَيْمِنُ الْعَزِيزُ الْجَبَّارُ الْمُتَكَبِّرُ سُبْحَانَ اللَّهِ عَمَّا يُشْرِكُونَ * هُوَ اللَّهُ الْخَالِقُ الْبَارِئُ الْمُصَوِّرُ لَهُ الأَسْمَاءُ الْحُسْنَى يُسَبِّحُ لَهُ مَا فِي السَّمَوَاتِ وَالأَرْضِ وَهُوَ الْعَزِيزُ الْحَكِيمُ }',  'بسم الله الرحمن الرحيم', TextAlign.center,Colors.white),
        containerApp('{ وَنُنَزِّلُ مِنْ الْقُرْآنِ مَا هُوَ شِفَاءٌ وَرَحْمَةٌ لِلْمُؤْمِنِينَ وَلا يَزِيدُ الظَّالِمِينَ إِلاَّ خَسَاراً }',  'بسم الله الرحمن الرحيم', TextAlign.center,Colors.white),
        containerApp('{ وَإِنْ يَكَادُ الَّذِينَ كَفَرُوا لَيُزْلِقُونَكَ بِأَبْصَارِهِمْ لَمَّا سَمِعُوا الذِّكْرَ وَيَقُولُونَ إِنَّهُ لَمَجْنُونٌ }', 'بسم الله الرحمن الرحيم', TextAlign.center,Colors.white),
        containerApp('{ وَأَنَّهُ تَعَالَى جَدُّ رَبِّنَا مَا اتَّخَذَ صَاحِبَةً وَلا وَلَداً }', 'بسم الله الرحمن الرحيم', TextAlign.center,Colors.white),
        containerApp('{ قُلْ يَا أَيُّهَا الْكَافِرُونَ * لا أَعْبُدُ مَا تَعْبُدُونَ * وَلا أَنْتُمْ عَابِدُونَ مَا أَعْبُدُ * وَلا أَنَا عَابِدٌ مَا عَبَدتُّمْ * وَلا أَنْتُمْ عَابِدُونَ مَا أَعْبُدُ * لَكُمْ دِينُكُمْ وَلِيَ دِينِ }',  'بسم الله الرحمن الرحيم', TextAlign.center,Colors.white),
        containerApp('{ قُلْ هُوَ اللَّهُ أَحَدٌ * اللَّهُ الصَّمَدُ * لَمْ يَلِدْ وَلَمْ يُولَدْ * وَلَمْ يَكُنْ لَهُ كُفُواً أَحَدٌ }',  'بسم الله الرحمن الرحيم', TextAlign.center,Colors.white),
        containerApp(' { قُلْ أَعُوذُ بِرَبِّ الْفَلَقِ * مِنْ شَرِّ مَا خَلَقَ * وَمِنْ شَرِّ غَاسِقٍ إِذَا وَقَبَ * وَمِنْ شَرِّ النَّفَّاثَاتِ فِي الْعُقَدِ * وَمِنْ شَرِّ حَاسِدٍ إِذَا حَسَدَ }',  'بسم الله الرحمن الرحيم', TextAlign.center,Colors.white),
        containerApp('{ قُلْ أَعُوذُ بِرَبِّ النَّاسِ * مَلِكِ النَّاسِ * إِلَهِ النَّاسِ * مِنْ شَرِّ الْوَسْوَاسِ الْخَنَّاسِ * الَّذِي يُوَسْوِسُ فِي صُدُورِ النَّاسِ * مِنْ الْجِنَّةِ وَالنَّاسِ }',  'بسم الله الرحمن الرحيم', TextAlign.center,Colors.white),
        SizedBox(height: 40,)

      ],);

Widget doa()=>Column(
  children: [
    containerApp('(( أعوذ بكلمات الله التامات من شر ما خلق )).', '', TextAlign.center,Colors.white),
    containerApp('(( أعوذ بكلمات الله التامة من كل شيطان وهامة ، ومن كل عين لامة )).', '', TextAlign.center,Colors.white),
    containerApp('(( أعوذ بكلمات الله التامة التي لا يجاوزهن بر ولا فاجر من شر ما ينزل من السماء ، ومن شر ما يعرج فيها ، ومن شر ما ذرأ في الأرض ، ومن شر ما يخرج منها ، ومن فتن الليل والنهار ، ومن شر طوارق الليل والنهار إلا طارقاً يطرق بخير يا رحمن )).', '', TextAlign.center,Colors.white),
    containerApp('(( أعوذ بكلمات الله التامة من غضبه وعقابه ، ومن شر عباده ومن شر همزات الشياطين وأن يحضرون )).', '', TextAlign.center,Colors.white),
    containerApp('(( اللهم إني أعوذ بوجهك الكريم ، وكلماتك التامة من شر ما أنت آخذ بناصيته )) .', '', TextAlign.center,Colors.white),
    containerApp(' (( اللهم أنت تكشف المأثم والمغرم ن ، اللهم إنه لا يهزم جندك ولا يخلف وعدك ، سبحانك وبحمدك )) .', '', TextAlign.center,Colors.white),
    containerApp('(( أعوذ بوجه الله العظيم الذي لا شيئ أعظم منه ، وبكلماته التامات التي لا يجاوزهن بر ولا فاجر وبأسماء الله الحسنى ما علمت منها وما لم أعلم من شر ما خلق و ذرأ و برأ ، ومن كل ذي شر لا أطيق شره ، ومن شر كل ذي شر أنت آخذ بناصيته،إن ربي على صراط مستقيم))', '', TextAlign.center,Colors.white),
    containerApp(' (( اللهم أنت ربي لا إله إلا أنت عليك توكلت وأنت رب العرش العظيم ، ما شاء الله كان وما لم يكن ، ولا حول ولا قوة إلا بالله ، أعلم أن الله على كل شيئ قدير ، وأن الله قد أحاط بكل شيئ علماً ، وأحصى كل شيء عدداً ، اللهم إني أعوذ بك منه شر نفسي ، وشر الشيطان وشركه ، ومن شر كل دابة أنت آخذ بناصيتها ، إن ربي على صراط المستقيم  )) .', '', TextAlign.center,Colors.white),
    containerApp(' (( تحصنت بالله الذي لا إله إلا هو وإليه كل شيء ، وتوكلت على الحي الذي لا يموت ، و استدفعت الشر بلا حول ولا قوة إلا بالله ))', '', TextAlign.center,Colors.white),
    containerApp('(( حسبي الله ونعم الوكيل ، حسبي الرب من العباد ، حسبي الخالق من المخلوق ، حسبي الرزاق من المرزوق ، حسبي الله ، هو حسبي الذي بيده ملكوت كل شيئ وهو يجير ولا يجار عليه ، حسبي الله وكفى ، سمع الله من دعا ، وليس وراء الله مرمى ))', '', TextAlign.center,Colors.white),
    containerApp('(( حسبي الله لا إله إلا هو عليه توكلت وهو رب العرش العظيم ))', '', TextAlign.center,Colors.white),
    containerApp('(( بسم الله أرقيك من كل داء يؤذيك ومن شر كل نفس أو عين حاسد الله يشفيك،باسم الله أرقيك ))', '', TextAlign.center,Colors.white),
    containerApp('((أسال الله العظيم رب العرش العظيم أن يشفيك))', '', TextAlign.center,Colors.white),
    SizedBox(height: 40,)


  ],
);


//decoration: BoxDecoration(border: Border.all(color: Appcolor().firstcolor,width: 1) ),
