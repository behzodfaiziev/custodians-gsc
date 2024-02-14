import 'package:custodians/core/widgets/app_bar/base_app_bar.dart';
import 'package:custodians/features/profile/views/modules/profile_body.dart';
import 'package:flutter/material.dart';

import '../../../product/models/user/user_model.dart';
import '../controller/profile_controller.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final ProfileController _profileController = ProfileController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: FutureBuilder<UserModel>(
        future: _profileController.getProfile(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ProfileBody(user: snapshot.data!);
          }

          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  BaseAppBar get appBar {
    return const BaseAppBar(
      title: 'Profile',
      // actions: [
      //   IconButton(
      //     icon: const Icon(
      //       Icons.settings,
      //       color: Colors.white,
      //     ),
      //     onPressed: () {},
      //   )
      // ],
    );
  }
}
