import 'dart:convert';

import 'package:case_app/model/support_model.dart';
import 'package:case_app/pages/participants/participants_model.dart';

DetailModel detailModelFromJson(String str) => DetailModel.fromJson(json.decode(str));

String detailModelToJson(DetailModel data) => json.encode(data.toJson());

class DetailModel {
  int page;
  int perPage;
  int total;
  int totalPages;
  List<ParticipantsModel> data;
  SupportModel support;

  DetailModel({
    required this.page,
    required this.perPage,
    required this.total,
    required this.totalPages,
    required this.data,
    required this.support,
  });

  factory DetailModel.fromJson(Map<String, dynamic> json) => DetailModel(
        page: json["page"],
        perPage: json["per_page"],
        total: json["total"],
        totalPages: json["total_pages"],
        data: List<ParticipantsModel>.from(json["data"].map((x) => ParticipantsModel.fromJson(x))),
        support: SupportModel.fromJson(json["support"]),
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "per_page": perPage,
        "total": total,
        "total_pages": totalPages,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "support": support.toJson(),
      };
}
