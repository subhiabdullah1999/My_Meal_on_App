import 'package:My_Meal_on/core/class/crud.dart';
import 'package:get/get.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
  }
}
