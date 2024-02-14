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
                  Text(
                    "${user.name}",
                    style: TextBigStyle()
                  ),
                  Text(
                    "${user.bio}",
                    style: TextSmallStyle()
                  )
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
                  textAlign: TextAlign.center,
                  style: TextBigStyle()
                ),
                const Text("Ranking: 158/2000")
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("LeaderBoard:",style: TextSmallStyle(),),
                Text("#1 Izzettin Karasayar"),
                Text("#2 Celal Yeldus"),
                Text("#3 Lachin Talaei")
              ],
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20,right: 20,top: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("DashBoard",style: TextSmallStyle(),),
              GestureDetector(
                onTap: (){
                  print("calisiim");
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green,
                      ),
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: const Icon(Icons.sports_handball),
                    ),
                    const Text("Participated Events",
                        style: TextStyle(
                          fontSize: 16
                        ),),
                    const Icon(Icons.chevron_right,color: Colors.grey,size: 30,)
                  ],
                ),
              ),
              GestureDetector(
                onTap: (){
                  print("calisiim");
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green,
                      ),
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: const Icon(Icons.sports_handball),
                    ),
                    const Text("Participated Events",
                      style: TextStyle(
                          fontSize: 16
                      ),),
                    const Icon(Icons.chevron_right,color: Colors.grey,size: 30,)
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}


class TextSmallStyle extends TextStyle {
  @override
  // TODO: implement fontSize
  double? get fontSize => 12;
  @override
  // TODO: implement color
  Color? get color => Colors.grey;
}

class TextBigStyle extends TextStyle {
  @override
  // TODO: implement fontSize
  double? get fontSize => 20;
  @override
  // TODO: implement fontWeight
  FontWeight? get fontWeight => FontWeight.w600;
}
