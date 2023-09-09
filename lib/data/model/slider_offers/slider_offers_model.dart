class SliderOffersModel {
  String? image;
  int? restaurantId;
  String? restaurantName;
  String? restaurantNameAr;
  String? restaurantAddress;
  String? restaurantAddressAr;

  SliderOffersModel(
      {this.image,
      this.restaurantId,
      this.restaurantName,
      this.restaurantNameAr,
      this.restaurantAddress,
      this.restaurantAddressAr});

  SliderOffersModel.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    restaurantId = json['restaurant_id'];
    restaurantName = json['restaurant_name'];
    restaurantNameAr = json['restaurant_name_ar'];
    restaurantAddress = json['restaurant_address'];
    restaurantAddressAr = json['restaurant_address_ar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['restaurant_id'] = this.restaurantId;
    data['restaurant_name'] = this.restaurantName;
    data['restaurant_name_ar'] = this.restaurantNameAr;
    data['restaurant_address'] = this.restaurantAddress;
    data['restaurant_address_ar'] = this.restaurantAddressAr;
    return data;
  }
}
