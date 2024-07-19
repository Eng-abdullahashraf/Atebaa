

import 'package:atebaa/Screen/navscreens/firstscreen.dart';
import 'package:atebaa/Screen/splash.dart';
import 'package:atebaa/main.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseNotification{


  final _firebaseMessageing = FirebaseMessaging.instance;

  Future<void> initNotification()async{
    await _firebaseMessageing.requestPermission();
    String? token=await _firebaseMessageing.getToken();
    print("Token: $token");
    handleBackgroundNotification();
  }

  void handleMessage(RemoteMessage? messa){
    if(messa ==null)return;
    navigatorkey.currentState!.pushNamed(arguments: messa,FirstScreen() as String);
  }

  Future handleBackgroundNotification()async{
    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
  }
}