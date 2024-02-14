class OrderDetaModel {
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
  List<Orders>? orders;

  OrderDetaModel(
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
      this.restaurantImage,
      this.orders});

  OrderDetaModel.fromJson(Map<String, dynamic> json) {
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
    if (json['orders'] != null) {
      orders = <Orders>[];
      json['orders'].forEach((v) {
        orders!.add(new Orders.fromJson(v));
      });
    }
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
    if (this.orders != null) {
      data['orders'] = this.orders!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Orders {
  int? id;
  int? orderId;
  int? cartId;
  String? createdAt;
  String? updatedAt;

  Orders({this.id, this.orderId, this.cartId, this.createdAt, this.updatedAt});

  Orders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderId = json['order_id'];
    cartId = json['cart_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['order_id'] = this.orderId;
    data['cart_id'] = this.cartId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
