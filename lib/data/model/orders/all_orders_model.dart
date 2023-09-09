class AllOrdersModel {
  int? id;
  String? name;
  String? nameAr;
  String? phone;
  String? information;
  String? informationAr;
  String? description;
  String? descriptionAr;
  String? address;
  String? addressAr;
  String? latitude;
  String? longitude;
  String? image;
  String? openingTime;
  String? closingTime;
  String? rate;
  String? offer;
  String? closedRestaurant;
  String? availableDelivery;
  String? deliveryPrice;
  String? isOpen;
  List<Categories>? categories;

  AllOrdersModel(
      {this.id,
      this.name,
      this.nameAr,
      this.phone,
      this.information,
      this.informationAr,
      this.description,
      this.descriptionAr,
      this.address,
      this.addressAr,
      this.latitude,
      this.longitude,
      this.image,
      this.openingTime,
      this.closingTime,
      this.rate,
      this.offer,
      this.closedRestaurant,
      this.availableDelivery,
      this.deliveryPrice,
      this.isOpen,
      this.categories});

  AllOrdersModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nameAr = json['name_ar'];
    phone = json['phone'];
    information = json['information'];
    informationAr = json['information_ar'];
    description = json['description'];
    descriptionAr = json['description_ar'];
    address = json['address'];
    addressAr = json['address_ar'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    image = json['image'];
    openingTime = json['opening_time'];
    closingTime = json['closing_time'];
    rate = json['rate'];
    offer = json['offer'];
    closedRestaurant = json['closed_restaurant'];
    availableDelivery = json['available_delivery'];
    deliveryPrice = json['delivery_price'];
    isOpen = json['is_open'];
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['name_ar'] = this.nameAr;
    data['phone'] = this.phone;
    data['information'] = this.information;
    data['information_ar'] = this.informationAr;
    data['description'] = this.description;
    data['description_ar'] = this.descriptionAr;
    data['address'] = this.address;
    data['address_ar'] = this.addressAr;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['image'] = this.image;
    data['opening_time'] = this.openingTime;
    data['closing_time'] = this.closingTime;
    data['rate'] = this.rate;
    data['offer'] = this.offer;
    data['closed_restaurant'] = this.closedRestaurant;
    data['available_delivery'] = this.availableDelivery;
    data['delivery_price'] = this.deliveryPrice;
    data['is_open'] = this.isOpen;
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Categories {
  int? id;
  String? name;
  String? nameAr;
  String? image;
  String? createdAt;
  String? updatedAt;

  Categories(
      {this.id,
      this.name,
      this.nameAr,
      this.image,
      this.createdAt,
      this.updatedAt});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nameAr = json['name_ar'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['name_ar'] = this.nameAr;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
