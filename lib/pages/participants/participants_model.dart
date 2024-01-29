import 'dart:convert';

List<ParticipantsModel> userModelFromJson(String str) => List<ParticipantsModel>.from(json.decode(str).map((x) => ParticipantsModel.fromJson(x)));

String userModelToJson(List<ParticipantsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ParticipantsModel {
  int id;
  String email;
  String firstName;
  String lastName;
  String avatar;

  ParticipantsModel({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  factory ParticipantsModel.fromJson(Map<String, dynamic> json) => ParticipantsModel(
        id: json["id"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        avatar: json["avatar"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "avatar": avatar,
      };
}
