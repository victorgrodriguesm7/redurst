import 'dart:convert';

class AuthDto {
  final String accessToken;

  AuthDto({
    required this.accessToken,
  });

  factory AuthDto.fromMap(Map<String, dynamic> map) {
    return AuthDto(
      accessToken: map['accessToken'] as String,
    );
  }
  factory AuthDto.fromJson(String source) => AuthDto.fromMap(json.decode(source) as Map<String, dynamic>);
}
