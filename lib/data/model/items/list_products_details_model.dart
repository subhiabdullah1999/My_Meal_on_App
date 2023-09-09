import 'package:My_Meal_on/data/model/items/prodacts_detail_model.dart';

class ListProductDetailsModel {
  List<dynamic>? listProdductsModel;

  ListProductDetailsModel({this.listProdductsModel});

  factory ListProductDetailsModel.fromJson(Map<String, dynamic> jsonData) {
    return ListProductDetailsModel(listProdductsModel: jsonData["data"]);
  }
}
