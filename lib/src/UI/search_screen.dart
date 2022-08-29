import 'package:electrops/src/UI/drawer/drawer_menu.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late TextEditingController searchTextController;

  @override
  void initState() {
    super.initState();
    searchTextController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          SizedBox(
            width: 300,
            child: TextField(
              controller: searchTextController,
            ),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [],
      ),
      drawer: DrawerWidget(),
    );
  }
}
