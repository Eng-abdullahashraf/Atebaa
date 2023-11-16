import 'package:atebaa/controller/homecontroller.dart';
import 'package:get/get.dart';


class DependencyInjection {

  static void init() {
    Get.put<homecontroller>(homecontroller(),permanent:true);
  }
}