class EditUserModel {
  final String? email;
  final String? password;
  final String? firstname;
  final String? lastname;
  final String? confirmPassword;

  const EditUserModel({
    this.email,
    this.password,
    this.firstname,
    this.lastname,
    this.confirmPassword,
  });

  Map<String, String> toJson() {
    return {
      if (email != null && email != "") "Email": email!,
      if (password != null && password != "") "Password": password!,
      if (firstname != null && firstname != "") "FirstName": firstname!,
      if (lastname != null && lastname != "") "LastName": lastname!,
      if (confirmPassword != null && confirmPassword != "")
        "ConfirmPassword": confirmPassword!,
    };
  }
}
