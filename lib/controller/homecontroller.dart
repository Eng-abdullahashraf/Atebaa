
import 'package:atebaa/Screen/Favorite.dart';
import 'package:atebaa/Screen/Homescreen.dart';
import 'package:atebaa/Screen/aboutus.dart';
import 'package:atebaa/Screen/firstscreen.dart';
import 'package:atebaa/component.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Screen/doctors.dart';



class homecontroller extends GetxController{


  final Connectivity _connectivity = Connectivity();

  @override
  void onInit() {
    super.onInit();
    _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  List<Widget> Screennav=[
    Homescreen(),
    Favourite(),
    Aboutus()
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
      name="";
      load=false;
      Get.to(Doctors());
      data?.clear();
      loading();
      CollectionReference doctors=FirebaseFirestore.instance.collection('doctors');
    var response=await doctors.where('city',isEqualTo: city).where('special',isEqualTo: special).get();
    response.docs.forEach((element) {
      data!.add(element.data());
    });
      print(data!);
    load=false;
      update();
    }

  }

  String? name="";
  void search(value){
    name=value;
    update();
  }
  bool? load=false;

  void loading(){
      Future.delayed(const Duration(seconds: 3),(){
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

      });


  }

  void _updateConnectionStatus(ConnectivityResult connectivityResult) {

    if (connectivityResult == ConnectivityResult.none) {
      Get.rawSnackbar(
          messageText: const Text(
              'PLEASE CONNECT TO THE INTERNET',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14
              )
          ),
          isDismissible: false,
          duration: const Duration(seconds: 3),
          backgroundColor: Colors.black12!,
          icon : const Icon(Icons.wifi_off, color: Colors.white, size: 35,),
          margin: EdgeInsets.zero,
          snackStyle: SnackStyle.GROUNDED
      );
    } else {
      if (Get.isSnackbarOpen) {
        Get.closeCurrentSnackbar();
      }
    }
  }
}