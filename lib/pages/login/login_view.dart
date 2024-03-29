import 'package:case_app/constant/constant.dart';
import 'package:case_app/model/token_model.dart';
import 'package:case_app/pages/login/login_controller.dart';
import 'package:case_app/pages/login/login_model.dart';
import 'package:case_app/pages/login/login_service.dart';
import 'package:case_app/pages/participants/participants_view.dart';
import 'package:case_app/util/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginController = ChangeNotifierProvider((ref) => LoginController());

class LoginView extends ConsumerWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: FlutterLogin(
        title: Constant.appName,
        logo: const AssetImage(Constant.logoPath),
        onLogin: (data) async {
          TokenModel? tokenModel = await LoginService().login(LoginModel(email: data.name, password: data.password));
          if (tokenModel?.token != null) {
            if (context.mounted) {
              context.sPref.then((value) => value.setString(Constant.tokenKey, tokenModel!.token!));
              ref.read(loginController).setToken(tokenModel?.token);
            }
            return null;
          } else {
            return tokenModel?.error;
          }
        },
        onSubmitAnimationCompleted: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => const ParticipantsView(),
          ));
        },
        onRecoverPassword: (_) {
          return null;
        },
        hideForgotPasswordButton: true,
      ),
    );
  }
}
