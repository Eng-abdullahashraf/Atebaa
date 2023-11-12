
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class homecontroller extends GetxController{

  List? data=[];
  void getdata() async{

    // QuerySnapshot querySnapshot= await FirebaseFirestore.instance.collection('doctors').get();
    // data?.addAll(querySnapshot.docs);
    CollectionReference doctors=FirebaseFirestore.instance.collection('doctors');
    var response=await doctors.get();
    response.docs.forEach((element) {
      data!.add(element.data());
    });
    print(data!);
    update();
  }
}