class LoginModel {
  final String email;
  final String password;

  const LoginModel({required this.email, required this.password});

  Map<String, String> toJson () {
    return {
      "Email": email,
      "Password": password
    };
  }
}

class RegisterModel {
  final String email;
  final String password;
  final String firstname;
  final String lastname;
  final String confirmPassword;


  const RegisterModel({required this.email, required this.password, required this.firstname, required this.lastname, required this.confirmPassword, });

  Map<String, String> toJson () {
    return {
      "Email": email,
      "Password": password,
      "FirstName": firstname,
      "LastName": lastname,
      "ConfirmPassword": confirmPassword,
    };
  }


}