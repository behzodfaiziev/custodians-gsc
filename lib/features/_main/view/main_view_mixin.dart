part of 'main_view.dart';

mixin MainViewMixin on State<MainView> {
  int _selectedIndex = 0;
    final List<Widget> _views = <Widget>[
    const FeedView(),
    const SearchView(),
    const MapsView(),
    const ProfileView()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<BottomNavigationBarItem> get items {
    return [
      const BottomNavigationBarItem(
        icon: Icon(Icons.home_filled),
        label: 'Home',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.search),
        label: 'Search',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.location_on_outlined),
        label: 'Maps',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: 'Profile',
      ),
    ];
  }
}
