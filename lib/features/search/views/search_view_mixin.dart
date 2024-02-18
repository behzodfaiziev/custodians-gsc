part of 'search_view.dart';

mixin SearchViewMixin on State<SearchView> {
  List _allResults = [];
  List _resultList = [];

  final TextEditingController _searchController = TextEditingController();
  bool _isSearching = false;

  @override
  void initState() {
    super.initState();
  }

  void getClientStream() async {
    var data = await FirebaseFirestore.instance
        .collection('reports')
        .orderBy('title')
        .get();

    setState(() {
      _allResults = data.docs;
    });
    searchResultList();
  }

  void searchResultList() {
    var showResult = [];
    if (_searchController.text != "") {
      for (var clientSnapShot in _allResults) {
        var title = clientSnapShot['title'].toString().toLowerCase();
        if (title.startsWith(_searchController.text.toLowerCase())) {
          showResult.add(clientSnapShot);
        }
      }
    }
    setState(() {
      _resultList = showResult;
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    getClientStream();
    super.didChangeDependencies();
  }

  void _toggleSearch() {
    setState(() {
      _isSearching = !_isSearching;
      if (!_isSearching) {
        _searchController.clear();
        searchResultList();
      }
    });
  }
}
