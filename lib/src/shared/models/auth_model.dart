class AuthModel {
  String accessToken;
  bool isLogged;

  AuthModel({
    this.accessToken = "",
    this.isLogged = false
  });
}