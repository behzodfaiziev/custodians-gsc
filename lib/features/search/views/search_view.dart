import 'package:custodians/features/report/views/report_details/report_details_view.dart';
import 'package:custodians/product/components/report_tile/report_tile.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../product/models/report/report_model.dart';
import 'package:custodians/core/extensions/context_extension.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  List _allResults = [];
  List _resultList = [];

  final TextEditingController _searchController = TextEditingController();
  bool _isSearching = false;

  @override
  void initState() {
    super.initState();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF54B532),
        titleSpacing: 0,
        title: Row(
          children: [
            IconButton(
              onPressed: () {
                _toggleSearch();
              },
              icon: const Icon(Icons.search, color: Colors.white),
            ),
            if (_isSearching)
              Expanded(
                child: Row(
                  children: [
                    const SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        controller: _searchController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search',
                          hintStyle: TextStyle(color: Colors.white),
                        ),
                        style: const TextStyle(color: Colors.white),
                        onChanged: (value) => searchResultList(),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        _searchController.clear();
                        searchResultList();
                        _toggleSearch(); 
                      },
                      icon: const Icon(Icons.clear, color: Colors.white),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: _resultList.length,
        itemBuilder: (context, index) {
          final report = ReportModel.fromJson(_resultList[index].data() as Map<String, dynamic>);
          return ReportTile(
            report: report,
            onTap: () {
              context.push(ReportDetailsView(report: report));
            },
          );
        },
      ),
    );
  }
}
