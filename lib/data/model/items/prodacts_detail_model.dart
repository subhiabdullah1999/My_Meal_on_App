import 'package:flutter/foundation.dart';

class ProductsDetailsModel {
  int? id;
  String? name;
  String? nameAr;
  String? description;
  String? descriptionAr;
  String? price;
  String? image;
  String? discount;
  String? restaurant;
  String? restaurantAr;

  ProductsDetailsModel(
      {this.id,
      this.name,
      this.nameAr,
      this.description,
      this.descriptionAr,
      this.price,
      this.image,
      this.discount,
      this.restaurant,
      this.restaurantAr});
  factory ProductsDetailsModel.fromJson(Map<String, dynamic> jsonData) {
    return ProductsDetailsModel(
      id: jsonData['id'],
      name: jsonData['name'],
      nameAr: jsonData['name_ar'],
      description: jsonData['description'],
      descriptionAr: jsonData['description_ar'],
      price: jsonData['price'],
      image: jsonData['image'],
      discount: jsonData['discount'],
      restaurant: jsonData['restaurant'],
      restaurantAr: jsonData['restaurant_ar'],
    );
  }
}
