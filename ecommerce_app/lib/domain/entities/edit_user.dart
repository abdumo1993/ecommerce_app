class EditUserModel {
  String? email;
  String? oldPassword;
  String? firstname;
  String? lastname;
  String? newPassword;
  String? phone;
  EditUserModel({
    this.email,
    this.oldPassword,
    this.firstname,
    this.lastname,
    this.newPassword,
    this.phone,
  });

  Map<String, String> toJson() {
    return {
      if (email != null && email != "") "email": email!,
      if (phone != null && phone != "") "phoneNumber": phone!,
      if (oldPassword != null && oldPassword != "") "newPassword": oldPassword!,
      if (firstname != null && firstname != "") "firstName": firstname!,
      if (lastname != null && lastname != "") "lastName": lastname!,
      if (newPassword != null && newPassword != "") "oldPassword": newPassword!,
    };
  }
}

class GetUserModel {
  String? id;
  String? firstname;
  String? lastname;
  String? email;
  String? defaultShippingAddress;
  String? billingAddress;
  String? phoneNumber;
  String? role;
  GetUserModel({
    this.id,
    this.firstname,
    this.lastname,
    this.email,
    this.defaultShippingAddress,
    this.billingAddress,
    this.phoneNumber,
  });

  GetUserModel fromJson(Map<String, dynamic> json) {
    GetUserModel user = GetUserModel();
    if (json['id'] != null && json['id'] != "") user.id = json['id'];
    if (json['role'] != null && json['role'] != "") user.role = json['role'];
    if (json['firstName'] != null && json['firstName'] != "")
      user.firstname = json['firstName'];
    if (json['lastName'] != null && json['lastName'] != "")
      user.lastname = json['lastName'];
    if (json['email'] != null && json['email'] != "")
      user.email = json['email'];
    if (json['defaultShippingAddress'] != null &&
        json['defaultShippingAddress'] != "")
      user.defaultShippingAddress = json['defaultShippingAddress'];
    if (json['billingAddress'] != null && json['billingAddress'] != "")
      user.billingAddress = json['billingAddress'];
    if (json['phoneNumber'] != null && json['phoneNumber'] != "")
      user.phoneNumber = json['phoneNumber'];
    return user;
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null && id != "") "id": id!,
      if (role != null && role != "") "role": role!,
      if (firstname != null && firstname != "") "firstname": firstname!,
      if (lastname != null && lastname != "") "lastname": lastname,
      if (email != null && email != "") "email": email,
      if (defaultShippingAddress != null && defaultShippingAddress != "")
        "defaultShippingAddress": defaultShippingAddress,
      if (billingAddress != null && billingAddress != "")
        "billingAddress": billingAddress,
      if (phoneNumber != null && phoneNumber != "") "phoneNumber": phoneNumber,
    };
  }
}
