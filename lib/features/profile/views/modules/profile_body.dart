import 'package:flutter/material.dart';

import '../../../../product/models/user/user_model.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key, required this.user});

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.network(
                  "${user.imageUrl}",
                  height: 110,
                  width: 110,
                  fit: BoxFit.cover,
                ),
              ),
              Column(
                children: [
                  Text("${user.name}", style: TextBigStyle()),
                  Text("${user.bio}", style: TextSmallStyle())
                ],
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.edit),
                color: const Color(0x909090FF),
              )
            ],
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Participated\nEvents:\n${user.participatedEvents}",
                    textAlign: TextAlign.center, style: TextBigStyle()),
                Text("Ranking: ${user.ranking}")
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "LeaderBoard:",
                  style: TextSmallStyle(),
                ),
                Text("#1 ${user.leaders![0]}"),
                Text("#2 ${user.leaders![1]}"),
                Text("#3 ${user.leaders![2]}")
              ],
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "DashBoard",
                style: TextSmallStyle(),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  color: ThemeData.light().canvasColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.green,
                        ),
                        padding: EdgeInsets.all(8),
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                        child: const Icon(Icons.sports_handball),
                      ),
                      const Text(
                        "Participated Events",
                        style: TextStyle(fontSize: 16),
                      ),
                      const Icon(
                        Icons.chevron_right,
                        color: Colors.grey,
                        size: 30,
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  print("calisiim");
                },
                child: Container(
                  color: ThemeData.light().canvasColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.yellow[600],
                        ),
                        padding: const EdgeInsets.all(8),
                        margin: const EdgeInsets.fromLTRB(10, 5, 10, 15),
                        child: const Icon(Icons.workspace_premium_outlined),
                      ),
                      const Text(
                        "Achievements",
                        style: TextStyle(fontSize: 16),
                      ),
                      const Icon(
                        Icons.chevron_right,
                        color: Colors.grey,
                        size: 30,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 50,
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "My account",
                style: TextSmallStyle(),
              ),
              TextButton(
                  onPressed: () {

                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                      alignment: Alignment.centerLeft
                  ),
                  child: const Text(
                    "Log Out",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 16,
                    ),
                  ))
            ],
          ),
        )
      ],
    );
  }
}

class TextSmallStyle extends TextStyle {
  @override
  double? get fontSize => 12;

  @override
  Color? get color => Colors.grey;
}

class TextBigStyle extends TextStyle {
  @override
  double? get fontSize => 20;

  @override
  FontWeight? get fontWeight => FontWeight.w600;
}

