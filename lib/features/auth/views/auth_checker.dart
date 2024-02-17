import 'package:custodians/core/extensions/context_extension.dart';
import 'package:custodians/features/auth/controller/auth_controller.dart';
import 'package:custodians/features/auth/views/sign_in_view.dart';
import 'package:flutter/material.dart';

import '../../_main/view/main_view.dart';

class AuthChecker extends StatefulWidget {
  const AuthChecker({super.key});

  @override
  State<AuthChecker> createState() => _AuthCheckerState();
}

class _AuthCheckerState extends State<AuthChecker> {
  final AuthController _authController = AuthController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final user = await _authController.currentUser();
      if (context.mounted) {
        context.pushReplaceAll(
          user != null ? const MainView() : const SignInView(),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator.adaptive(),
      ),
    );
  }
}
