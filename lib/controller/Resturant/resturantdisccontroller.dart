import 'package:My_Meal_on/core/class/statusRequest.dart';
import 'package:My_Meal_on/core/constans/appNameRouts.dart';
import 'package:My_Meal_on/core/functions/handlingdatacontroller.dart';
import 'package:My_Meal_on/core/services/services.dart';
import 'package:My_Meal_on/data/datasource/remote/home/categories_data.dart';
import 'package:My_Meal_on/data/datasource/remote/home/csubcategoriesdescrhomedata.dart';
import 'package:My_Meal_on/data/datasource/remote/resturant/resturant.dart';
import 'package:My_Meal_on/data/model/Home/homemodel.dart';
import 'package:My_Meal_on/data/model/categories/allfood_in_sub_cat_model.dart';
import 'package:My_Meal_on/data/model/categories/sub_model.dart';
import 'package:My_Meal_on/data/model/items/items_model.dart';
import 'package:My_Meal_on/data/model/resturantFood/all_food_inrestaurant_model.dart';
import 'package:get/get.dart';

abstract class ResturantDiscController extends GetxController {
  goBack();

  gotoNotification();
  addIcon(List itemsModel, int idprud);
}

class ResturantDiscControllerImp extends ResturantDiscController {
  MyServices myServices = Get.find();
  SubCategDescrData subCategDescrData = SubCategDescrData(Get.find());
  CategoriesData categories = CategoriesData(Get.find());
  ResturantData resturantData = ResturantData(Get.find());

  late String id;
  late String password;

  CategoriesData homeData = CategoriesData(Get.find());

  List<AllFoodInSubCategoriestModel> listAllFoodInRest = [];

  //  List data = Get.arguments['selected'];
  List data = [];
  List listSubCatDescModel = [];
  List<ItemsModel> itemsModel = [];
  List<AllFoodInSubCategoriestModel> listFoodSub = [];
  List<SubModel> listFoodSubcat = [];

  late List<HomeModel> listresturantDetailes;
  late int i;
  String? categoriesId;
  late String restaurantId;
  late String subCatId;

  bool isLoad = false;
  int selectedCategories = 0;

  StatusRequest statusRequest = StatusRequest.none;

  getCategoriesData() async {
    statusRequest = StatusRequest.loading;
    var response = await categories.getData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        data.addAll(response['data']['subCategories']);
      } else {
        statusRequest = StatusRequest.faliure;
      }
    }
    update();
  }

  @override
  addIcon(itemsModel, idprud) {
    Get.toNamed(AppRoutsName.itemsDetails,
        arguments: {"itemsModel": itemsModel, "id": idprud});
  }

  getSubCategoriesDescr(
    restaurantId,
  ) async {
    var response = await resturantData.allFoodInSubCategoriestData(
      restaurantId,
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        isLoad;
        itemsModel.clear();
        listSubCatDescModel.clear();
        listFoodSub.clear();

        listSubCatDescModel = response['data']['SubCategories'];
        print("fdsgsdddddddddddddddddddd");
        print(listSubCatDescModel);
        print("fdsgsdddddddddddddddddddd");

        listFoodSubcat
            .addAll(listSubCatDescModel.map((e) => SubModel.fromJson(e)));

        isLoad = false;
      } else {
        statusRequest = StatusRequest.faliure;
      }
    }
    update();
  }

  getAllFoodInRest(String subcatId) async {
    statusRequest = StatusRequest.loading;
    var response =
        await resturantData.allFoodInResturantData(restaurantId, subcatId);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      print("stryruieiiiiiiiiiiiiiwwwwwwwwwwww");

      if (response['status'] == 'success') {
        isLoad = false;
        print("stryruieiiiiiiiiiiiiiwwwwwwwwwwww");
        listAllFoodInRest.clear();
        List foodData = response['data']["foods"]['data'];
        print(foodData);
        print("drtttsssssssssssssssssssssssssssrtvvvvvvvvvvvvvvv");

        listAllFoodInRest.addAll(
            foodData.map((e) => AllFoodInSubCategoriestModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.faliure;
      }
    }
    update();
  }

  @override
  void onInit() {
    getCategoriesData();
    restaurantId = Get.arguments["restaurantId"];
    i = Get.arguments["selected"];
    listresturantDetailes = Get.arguments['listaData'];

    subCatId = listresturantDetailes[i].subCategories![0].id.toString();

    getSubCategoriesDescr(restaurantId);

    print("ttttttttrrrrrrrrrrrrrrrrrr");
    print(subCatId);
    print(i);
    print(restaurantId);
    print(listresturantDetailes);

    print("ttttttttrrrrrrrrrrrrrrrrrr");

    getAllFoodInRest(subCatId);

    super.onInit();
  }

  onTaPCategories() {
    selectedCategories;
    update();
  }

  @override
  goBack() {
    Get.back();
  }

  @override
  gotoNotification() {
    Get.toNamed(AppRoutsName.notification);
  }
}
