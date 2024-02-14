import 'package:custodians/core/widgets/app_bar/base_app_bar.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
    );
  }

  BaseAppBar get appBar {
    return BaseAppBar(
      title: 'Profile',
      actions: [
        IconButton(
          icon: const Icon(
            Icons.settings,
            color: Colors.white,
          ),
          onPressed: () {},
        )
      ],
    );
  }
}
