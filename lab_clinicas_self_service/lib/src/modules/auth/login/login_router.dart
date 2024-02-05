import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

import '../../../services/user_login_service.dart';
import '../../../services/user_login_service_impl.dart';

import 'login_controller.dart';
import 'login_page.dart';

class LoginRouter extends FlutterGetItModulePageRouter {
  const LoginRouter({super.key});

  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton<UserLoginService>(
            (i) => UserLoginServiceImpl(userRepository: i())),
        Bind.lazySingleton((i) => LoginController(loginService: i())),
      ];

  @override
  WidgetBuilder get view => (_) => const LoginPage();
}
