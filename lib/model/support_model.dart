import 'dart:convert';

SupportModel supportModelFromJson(String str) => SupportModel.fromJson(json.decode(str));

String supportModelToJson(SupportModel data) => json.encode(data.toJson());

class SupportModel {
  String url;
  String text;

  SupportModel({
    required this.url,
    required this.text,
  });

  factory SupportModel.fromJson(Map<String, dynamic> json) => SupportModel(
        url: json["url"],
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "text": text,
      };
}
