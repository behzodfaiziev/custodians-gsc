import 'package:custodians/core/extensions/context_extension.dart';
import 'package:custodians/features/_main/view/main_view.dart';
import 'package:flutter/material.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: ElevatedButton(
          child: const Text('Sign In'),
          onPressed: () {
            context.pushReplaceAll(const MainView());
          }),
    ));
  }
}
