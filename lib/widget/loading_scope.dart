import 'package:case_app/constant/constant.dart';
import 'package:flutter/material.dart';

class LoadingScope extends StatelessWidget {
  final bool? isLoading;
  final Widget child;

  const LoadingScope({super.key, this.isLoading, required this.child});

  @override
  Widget build(BuildContext context) {
    if (isLoading == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (isLoading == false) {
      return const Center(
        child: Text(Constant.tryAgain),
      );
    } else {
      return child;
    }
  }
}
