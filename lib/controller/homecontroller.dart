
import 'dart:convert';
import 'package:atebaa/Screen/Favorite.dart';
import 'package:atebaa/Screen/Homescreen.dart';
import 'package:atebaa/Screen/Roqya.dart';
import 'package:atebaa/Screen/aboutus.dart';
import 'package:atebaa/Screen/firstscreen.dart';
import 'package:atebaa/component/component.dart';
import 'package:atebaa/component/pages.dart';
import 'package:atebaa/constant/doctorss.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Screen/doctors.dart';



class homecontroller extends GetxController{

  Connectivity _connectivity = Connectivity();

  @override
  void onInit() async{
    super.onInit();
    sharedPreferences=await SharedPreferences.getInstance();
    _connectivity.onConnectivityChanged.listen(updateConnectionStatus);
    checkinternet();

  }


  //........................................................
  //..................................................................

  List<Widget> Screennav=[
    homePage(),
    Favourite(),
    Roqya(),
    Aboutus(),
  ];

  int? screennum=0;
  void changeScreen(value){
    screennum=value;
    update();
  }

  //....................................................
  //........................................................

  List<dynamic>? data=[];
  String? city;
  String? special;

  void getdata(context) async{
    // QuerySnapshot querySnapshot= await FirebaseFirestore.instance.collection('doctors').get();
    // data?.addAll(querySnapshot.docs);
    if(city==null || special==null || city=='' ||special==''){
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('يجب عليك اختيار المدينة والتخصص')));
    }
    else {
      gotodoctor();
      Get.to(Doctors());
      update();
    }

  }

  void gotodoctor() async{
    name="";
    load=false;
    data?.clear();
    var response;
    CollectionReference doctors=FirebaseFirestore.instance.collection('doctors');
    if(city=='كل المدن' && special=='كل التخصصات'){
       response=await doctors.get();
    }
    else if(city=='كل المدن'){
      response=await doctors.where('special',isEqualTo: special).get();
    }
    else if(special=='كل التخصصات'){
      response=await doctors.where('city',isEqualTo: city).get();
    }
    else{
      response=await doctors.where('city',isEqualTo: city).where('special',isEqualTo: special).get();
    }
    response.docs.forEach((element) {
      data!.add(element.data());
    });

    print(data!);
    loading();
    //load=false;
  }

  bool? z=false;
  void checkinlist(name){
    for(var s in doctors){
      if(s.name==name){
        print('object');
        z=true;
        break;
      }
      else{
        z=false;
      }

    }
    update();
  }


  void uploaddatatofirestor(name,address,phone,special,city,gender,doc)async{

    CollectionReference doctors=FirebaseFirestore.instance.collection('doctors');
    //doctors.add({'name': name,'address':address,'phone':phone,'special':special,'city':city,'gender':gender});
    doctors.doc(doc).set({'name': name,'address':address,'phone':phone,'special':special,'city':city,'gender':gender});
    print('doctor is added');
    update();


  }

  void uploaddatatofirestors(enwan,metwaa)async{

    CollectionReference se=FirebaseFirestore.instance.collection('doaa');
    //doctors.add({'name': name,'address':address,'phone':phone,'special':special,'city':city,'gender':gender});
    se.add({'العنوان': enwan,'المحتوي':metwaa,});
    print('doaa is added');
    update();
  }

  String? name="";
  void search(value){
    name=value;
    update();
  }

  Color? colorCon=Colors.white;
  bool? load=false;

  void loading(){
     /* Future.delayed(const Duration(seconds: 3),(){
        if(data!.isEmpty){
          Get.to(FirstScreen());
          Get.rawSnackbar(
              messageText: const Text(
                  'هذه البلده لا تحتوى على دكاترة حاليا',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14
                  )
              ),
              isDismissible: false,
              duration: const Duration(seconds: 3),
              backgroundColor: Colors.black!,
              icon : const Icon(Icons.wifi_off, color: Colors.white, size: 35,),
              margin: EdgeInsets.zero,
              snackStyle: SnackStyle.GROUNDED
          );
          update();
        }
        else{
          load=true;
          update();
        }

      });*/
    if(data!.isEmpty){
      Get.to(FirstScreen());
      Get.rawSnackbar(
          messageText: const Text(
              'هذه البلده لا تحتوى على دكاترة حاليا',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14
              )
          ),
          isDismissible: false,
          duration: const Duration(seconds: 3),
          backgroundColor: Colors.black!,
          margin: EdgeInsets.zero,
          snackStyle: SnackStyle.GROUNDED
      );
      update();
    }
    else{
      load=true;
      update();
    }
  }

  //..............................................
  //.....................................................

  bool? noin=true;

  void checkinternet()async{
    var result= await Connectivity().checkConnectivity();
    if(result.name=='none'){
      noin=false;
    }else{
      noin=true;
    }

  }
  //...............................................
  void updateConnectionStatus(ConnectivityResult connectivityResult) {

    if (connectivityResult == ConnectivityResult.none) {
      noin=false;
      // Get.rawSnackbar(
      //     messageText: const Text(
      //         'PLEASE CONNECT TO THE INTERNET',
      //         style: TextStyle(
      //             color: Colors.white,
      //             fontSize: 14
      //         )
      //     ),
      //     isDismissible: false,
      //     duration: const Duration(seconds: 5),
      //     backgroundColor: Colors.black26!,
      //     icon : const Icon(Icons.wifi_off, color: Colors.white, size: 35,),
      //     margin: EdgeInsets.zero,
      //     snackStyle: SnackStyle.GROUNDED
      // );
    } else {
      noin=true;
    }
  }

  //......................................
  //........................................
  late SharedPreferences sharedPreferences;

  List<Doctorss> doctors=List.empty(growable: true);
  void savetocache() {
    List<String> doctorslist=doctors.map((e) => jsonEncode(e.toJson())).toList();
    sharedPreferences.setStringList('mydoctors', doctorslist);
  }

  void readdata(){
    try{
      List<String>? doctorsstring=sharedPreferences.getStringList('mydoctors');
      doctors=doctorsstring!.map((doctor) => Doctorss.fromJson(json.decode(doctor))).toList();
    }catch(e){
      print(e);
    }


    // if(doctorsstring!.isEmpty){
    //   doctors=doctorsstring.map((doctor) => Doctorss.fromJson(json.decode(doctor))).toList();
    // }
    // else{
    //   print("now no doctors");
    // }
  }

  void delete(i){
    doctors.removeAt(i);
    savetocache();
    print(doctors);
    update();
  }

  //.....................................................
  //..................................................

  int? x=0;
  void changestate(){
    x=x!+1;
    update();
  }

  //..........................................................
  //.........................................................
  List<Widget> zekrScreens = [ayat(),doa()];
  int? zekrnmuber = 0;

  void changezekrdata(d){
    zekrnmuber=d;
    update();
  }

  List<dynamic>? zekr=[];

  void getzekr(){
    CollectionReference sr=FirebaseFirestore.instance.collection('doctors');
  }

  //....................................
  //..........................................

  List<dynamic>? doaadata=[];
  void getdoaa()async{

    load=false;

    var response;
    doaadata!.clear();
    CollectionReference doct=FirebaseFirestore.instance.collection('doaa');
    response=await doct.get();
    response.docs.forEach((element) {
      doaadata!.add(element.data());
    });
    print(doaadata);
    loadings();
   // load=false;
  }

  void loadings(){
    if(doaadata!.isEmpty){
      //Get.to(FirstScreen());
      update();
    }
    else{
      load=true;
      update();
    }

    //...........................................
    //..........................................Carousel


  }
  
  List<String>? itemList=[
      'images/Research.jpg',
    'images/Research1.jpg',
    'images/Research2.jpg',
  ];
  List<Widget> gene(){
    return itemList!.map((item)=>carouslerImage(item)).toList();
  }



}