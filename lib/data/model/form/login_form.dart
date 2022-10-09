class LoginForm {
  String email;
  String password;
  String? errorEmail;
  String? errorPassword;

  LoginForm(
      {required this.email,
      required this.password,
      this.errorEmail,
      this.errorPassword});
}
