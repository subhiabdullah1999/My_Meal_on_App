class DetailseOrderModel {
  int? id;
  String? orderNumber;
  String? totalPrice;
  String? status;
  String? phone;
  String? email;
  String? address;
  String? city;
  String? street;
  String? building;
  String? contactNumber;
  String? latitude;
  String? longitude;
  String? orderedAt;
  int? tableReservation;
  String? reservationTime;
  int? withDelivery;
  String? cancellationReason;
  int? customerId;
  String? customerName;
  int? deliveryId;
  String? deliveryName;
  int? restaurantId;
  String? restaurantName;
  String? restaurantNameAr;
  String? restaurantAddress;
  String? restaurantAddressAr;
  String? restaurantImage;

  DetailseOrderModel(
      {this.id,
      this.orderNumber,
      this.totalPrice,
      this.status,
      this.phone,
      this.email,
      this.address,
      this.city,
      this.street,
      this.building,
      this.contactNumber,
      this.latitude,
      this.longitude,
      this.orderedAt,
      this.tableReservation,
      this.reservationTime,
      this.withDelivery,
      this.cancellationReason,
      this.customerId,
      this.customerName,
      this.deliveryId,
      this.deliveryName,
      this.restaurantId,
      this.restaurantName,
      this.restaurantNameAr,
      this.restaurantAddress,
      this.restaurantAddressAr,
      this.restaurantImage});

  DetailseOrderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderNumber = json['order_number'];
    totalPrice = json['total_price'];
    status = json['status'];
    phone = json['phone'];
    email = json['email'];
    address = json['address'];
    city = json['city'];
    street = json['street'];
    building = json['building'];
    contactNumber = json['contact_number'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    orderedAt = json['ordered_at'];
    tableReservation = json['table_reservation'];
    reservationTime = json['reservation_time'];
    withDelivery = json['with_delivery'];
    cancellationReason = json['cancellation_reason'];
    customerId = json['customer_id'];
    customerName = json['customer_name'];
    deliveryId = json['delivery_id'];
    deliveryName = json['delivery_name'];
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
    data['order_number'] = this.orderNumber;
    data['total_price'] = this.totalPrice;
    data['status'] = this.status;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['address'] = this.address;
    data['city'] = this.city;
    data['street'] = this.street;
    data['building'] = this.building;
    data['contact_number'] = this.contactNumber;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['ordered_at'] = this.orderedAt;
    data['table_reservation'] = this.tableReservation;
    data['reservation_time'] = this.reservationTime;
    data['with_delivery'] = this.withDelivery;
    data['cancellation_reason'] = this.cancellationReason;
    data['customer_id'] = this.customerId;
    data['customer_name'] = this.customerName;
    data['delivery_id'] = this.deliveryId;
    data['delivery_name'] = this.deliveryName;
    data['restaurant_id'] = this.restaurantId;
    data['restaurant_name'] = this.restaurantName;
    data['restaurant_name_ar'] = this.restaurantNameAr;
    data['restaurant_address'] = this.restaurantAddress;
    data['restaurant_address_ar'] = this.restaurantAddressAr;
    data['restaurant_image'] = this.restaurantImage;
    return data;
  }
}
