class SubModel {
  int? id;
  String? name;
  String? nameAr;
  String? image;

  SubModel({this.id, this.name, this.nameAr, this.image});

  SubModel.fromJson(Map<String, dynamic> json) {
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
