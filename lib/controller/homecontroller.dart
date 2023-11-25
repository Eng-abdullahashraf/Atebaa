
import 'dart:convert';

import 'package:atebaa/Screen/Favorite.dart';
import 'package:atebaa/Screen/Homescreen.dart';
import 'package:atebaa/Screen/aboutus.dart';
import 'package:atebaa/Screen/ayat.dart';
import 'package:atebaa/Screen/doaa.dart';
import 'package:atebaa/Screen/firstscreen.dart';
import 'package:atebaa/Screen/mix%20info.dart';
import 'package:atebaa/doctorss.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Screen/doctors.dart';



class homecontroller extends GetxController{


  final Connectivity _connectivity = Connectivity();

  @override
  void onInit() async{
    super.onInit();
    sharedPreferences=await SharedPreferences.getInstance();
    _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  List<Widget> Screennav=[
    Homescreen(),
    Favourite(),
    MixInfo(),
    Aboutus(),
  ];

  int? screennum=0;
  void changeScreen(value){
    screennum=value;
    update();
  }


  List<dynamic>? data=[];
  String? city;
  String? special;

  void getdata(context) async{

    // QuerySnapshot querySnapshot= await FirebaseFirestore.instance.collection('doctors').get();
    // data?.addAll(querySnapshot.docs);
    if(city==null || special==null || city=='' ||special==''){
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('يجب عليك اختيار البلد والتخصص')));
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
    CollectionReference doctors=FirebaseFirestore.instance.collection('doctors');
    var response=await doctors.where('city',isEqualTo: city).where('special',isEqualTo: special).get();
    response.docs.forEach((element) {
      data!.add(element.data());
    });
    loading();
    print(data!);
    //load=false;
  }


  bool? z=false;
  void checkfav(name){
    for(var s in doctors){
      if(s.name==name){
        z=true;
        update();
        break;
      }
      else{
        z=false;
        update();
      }
    }
  }
  void uploaddatatofirestor(name,address,phone,special,city,gender,doc)async{

    CollectionReference doctors=FirebaseFirestore.instance.collection('doctors');
    //doctors.add({'name': name,'address':address,'phone':phone,'special':special,'city':city,'gender':gender});
    doctors.doc(doc).set({'name': name,'address':address,'phone':phone,'special':special,'city':city,'gender':gender});
    print('doctor is added');
    update();


  }

  String? name="";
  void search(value){
    name=value;
    update();
  }
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


  }

  bool? noin=true;
  void _updateConnectionStatus(ConnectivityResult connectivityResult) {

    if (connectivityResult == ConnectivityResult.none) {
      noin=false;
      Get.rawSnackbar(
          messageText: const Text(
              'PLEASE CONNECT TO THE INTERNET',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14
              )
          ),
          isDismissible: false,
          duration: const Duration(seconds: 100),
          backgroundColor: Colors.red!,
          icon : const Icon(Icons.wifi_off, color: Colors.white, size: 35,),
          margin: EdgeInsets.zero,
          snackStyle: SnackStyle.GROUNDED
      );
    } else {
      if (Get.isSnackbarOpen) {
        noin=true;
        Get.closeCurrentSnackbar();
      }
    }
  }

  List<Widget> zekrScreens = [AyatScreen(),DoaaScreen()];
  int? zekrnmuber = 0;

  void changezekrdata(d){
    zekrnmuber=d;
    update();
  }

  late SharedPreferences sharedPreferences;

  List<Doctorss> doctors=List.empty(growable: true);
  void savetocache() {
    // doctors.clear();

    List<String> doctorslist=doctors.map((e) => jsonEncode(e.toJson())).toList();
    sharedPreferences.setStringList('mydoctors', doctorslist);
  }

  void readdata(){
    List<String>? doctorsstring=sharedPreferences.getStringList('mydoctors');
    if(doctorsstring !=null){
      doctors=doctorsstring.map((doctor) => Doctorss.fromJson(json.decode(doctor))).toList();
    }
    else{
      print("now no doctors");
    }
  }

  void delete(i){
    print('object');
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
}