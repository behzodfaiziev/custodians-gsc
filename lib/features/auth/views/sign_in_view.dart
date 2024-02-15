import 'package:custodians/core/extensions/context_extension.dart';
import 'package:custodians/features/_main/view/main_view.dart';
import 'package:flutter/material.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(
            height: 5,
          ),
          const SizedBox(
            child: Column(
              children: [
                Text(
                  "Welcome To",
                  style: TextStyle(fontSize: 20),
                ),
                Text("Custodians",
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.w600)),
              ],
            ),
          ),
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(30)),
            child: SizedBox(
              height: 200,
              width: 300,
              child: Image.network(
                "https://picsum.photos/200/300",
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          ElevatedButton(
            onPressed: () {
              context.pushReplaceAll(const MainView());
            },
            style: ElevatedButton.styleFrom(
              elevation: 5,
              minimumSize: const Size(350, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              "Sign In",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
