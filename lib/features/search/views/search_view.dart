import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'modules/search_list_view.dart';

part 'search_view_mixin.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> with SearchViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SearchListView(resultList: _resultList),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
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
    );
  }
}
