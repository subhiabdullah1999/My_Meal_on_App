class SubCategoriesModel {
  int? id;
  late String name;
  late String nameAr;
  String? image;

  SubCategoriesModel(
      {this.id, required this.name, required this.nameAr, this.image});

  SubCategoriesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nameAr = json['name_ar'];
    image = json['image'];
  }
}
