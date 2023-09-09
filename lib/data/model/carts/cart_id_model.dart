class CartIdModel {
  int? id;
  int? amount;
  String? price;
  int? foodId;
  String? foodName;
  String? foodNameAr;
  String? foodImage;
  String? subCategory;
  String? delivery;
  int? restaurantId;
  String? restaurantName;
  String? restaurantNameAr;
  String? restaurantAddress;
  String? restaurantAddressAr;
  String? restaurantImage;

  CartIdModel(
      {this.id,
      this.amount,
      this.price,
      this.foodId,
      this.foodName,
      this.foodNameAr,
      this.foodImage,
      this.subCategory,
      this.delivery,
      this.restaurantId,
      this.restaurantName,
      this.restaurantNameAr,
      this.restaurantAddress,
      this.restaurantAddressAr,
      this.restaurantImage});

  CartIdModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    amount = json['amount'];
    price = json['price'];
    foodId = json['food_id'];
    foodName = json['food_name'];
    foodNameAr = json['food_name_ar'];
    foodImage = json['food_image'];
    subCategory = json['sub category'];
    delivery = json['delivery'];
    restaurantId = json['restaurant_id'];
    restaurantName = json['restaurant_name'];
    restaurantNameAr = json['restaurant_name_ar'];
    restaurantAddress = json['restaurant_address'];
    restaurantAddressAr = json['restaurant_address_ar'];
    restaurantImage = json['restaurant_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['amount'] = this.amount;
    data['price'] = this.price;
    data['food_id'] = this.foodId;
    data['food_name'] = this.foodName;
    data['food_name_ar'] = this.foodNameAr;
    data['food_image'] = this.foodImage;
    data['sub category'] = this.subCategory;
    data['delivery'] = this.delivery;
    data['restaurant_id'] = this.restaurantId;
    data['restaurant_name'] = this.restaurantName;
    data['restaurant_name_ar'] = this.restaurantNameAr;
    data['restaurant_address'] = this.restaurantAddress;
    data['restaurant_address_ar'] = this.restaurantAddressAr;
    data['restaurant_image'] = this.restaurantImage;
    return data;
  }
}
