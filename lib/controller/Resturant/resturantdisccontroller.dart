import 'package:My_Meal_on/core/class/statusRequest.dart';
import 'package:My_Meal_on/core/constans/appNameRouts.dart';
import 'package:My_Meal_on/core/functions/handlingdatacontroller.dart';
import 'package:My_Meal_on/core/services/services.dart';
import 'package:My_Meal_on/data/datasource/remote/home/categories_data.dart';
import 'package:My_Meal_on/data/datasource/remote/home/csubcategoriesdescrhomedata.dart';
import 'package:My_Meal_on/data/datasource/remote/resturant/resturant.dart';
import 'package:My_Meal_on/data/model/Home/homemodel.dart';
import 'package:My_Meal_on/data/model/categories/allfood_in_sub_cat_model.dart';
import 'package:My_Meal_on/data/model/items/items_model.dart';
import 'package:My_Meal_on/data/model/resturantFood/all_food_inrestaurant_model.dart';
import 'package:get/get.dart';

abstract class ResturantDiscController extends GetxController {
  goBack();

  initData();
  gotoNotification();
  addIcon(List itemsModel, int idprud);
}

class ResturantDiscControllerImp extends ResturantDiscController {
  MyServices myServices = Get.find();
  SubCategDescrData subCategDescrData = SubCategDescrData(Get.find());
  CategoriesData categories = CategoriesData(Get.find());
  ResturantData resturantData = ResturantData(Get.find());

  late String username;
  late String phone;
  late String id;
  late String password;

  CategoriesData homeData = CategoriesData(Get.find());

  List<AllFoodInResturantModel> listAllFoodInRest = [];

  //  List data = Get.arguments['selected'];
  List data = [];
  List listSubCatDescModel = [];
  List<ItemsModel> itemsModel = [];
  List<AllFoodInSubCategoriestModel> listFoodSub = [];
  late List<HomeModel> listresturantDetailes;
  late int i;
  String categoriesId = "1";
  late String restaurantId;
  late String subCatId;

  bool isLoad = false;
  int selectedCategories = 0;

  StatusRequest statusRequest = StatusRequest.none;
  @override
  @override
  initData() async {
    username = myServices.sharedPreferences.getString("username")!;
    id = myServices.sharedPreferences.getString("id")!;
    phone = myServices.sharedPreferences.getString("phone")!;
    password = myServices.sharedPreferences.getString("password")!;
  }

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

  getSubCategoriesDescr(restaurantId, catId) async {
    var response =
        await resturantData.allFoodInSubCategoriestData(restaurantId, catId);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        itemsModel.clear();
        listSubCatDescModel.clear();
        listSubCatDescModel = response['data']['foods']['data'];
        print("fdsgsdddddddddddddddddddd");
        print(listSubCatDescModel);
        print("fdsgsdddddddddddddddddddd");

        listFoodSub.addAll(listSubCatDescModel
            .map((e) => AllFoodInSubCategoriestModel.fromJson(e)));

        isLoad = false;
      } else {
        statusRequest = StatusRequest.faliure;
      }
    }
    update();
  }

  getAllFoodInRest() async {
    statusRequest = StatusRequest.loading;
    var response = await resturantData.allFoodInResturantData(restaurantId);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      print("stryruieiiiiiiiiiiiiiwwwwwwwwwwww");

      if (response['status'] == 'success') {
        print("stryruieiiiiiiiiiiiiiwwwwwwwwwwww");
        List foodData = response['data']["foods"]['data'];
        print("stryruieiiiiiiiiiiiiiwwwwwwwwwwww");
        print(foodData);
        print("stryruieiiiiiiiiiiiiiwwwwwwwwwwww");

        listAllFoodInRest
            .addAll(foodData.map((e) => AllFoodInResturantModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.faliure;
      }
    }
    update();
  }

  @override
  void onInit() {
    initData();
    getCategoriesData();
    restaurantId = Get.arguments["restaurantId"];
    i = Get.arguments["selected"];
    listresturantDetailes = Get.arguments['listaData'];

    subCatId = listresturantDetailes[i].subCategories![0].id.toString();

    getSubCategoriesDescr(restaurantId, subCatId);

    print("ttttttttrrrrrrrrrrrrrrrrrr");
    print(restaurantId);
    print(subCatId);
    print("ttttttttrrrrrrrrrrrrrrrrrr");

    getAllFoodInRest();

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
