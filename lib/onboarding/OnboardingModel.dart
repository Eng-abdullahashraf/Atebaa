

import 'dart:ui';

class onboardingmodel{
   String? image;
   String? title;
   String? text;
   onboardingmodel({this.image,this.title,this.text});


}

class Imageonboarding{
   static const String rootimage='images';
   static const String onboardingimage1='$rootimage/doctors.png';
   static const String onboardingimage2='$rootimage/pharmacy.png';
   static const String onboardingimage3='$rootimage/laboratory.png';
   static const String onboardingimage4='$rootimage/Center.png';

}

List<onboardingmodel> onboardinglist=[

   onboardingmodel(image: Imageonboarding.onboardingimage1,title: 'أطباء',text: 'مرحبا بكم في تطبيقنا المتخصص في المجال الطبي بحيث يوفر لك دليل بكل بيانات الدكاترة'),
   onboardingmodel(image: Imageonboarding.onboardingimage2,title: 'صيدليات',text: 'مرحبا بكم في تطبيقنا المتخصص في المجال الطبي بحيث يوفر لك دليل بكل بيانات الدكاترة'),
   onboardingmodel(image: Imageonboarding.onboardingimage3,title: 'معامل',text: 'مرحبا بكم في تطبيقنا المتخصص في المجال الطبي بحيث يوفر لك دليل بكل بيانات الدكاترة.'),
   onboardingmodel(image: Imageonboarding.onboardingimage4,title: 'مراكز',text: 'ممرحبا بكم في تطبيقنا المتخصص في المجال الطبي بحيث يوفر لك دليل بكل بيانات الدكاترة.'),

];