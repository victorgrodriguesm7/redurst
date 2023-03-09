import 'dart:convert';

class UserModel {
  String username;
  String password;

  UserModel({
    this.username = "",
    this.password = ""
  });

  String? validateUsername(String? username){
    if (username == null || username.isEmpty){
      return "Username is mandatory";
    }
    
    return null;
  }

  String? validatePassword(String? password){
    if (password == null || password.isEmpty){
      return "Password is mandatory";
    }

    return null;
  }

  bool isValid(){
    return validateUsername(username) == null && validatePassword(password) == null;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'password': password,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      username: map['username'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
