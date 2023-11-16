
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
      Get.to(Doctors());
      data?.clear();
    CollectionReference doctors=FirebaseFirestore.instance.collection('doctors');
    var response=await doctors.where('city',isEqualTo: city).where('special',isEqualTo: special).get();
    response.docs.forEach((element) {
      data!.add(element.data());
    });
      loading();
    load=false;
      update();
    }

  }

  bool? load=false;

  void loading(){
    Future.delayed(const Duration(seconds: 2),(){

      load=true;
      update();
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
          duration: const Duration(days: 1),
          backgroundColor: Colors.red[400]!,
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