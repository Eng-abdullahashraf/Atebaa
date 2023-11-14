
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Screen/doctors.dart';



class homecontroller extends GetxController{

  List? data=[];
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
      data?.clear();
    CollectionReference doctors=FirebaseFirestore.instance.collection('doctors');
    var response=await doctors.where('city',isEqualTo: city).where('special',isEqualTo: special).get();
    response.docs.forEach((element) {
      data!.add(element.data());
    });
    Get.to(Doctors());
    print(data! );
    print(city! );
    print(special! );

      update();
    }

  }
}