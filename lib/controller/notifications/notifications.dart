import 'package:get/get.dart';

abstract class NotificationController extends GetxController {
  goBack();
}

class NotificationControllerImp extends NotificationController {
  @override
  goBack() {
    Get.back();
  }
}
