class LoginModel {
  final String email;
  final String password;

  const LoginModel({required this.email, required this.password});
}

class RegisterModel {
  final String email;
  final String password;
  final String firstname;
  final String lastname;
  final String confirmPassword;


  const RegisterModel(this.firstname, this.lastname, this.confirmPassword, {required this.email, required this.password});
}