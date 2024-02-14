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
      BottomNavigationBarItem(
        icon: Icon(
          _selectedIndex == 0 ? Icons.home_filled : Icons.home_outlined,
          size: _selectedIndex == 0 ? 28 : 24,
        ),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(
          _selectedIndex == 1 ? Icons.search : Icons.search_outlined,
          size: _selectedIndex == 1 ? 28 : 24,
        ),
        label: 'Search',
      ),
      BottomNavigationBarItem(
        icon: Icon(
          _selectedIndex == 2 ? Icons.location_on : Icons.location_on_outlined,
          size: _selectedIndex == 2 ? 28 : 24,
        ),
        label: 'Maps',
      ),
      BottomNavigationBarItem(
        icon: Icon(
          _selectedIndex == 3 ? Icons.person : Icons.person_outline,
          size: _selectedIndex == 3 ? 28 : 24,
        ),
        label: 'Profile',
      ),
    ];
  }
}
