import 'package:My_Meal_on/core/class/statusRequest.dart';
import 'package:My_Meal_on/core/constans/appNameRouts.dart';
import 'package:My_Meal_on/core/functions/handlingdatacontroller.dart';
import 'package:My_Meal_on/core/services/services.dart';
import 'package:My_Meal_on/data/datasource/remote/categories/search_categories_data.dart';
import 'package:My_Meal_on/data/datasource/remote/home/categories_data.dart';
import 'package:My_Meal_on/data/model/categories/allfood_in_sub_cat_model.dart';
import 'package:My_Meal_on/data/model/items/items_model.dart';
import 'package:get/get.dart';

abstract class CategoriesDiscController extends GetxController {
  goBack();
  // getData();
  initData();
  goToResturantDescScreen();
  gotoNotification();
}

class CategoriesDiscControllerImp extends CategoriesDiscController {
  MyServices myServices = Get.find();

  List<ItemsModel> listresturantDetailes = Get.arguments['listaData'];
  late int i;

  late String id;
  late String subCatId;

  CategoriesData homeData = CategoriesData(Get.find());
  SubCategoriesData subCategoriesData = SubCategoriesData(Get.find());

  StatusRequest statusRequest = StatusRequest.none;

  List<AllFoodInSubCategoriestModel> listfoodSubCat = [];

  @override
  initData() {}

  @override
  void onInit() {
    i = Get.arguments['selected'];
    subCatId = Get.arguments['subCatId'];
    getSubCategoriesDescr(subCatId);
    super.onInit();
  }

  @override
  goToResturantDescScreen() {
    Get.toNamed(
      AppRoutsName.bottmapbarcategoriesdescr,
    );
  }

  @override
  goBack() {
    Get.back();
  }

  addIcon(itemsModel, idprud) {
    Get.toNamed(AppRoutsName.itemsDetails,
        arguments: {"itemsModel": itemsModel, "id": idprud});
  }

  @override
  gotoNotification() {
    Get.toNamed(AppRoutsName.notification);
  }

  getSubCategoriesDescr(subCatId) async {
    var response = await subCategoriesData.getFoodInSubCategoriesData(subCatId);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        print("DDDDDDDDFFFFFFFFFFFFFFFFFFFFFFFFFSsssssssssssssss");

        List listSubCatDescModel = response['data']['foods']['data'];

        listfoodSubCat.addAll(listSubCatDescModel
            .map((e) => AllFoodInSubCategoriestModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.faliure;
      }
    }
    update();
  }
}
