class ViewAddressModel {
  int? id;
  String? address;
  int? userId;
  String? createdAt;
  String? updatedAt;
  String? city;
  String? street;
  String? building;
  String? contactNumber;
  String? longitude;
  String? latitude;

  ViewAddressModel(
      {this.id,
      this.address,
      this.userId,
      this.createdAt,
      this.updatedAt,
      this.city,
      this.street,
      this.building,
      this.contactNumber,
      this.longitude,
      this.latitude});

  ViewAddressModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    address = json['address'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    city = json['city'];
    street = json['street'];
    building = json['building'];
    contactNumber = json['contact_number'];
    longitude = json['longitude'];
    latitude = json['latitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['address'] = this.address;
    data['user_id'] = this.userId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['city'] = this.city;
    data['street'] = this.street;
    data['building'] = this.building;
    data['contact_number'] = this.contactNumber;
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    return data;
  }
}
