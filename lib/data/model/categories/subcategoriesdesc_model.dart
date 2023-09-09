class SubCategoriesDescrModel {
  int? id;
  String? name;
  String? nameAr;
  String? description;
  String? descriptionAr;
  String? price;
  String? image;
  String? discountPrice;
  Null? unit;
  String? restaurant;
  String? restaurantAr;
  int? restaurantId;
  SubCategories? subCategories;
  List<Categories>? categories;

  SubCategoriesDescrModel(
      {this.id,
      this.name,
      this.nameAr,
      this.description,
      this.descriptionAr,
      this.price,
      this.image,
      this.discountPrice,
      this.unit,
      this.restaurant,
      this.restaurantAr,
      this.restaurantId,
      this.subCategories,
      this.categories});

  SubCategoriesDescrModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nameAr = json['name_ar'];
    description = json['description'];
    descriptionAr = json['description_ar'];
    price = json['price'];
    image = json['image'];
    discountPrice = json['discount price'];
    unit = json['unit'];
    restaurant = json['restaurant'];
    restaurantAr = json['restaurant_ar'];
    restaurantId = json['restaurant_id'];
    subCategories = json['subCategories'] != null
        ? new SubCategories.fromJson(json['subCategories'])
        : null;
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
    data['description'] = this.description;
    data['description_ar'] = this.descriptionAr;
    data['price'] = this.price;
    data['image'] = this.image;
    data['discount price'] = this.discountPrice;
    data['unit'] = this.unit;
    data['restaurant'] = this.restaurant;
    data['restaurant_ar'] = this.restaurantAr;
    data['restaurant_id'] = this.restaurantId;
    if (this.subCategories != null) {
      data['subCategories'] = this.subCategories!.toJson();
    }
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SubCategories {
  int? id;
  String? name;
  String? nameAr;
  String? image;

  SubCategories({this.id, this.name, this.nameAr, this.image});

  SubCategories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nameAr = json['name_ar'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['name_ar'] = this.nameAr;
    data['image'] = this.image;
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
