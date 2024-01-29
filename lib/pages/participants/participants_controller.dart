import 'package:case_app/pages/participants/participants_model.dart';
import 'package:case_app/pages/participants/participants_service.dart';
import 'package:flutter/material.dart';

class ParticipantsController extends ChangeNotifier {
  bool? isLoading;
  List<ParticipantsModel?> users = [];

  void getData() {
    ParticipantsService.getParticipantDetail().then((value) {
      if (value != null) {
        users = value.data;
        isLoading = true;
        notifyListeners();
      } else {
        isLoading = false;
        notifyListeners();
      }
    });
  }
}
