import 'package:case_app/constant/constant.dart';
import 'package:case_app/pages/login/login_view.dart';
import 'package:case_app/pages/participants/participants_view.dart';
import 'package:case_app/util/context_extensions.dart';
import 'package:case_app/widget/connection_scope.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: Constant.appName,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
          useMaterial3: true,
        ),
        home: ConnectionScope(
          child: FutureBuilder<Widget>(
            future: goPage(context),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return snapshot.data!;
              } else if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
        ),
      ),
    );
  }

  Future<Widget> goPage(BuildContext context) async {
    return await context.sPref.then((value) => value.getString(Constant.tokenKey)).then((value) {
      if (value == null) {
        return const LoginView();
      } else {
        return const ParticipantsView();
      }
    });
  }
}
