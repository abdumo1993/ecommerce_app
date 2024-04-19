class AddressModel {
  int? addressId;
  String? street;
  String? city;
  String? state;
  String? country;
  String? postalCode;
  AddressModel({this.addressId, this.street, this.city, this.state, this.country, this.postalCode,});

  AddressModel fromJson(Map<String,dynamic> json) {
    AddressModel user  = AddressModel();
      if (json['addressId'] != null && json['addressId'] != "") user.addressId = json['addressId'];
      if (json['street'] != null && json['street'] != "") user.street = json['street'];
      if (json['city'] != null && json['city'] != "") user.city = json['city'];
      if (json['state'] != null && json['state'] != "") user.state = json['state'];
      if (json['country'] != null && json['country'] != "") user.country = json['country'];
      if (json['postalCode'] != null && json['postalCode'] != "") user.postalCode = json['postalCode'];
    return user;
  }
  Map<String, dynamic> toJson() {
    return{
      if (addressId != null && addressId != "") "addressId" : addressId!,
      if (street != null && street != "") "street" :street,
      if (city != null && city != "") "city" : city,
      if (state != null && state != "") "state" : state,
      if (country != null && country != "") "country" : country,
      if (postalCode != null && postalCode != "") "postalCode" : postalCode,
      };
  }
}
