

import '../theme/advertisingimage.dart';

class AdvertisingModel{

  String? image1;
  String? image2;
  String? phone;
  String? whatsapp;

  AdvertisingModel({this.image1,this.phone,this.whatsapp,this.image2});
}

List<dynamic> addvertingmodel=[
  AdvertisingModel(image2: ImageAsset.advertingimage2,image1: ImageAsset.advertingimage1,phone: '+201559598288',whatsapp: 'https://www.facebook.com/Dr.MohamedZahar'),
  AdvertisingModel(image2: ImageAsset.advertingimage4,image1: ImageAsset.advertingimage3,phone: '+201019388578',whatsapp: 'https://www.facebook.com/profile.php?id=61550894865990'),
  AdvertisingModel(image2: ImageAsset.advertingimage6,image1: ImageAsset.advertingimage5,phone: '+201283832896',whatsapp: 'https://www.facebook.com/profile.php?id=100090292286162'),

  //AdvertisingModel(image2: ImageAsset.advertingimage2,image1: ImageAsset.advertingimage1,phone: '+201211030844',whatsapp: 'Sekoo'),

];