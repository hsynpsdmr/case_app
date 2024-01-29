import 'package:case_app/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:lottie/lottie.dart';

class ConnectionScope extends StatelessWidget {
  final Widget child;
  const ConnectionScope({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return OfflineBuilder(
      connectivityBuilder: (BuildContext context, ConnectivityResult connectivity, Widget child) {
        if (connectivity == ConnectivityResult.none) {
          return Container(
            color: Colors.white,
            child: Center(
              child: Lottie.asset(Constant.noInternetPath),
            ),
          );
        } else {
          return child;
        }
      },
      builder: (BuildContext context) {
        return child;
      },
    );
  }
}
