import 'package:redrust/src/shared/dto/auth_dto.dart';
import 'package:redrust/src/shared/models/user_model.dart';

import 'package:http/http.dart' as http;

class AuthRepository {
  final String baseUrl = "https://ulrichsocialapi.onrender.com/auth";

  Future<AuthDto> login(UserModel user) async {
    Uri url = Uri.parse("$baseUrl/login");
    http.Response response = await http.post(url, body: user.toMap());

    if (response.statusCode == 200){
      return AuthDto.fromJson(response.body);
    }
    
    throw Exception(response.reasonPhrase ?? "Error on Login");
  }
}