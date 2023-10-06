import 'package:flutter/material.dart';

class UserSearch extends StatefulWidget {
  @override
  _UserSearchState createState() => _UserSearchState();
}

class _UserSearchState extends State<UserSearch> {
  TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

   void _performSearch() {
    setState(() {
      _searchQuery = _searchController.text.toLowerCase();
      //untuk mencari akun yg mau dicari
      if (_searchQuery == 'humantwo') {
        _searchQuery = 'HumanTwo';
      } else if (_searchQuery == 'humanthree') {
        _searchQuery = 'HumanThree';
      } else if (_searchQuery == 'humanfour') {
        _searchQuery = 'HumanFour';
      } else if (_searchQuery == 'humanfive') {
        _searchQuery = 'HumanFive';
      } else if (_searchQuery == 'humanone') {
        _searchQuery = 'HumanOne';
      } else {
        _searchQuery = 'No results found for $_searchQuery';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Container(
            padding: EdgeInsets.all(8),
            color: Colors.grey[400],
            child: Row(
              children: [
                Icon(
                  Icons.search,
                  color: Colors.grey[500],
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle: TextStyle(color: Colors.grey[500]),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: ExploreGrid(searchQuery: _searchQuery),
      floatingActionButton: FloatingActionButton(
        onPressed: _performSearch,
        child: Icon(Icons.search),
      ),
    );
  }
}

class ExploreGrid extends StatelessWidget {
  final String searchQuery;

  const ExploreGrid({Key? key, required this.searchQuery}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        searchQuery.isEmpty ? 'Search for an account' : 'Search results for: $searchQuery',
        style: TextStyle(fontSize: 20.0),
      ),
    );
  }
}
