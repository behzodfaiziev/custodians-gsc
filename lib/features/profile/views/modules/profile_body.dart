import 'package:flutter/material.dart';

import '../../../../product/models/user/user_model.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key, required this.user});

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Text('Profile Body'),
          Text('Name: ${user.name}'),
        ],
      ),
    );
  }
}
