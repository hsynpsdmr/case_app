import 'package:case_app/util/shared_preferences_helper.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

extension ContextExtension on BuildContext {
  Future<SharedPreferences> get sPref async => await SharedPreferencesHelper.getInstance();
}
