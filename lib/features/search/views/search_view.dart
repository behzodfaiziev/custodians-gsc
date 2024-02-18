import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  List _allResults = [];
  List _resultList = [];

  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    _searchController.addListener(_onSearchChanged);
    super.initState();
  }

  _onSearchChanged() {
    searchResultList();
  }

  getClientStream() async {
    var data = await FirebaseFirestore.instance
        .collection('reports')
        .orderBy('title')
        .get();

    setState(() {
      _allResults = data.docs;
    });
        searchResultList();

  }

  searchResultList() {
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
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    getClientStream();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: CupertinoSearchTextField(
            controller: _searchController,
          )),
      body: ListView.builder(
        itemCount: _resultList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              _resultList[index]['title'],
            ),
            subtitle: Text(
              _resultList[index]['date'],
            ),
            trailing: Text(
              _resultList[index]['location'],
            ),
          );
        },
      ),
    );
  }
}
