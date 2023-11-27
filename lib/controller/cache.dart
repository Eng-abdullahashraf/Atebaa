
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class cache{

  static SharedPreferences? sharedPreferences;

  static init() async{
    sharedPreferences= await SharedPreferences.getInstance();
}

static Future<bool> putdata (
    @required String key,
    @required String value
    )async{

     return await sharedPreferences!.setString(key, value);

}

static void clears(){
    sharedPreferences!.clear();
}
static String? getdata (
      @required String key,

      ){

    return  sharedPreferences!.getString(key);

  }

}