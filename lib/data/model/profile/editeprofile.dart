class EditProfileModel {
  int? id;
  String? name;
  String? phone;
  String? email;
  String? role;
  List<Addresses>? addresses;

  EditProfileModel(
      {this.id, this.name, this.phone, this.email, this.role, this.addresses});

  EditProfileModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    role = json['role'];
    if (json['addresses'] != null) {
      addresses = <Addresses>[];
      json['addresses'].forEach((v) {
        addresses!.add(new Addresses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['role'] = this.role;
    if (this.addresses != null) {
      data['addresses'] = this.addresses!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Addresses {
  int? id;
  String? address;
  int? userId;
  String? createdAt;
  String? updatedAt;
  String? city;
  String? street;
  String? building;
  String? contactNumber;
  Null? longitude;
  Null? latitude;

  Addresses(
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

  Addresses.fromJson(Map<String, dynamic> json) {
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
