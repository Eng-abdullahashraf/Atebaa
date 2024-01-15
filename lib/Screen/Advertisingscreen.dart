import 'package:atebaa/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AdvertisingScreen extends StatelessWidget {
  const AdvertisingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Appcolor().secondcolor,
        body: Container(

          //decoration: BoxDecoration(image: DecorationImage(image: AssetImage(onbarding[0].image!),fit: BoxFit.cover)),
          child: Column(
            //alignment: Alignment.bottomCenter,
            //clipBehavior: Clip.none,
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.topCenter,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("images/doctorsad.jpg"),
                          fit: BoxFit.fill)),
                  // child: Image(image: AssetImage("images/doctorsadd.jpg"),height: MediaQuery.of(context).size.height,)
                ),
              ),
              //Gap(20),
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                    color: Appcolor().fourthcolor,
                    borderRadius: BorderRadius.circular(
                      50
                        )),
                child: Padding(
                  padding: const EdgeInsets.only(top: 5, right: 15, left: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 5),
                      CircleAvatar(
                        backgroundColor: Colors.green,
                        child: Icon(Icons.call),
                      ),
                      Gap(20),
                      CircleAvatar(
                        backgroundColor: Colors.blueAccent,
                        child: Icon(Icons.call),
                      ),
                      //Text("دكتور / محمد عصام ابو العنين" ,style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.white,fontFamily: 'Poppinsk')),
                    ],
                  ),
                ),
              ),
              Gap(20),

            ],
          ),
        ),
      ),
    );
  }
}
