import 'package:My_Meal_on/core/class/statusRequest.dart';

handlingData(response) {
  if (response == StatusRequest) {
    return response;
  } else {
    return StatusRequest.success;
  }
}
