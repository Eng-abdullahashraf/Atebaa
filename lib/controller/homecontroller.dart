import 'dart:convert';
import 'dart:io';
import 'package:atebaa/Screen/LoginScreens/LoginPage.dart';
import 'package:atebaa/Screen/navscreens/Favorite.dart';
import 'package:atebaa/Screen/navscreens/Homescreen.dart';
import 'package:atebaa/Screen/navscreens/Roqya.dart';
import 'package:atebaa/Screen/navscreens/aboutus.dart';
import 'package:atebaa/Screen/navscreens/firstscreen.dart';
import 'package:atebaa/Screen/navscreens/profilescreen.dart';
import 'package:atebaa/Screen/profilemenu/profiledata.dart';
import 'package:atebaa/component/component.dart';
import 'package:atebaa/Screen/tabbedscreens/searchdoctors.dart';
import 'package:atebaa/constant/Admanager.dart';
import 'package:atebaa/constant/doctorss.dart';
import 'package:atebaa/controller/dio.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Screen/doctors.dart';
import '../constant/addvertisingmodels.dart';

class homecontroller extends GetxController {
  Connectivity _connectivity = Connectivity();
  //final tooltipController = JustTheController();

  @override
  void onInit() async {
    super.onInit();
    sharedPreferences = await SharedPreferences.getInstance();
    _connectivity.onConnectivityChanged.listen(updateConnectionStatus);
    checkinternet();
    loaded();
    firstopen();
    DioHelper.init();
  }

  //........................................................
  //..................................................................

  List<Widget> Screennav = [
    //homePage(),
    //Homescreen(),
    searchDoctors(),
    Favourite(),
    Roqya(),
    Aboutus(),
    LoginPage(),
    ProfileScreen(),
  ];

  int? screennum = 0;
  void changeScreen(value) {
    screennum = value;
    update();
  }

  //....................................................
  //........................................................

  List<dynamic>? data = [];
  String? city;
  String? special;

  void getdata(context) async {
    // QuerySnapshot querySnapshot= await FirebaseFirestore.instance.collection('doctors').get();
    // data?.addAll(querySnapshot.docs);
    if (city == null || special == null || city == '' || special == '') {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('يجب عليك اختيار المدينة والتخصص')));
    } else {
      gotodoctor();
      Get.to(Doctors());
      update();
    }
  }

  void gotodoctor() async {
    name = "";
    load = false;
    data?.clear();
    var response;
    CollectionReference doctors =
        FirebaseFirestore.instance.collection('doctors');
    if (city == 'كل المدن' && special == 'كل التخصصات') {
      response = await doctors.get();
    } else if (city == 'كل المدن') {
      response = await doctors.where('special', isEqualTo: special).get();
    } else if (special == 'كل التخصصات') {
      response = await doctors.where('city', isEqualTo: city).get();
    } else {
      response = await doctors
          .where('city', isEqualTo: city)
          .where('special', isEqualTo: special)
          .get();
    }
    response.docs.forEach((element) {
      data!.add(element.data());
    });

    print(data!);
    loading();
    //load=false;
  }

  bool? z = false;
  void checkinlist(name) {
    for (var s in doctors) {
      if (s.name == name) {
        print('object');
        z = true;
        break;
      } else {
        z = false;
      }
    }
    update();
  }

  void uploaddatatofirestor(
      name, address, phone, special, city, gender, doc) async {
    CollectionReference doctors =
        FirebaseFirestore.instance.collection('doctors');
    //doctors.add({'name': name,'address':address,'phone':phone,'special':special,'city':city,'gender':gender});
    doctors.doc(doc).set({
      'name': name,
      'address': address,
      'phone': phone,
      'special': special,
      'city': city,
      'gender': gender
    });
    print('doctor is added');
    update();
  }

  void uploaddatatofirestors(enwan, metwaa) async {
    CollectionReference se = FirebaseFirestore.instance.collection('doaa');
    //doctors.add({'name': name,'address':address,'phone':phone,'special':special,'city':city,'gender':gender});
    se.add({
      'العنوان': enwan,
      'المحتوي': metwaa,
    });
    print('doaa is added');
    update();
  }

  void uploaddatafirestors(
      name, address, city, delevery, phone, time, whats, doc, type) async {
    if (type == 'pharmacy') {
      CollectionReference se =
          FirebaseFirestore.instance.collection('pharmacy');
      //doctors.add({'name': name,'address':address,'phone':phone,'special':special,'city':city,'gender':gender});
      se.doc(doc).set({
        'address': address,
        'name': name,
        'city': city,
        'delevery': delevery,
        'phone': phone,
        'time': time,
        'whatsapp': whats
      });
      print('doaa is added');
    } else if (type == 'laboratory') {
      CollectionReference se =
          FirebaseFirestore.instance.collection('laboratory');
      //doctors.add({'name': name,'address':address,'phone':phone,'special':special,'city':city,'gender':gender});
      se.doc(doc).set({
        'address': address,
        'name': name,
        'city': city,
        'delevery': delevery,
        'phone': phone,
        'time': time,
        'whatsapp': whats
      });
      print('doaa is added');
    } else if (type == 'Radio') {
      CollectionReference se =
          FirebaseFirestore.instance.collection('Radiology');
      //doctors.add({'name': name,'address':address,'phone':phone,'special':special,'city':city,'gender':gender});
      se.doc(doc).set({
        'address': address,
        'name': name,
        'city': city,
        'delevery': delevery,
        'phone': phone,
        'time': time,
        'whatsapp': whats
      });
      print('doaa is added');
    } else {
      print('error');
    }
    update();
  }

  String? name = "";
  void search(value) {
    name = value;
    update();
  }

  Color? colorCon = Colors.white;
  bool? load = false;

  void loading() {
    if (data!.isEmpty) {
      Get.to(FirstScreen());
      Get.rawSnackbar(
          messageText: const Text('هذه القائمة لا تحتوى على أطباء حاليا',
              style: TextStyle(color: Colors.white, fontSize: 14)),
          isDismissible: false,
          duration: const Duration(seconds: 3),
          backgroundColor: Colors.black!,
          margin: EdgeInsets.zero,
          snackStyle: SnackStyle.GROUNDED);
      update();
    } else {
      load = true;
      update();
    }
  }

  //..............................................
  //.....................................................

  bool? noin = true;

  void checkinternet() async {
    var result = await Connectivity().checkConnectivity();
    if (result.name == 'none') {
      noin = false;
    } else {
      noin = true;
    }
  }

  //...............................................
  void updateConnectionStatus(ConnectivityResult connectivityResult) {
    if (connectivityResult == ConnectivityResult.none) {
      noin = false;
    } else {
      noin = true;
    }
  }

  //......................................
  //........................................
  late SharedPreferences sharedPreferences;

  List<Doctorss> doctors = List.empty(growable: true);
  void savetocache() {
    List<String> doctorslist =
        doctors.map((e) => jsonEncode(e.toJson())).toList();
    sharedPreferences.setStringList('mydoctors', doctorslist);
  }

  void readdata() {
    try {
      List<String>? doctorsstring =
          sharedPreferences.getStringList('mydoctors');
      doctors = doctorsstring!
          .map((doctor) => Doctorss.fromJson(json.decode(doctor)))
          .toList();
    } catch (e) {
      print(e);
    }
  }

  void delete(i) {
    doctors.removeAt(i);
    savetocache();
    print(doctors);
    update();
  }

  //.....................................................
  //..................................................

  int? x = 0;
  void changestate() {
    x = x! + 1;
    update();
  }

  //..........................................................
  //.........................................................
  List<Widget> zekrScreens = [ayat(), doa()];
  int? zekrnmuber = 0;

  void changezekrdata(d) {
    zekrnmuber = d;
    update();
  }

  //....................................
  //..........................................

  List<dynamic>? doaadata = [];
  void getdoaa() async {
    load = false;

    var response;
    doaadata!.clear();
    CollectionReference doct = FirebaseFirestore.instance.collection('doaa');
    response = await doct.get();
    response.docs.forEach((element) {
      doaadata!.add(element.data());
    });
    print(doaadata);
    loadings();
    // load=false;
  }

  void loadings() {
    if (doaadata!.isEmpty) {
      update();
    } else {
      load = true;
      update();
    }

    //...........................................
    //..........................................Carousel
  }

  List<String>? itemList = [
    'images/Research.jpg',
    'images/Research1.jpg',
    'images/Research2.jpg',
  ];

  List<dynamic>? dataset;

  List dropCityItems = [
    'اختر المدينة',
  ];
  String? dropCityvalue = 'اختر المدينة';
  List dropGoverItems = ['اختر المحافظة'];
  String? dropGovvalue = 'اختر المحافظة';
  List dropItems = [
    'اختر المدينة',
    'المنصورة',
    'المنزلة',
    'البصراط',
    'الجمالية',
    'المطرية',
    'دكرنس',
    'الرياض',
    'الكردي',
    'منية النصر',
    'ميت سلسيل',
  ];
  String? dropvalue = 'اختر المدينة';
  void changcityedrop(x) {
    dropCityvalue = x;
    update();
  }

  void changgovdrop(x) {
    dropGovvalue = x;
    update();
  }

  void changedrop(x) {
    dropvalue = x;
    update();
  }

  //api
  //api علشان نجيب المحافظات والمدن
  Future<void> getdataapi() async {
    try {
      final response = await DioHelper.getData(url: 'governmentinfo.php');
      print(response.data);
      for (var element in response.data) {
        dropGoverItems.add(element['government']);
      }
      final response2 = await DioHelper.getData(url: 'cityinfo.php');

      for (var element in response2.data) {
        dropCityItems.add(element['city']);
      }
      print(dropCityItems);
      print(dropGoverItems);
    } catch (e) {
      print('Error while fetching data: $e');
    }

    update();
  }

  // api إنشاء حساب
  void sendData(username, name, address, mail, phone, whatsapp, government,
      city, type, gender, password) async {
    try {
      final response = await DioHelper.postData(
        url: 'posts.php',
        data: {
          'username': username,
          'name': name,
          'address': address,
          'mail': mail,
          'phone': phone,
          'whatsapp': whatsapp,
          'government': government,
          'city': city,
          'type': type,
          'gender': gender,
          'password': password,
        },
      );

      print('Response: ${response.data}');
    } catch (e) {
      print('Error sending data: $e');
    }
  }

  //api تسجيل الدخول
  var isLoading = false; // حالة التحميل
  var errorMessage = ''; // لتخزين رسالة الخطأ عند حدوث أي خطأ
  var user = Map<String, dynamic>(); // لتخزين بيانات المستخدم عند تسجيل الدخول
  Future<void> login(String username, String password) async {
    isLoading = true; // بدء عملية التحميل
    errorMessage = ''; // مسح أي رسالة خطأ سابقة
    Map<String, dynamic> data = {
      'username': username,
      'password': password,
    };
    try {
      // استدعاء API تسجيل الدخول باستخدام DioHelper
      var response = await DioHelper.postData(url: 'login.php', data: {
        'username': username,
        'password': password,
      }, headers: {
        'Content-Type': 'application/json',
      });

      // إذا كانت الاستجابة ناجحة
      if (response.statusCode == 200) {
        user = response.data['data']; // تخزين بيانات المستخدم في الحالة
        Get.snackbar('نجاح', 'تم تسجيل الدخول بنجاح',
            snackPosition: SnackPosition.BOTTOM);
      } else {
        errorMessage = response.data['message'] ?? 'حدث خطأ';
      }
    } catch (e) {
      errorMessage = 'حدث خطأ أثناء الاتصال بالـ API';
    } finally {
      isLoading = false; // إيقاف حالة التحميل
    }
  }
  //finish api

  List<Widget> gene(context) {
    return advdata!.map((item) => carouslerImage(item, context)).toList();
  }

  //.................................

  //....................................
  BannerAd? bannerAd;
  bool isloaded = false;

//.............................Advertising

  void loaded() {
    bannerAd = BannerAd(
        size: AdSize.banner,
        adUnitId: AdManager.bannerHome,
        listener: BannerAdListener(
          onAdLoaded: (ad) {
            isloaded = true;
          },
          onAdFailedToLoad: (ad, error) {
            ad.dispose();
          },
        ),
        request: AdRequest())
      ..load();
    update();
  }

  AppOpenAd? _appOpenAd;
  void showAppAdd() {
    try {
      AppOpenAd.load(
          adUnitId: AdManager.openAdd,
          request: AdRequest(),
          adLoadCallback: AppOpenAdLoadCallback(
            onAdLoaded: (ad) {
              _appOpenAd = ad;
              if (_appOpenAd != null) {
                _appOpenAd!.show();
              }
              ad.fullScreenContentCallback = FullScreenContentCallback(
                onAdWillDismissFullScreenContent: (ad) {
                  ad.dispose();
                },
                onAdFailedToShowFullScreenContent: (ad, error) {
                  ad.dispose();
                },
              );
            },
            onAdFailedToLoad: (error) {},
          ),
          orientation: AppOpenAd.orientationPortrait);
    } catch (e) {
      print(e);
    }
  }

//.............................

  int onboardingindex = 0;
  void onboardingnext(context) {
    try {
      if (onboardingindex < 3) {
        onboardingindex = onboardingindex + 1;
      } else {
        sharedPreferences.setInt('onboarding', 4);
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => FirstScreen(),
            ));
      }
      update();
    } catch (e) {
      print(e);
    }
  }

  void onboardingscape() {
    onboardingindex = 4;
    sharedPreferences.setInt('onboarding', 4);
    update();
  }

  void firstopen() {
    int x = sharedPreferences.getInt('onboarding')!;
    if (x.isNull) {
      onboardingindex = 0;
    } else {
      onboardingindex = x;
    }
    update();
  }

  //.....................................

  bool? logged = false;

//................. dropdowen for type of doctors signup
  List dropdoctorstype = ['اختر النوع', 'عيادة', 'صيدلية', 'معمل', 'مركز'];
  String? dropvaluedoctorstype = 'اختر النوع';
  void changedropdoctorstype(x) {
    dropvaluedoctorstype = x;
    update();
  }

//................. dropdowen for type of special signup
  List dropdoctorsspecial = ['اختر التخصص', 'باطنه', 'اسنان', 'كلي', 'عظام'];
  String? dropvaluedoctorspecial = 'اختر التخصص';
  void changedropdoctorsspecial(x) {
    dropvaluedoctorstype = x;
    update();
  }

//checkedbox..............................

  bool? isChecked = false;

  void changechecked(value) {
    isChecked = value;
    update();
  }

//...............................Datainfo
  List datainfo = [dataInformation(), offers()];

  int datainfoindex = 0;

  void changedatainfo(x) {
    datainfoindex = x;
    update();
  }
  //.............................

//....................imagepicker
  File? fImage;
  void getimage() async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      fImage = File(image!.path);
    } else {}
    update();
  }

  List<dynamic>? pharmacydata = [];

  void getPharmacyData() async {
    var response;
    CollectionReference pharmacy =
        FirebaseFirestore.instance.collection('pharmacy');
    response = await pharmacy.get();
    pharmacydata!.clear();
    response.docs.forEach((element) {
      pharmacydata!.add(element.data());
    });
    print(pharmacydata);
    loadingFirstPage();
  }

  List<dynamic>? laboratorydata = [];

  void getLaboratoryData() async {
    var response;
    CollectionReference laboratory =
        FirebaseFirestore.instance.collection('laboratory');
    response = await laboratory.get();
    laboratorydata!.clear();
    response.docs.forEach((element) {
      laboratorydata!.add(element.data());
    });
    print(laboratorydata);
    loadingFirstPage();
  }

  List<dynamic>? radiologydata = [];

  void getRadiologyData() async {
    var response;
    CollectionReference radiology =
        FirebaseFirestore.instance.collection('Radiology');
    response = await radiology.get();
    radiologydata!.clear();
    response.docs.forEach((element) {
      radiologydata!.add(element.data());
    });
    print(radiologydata);
    loadingFirstPage();
  }

  List<dynamic>? nursingdata = [];

  void getNursingData() async {
    var response;
    CollectionReference Nursing =
        FirebaseFirestore.instance.collection('nursing');
    response = await Nursing.get();
    nursingdata!.clear();
    response.docs.forEach((element) {
      nursingdata!.add(element.data());
    });
    print(nursingdata);
    loadingFirstPage();
  }

  List<dynamic>? advdata = [];

  void getAdvertisingData() async {
    var response;
    CollectionReference advertising =
        FirebaseFirestore.instance.collection('advertising');
    response = await advertising.get();
    advdata!.clear();
    response.docs.forEach((element) {
      advdata!.add(element.data());
    });
    print(advdata);
    loadingFirstPage();
  }

  bool? loaddatapharmacy = false;

  void loadingFirstPage() {
    if (pharmacydata!.isEmpty) {
      update();
    } else {
      loaddatapharmacy = true;
      update();
    }
  }

  RewardedAd? _rewardedAd;

  void loadRewardedAd() {
    RewardedAd.load(
      adUnitId: 'ca-app-pub-4590796117404315/2335170326',
      request: AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (RewardedAd ad) {
          print('Rewarded ad loaded.');
          _rewardedAd = ad;
        },
        onAdFailedToLoad: (LoadAdError error) {
          print('Rewarded ad failed to load: $error');
        },
      ),
    );
    showRewardedAd();
  }

  void showRewardedAd() {
    if (_rewardedAd != null) {
      _rewardedAd!.show(
        onUserEarnedReward: (AdWithoutView ad, RewardItem reward) {
          print('User earned reward: ${reward.amount} ${reward.type}');
        },
      );
      _rewardedAd = null; // قم بتفريغ الإعلان بعد عرضه.
    } else {
      print('The rewarded ad is not ready yet.');
    }
  }

  InterstitialAd? _interstitialAd;

  void loadInterstitialAd() {
    InterstitialAd.load(
      adUnitId:
          'ca-app-pub-4590796117404315/3850797518', // استبدل بـ معرف الوحدة الإعلانية الخاصة بك
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) {
          _interstitialAd = ad;
          print('Interstitial Ad Loaded');
        },
        onAdFailedToLoad: (LoadAdError error) {
          print('Interstitial Ad failed to load: $error');
        },
      ),
    );
  }

  void showInterstitialAd() {
    if (_interstitialAd != null) {
      _interstitialAd!.show();
      _interstitialAd = null; // إعادة تعيين الإعلان بعد عرضه
    } else {
      print('Interstitial Ad is not ready yet.');
    }
  }
}
