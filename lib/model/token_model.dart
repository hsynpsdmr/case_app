import 'dart:convert';

TokenModel tokenModelFromJson(String str) => TokenModel.fromJson(json.decode(str));

String tokenModelToJson(TokenModel data) => json.encode(data.toJson());

class TokenModel {
  String? token;
  String? error;

  TokenModel({
    required this.token,
    required this.error,
  });

  factory TokenModel.fromJson(Map<String, dynamic> json) => TokenModel(
        token: json["token"],
        error: json["error"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "error": error,
      };
}
