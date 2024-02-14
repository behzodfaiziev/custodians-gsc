import 'package:custodians/features/profile/views/profile_view.dart';
import 'package:custodians/features/search/views/search_view.dart';
import 'package:flutter/material.dart';

import '../../feed/views/feed_view.dart';
import '../../map/views/maps_view.dart';

part 'main_view_mixin.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> with MainViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _views.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          items: items,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
        ));
  }
}
